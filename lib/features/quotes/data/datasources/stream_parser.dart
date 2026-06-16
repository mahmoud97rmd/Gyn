// Path: lib/features/quotes/data/datasources/stream_parser.dart
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import '../models/stream_dto.dart';
import '../../../../core/domain/entities/tick_entity.dart';

class OandaStreamParser {
  final StringBuffer _buffer = StringBuffer();

  StreamTransformer<List<int>, StreamMessageDto> get transformer {
    return StreamTransformer<List<int>, StreamMessageDto>.fromHandlers(
      handleData: _handleChunk,
      handleError: _handleError,
      handleDone: _handleDone,
    );
  }

  void _handleChunk(List<int> chunk, EventSink<StreamMessageDto> sink) {
    final decoded = utf8.decode(chunk, allowMalformed: true);
    _buffer.write(decoded);

    final str = _buffer.toString();
    final lines = str.split('\n');

    // Keep the last part in buffer if it doesn't end with a newline
    _buffer.clear();
    if (!str.endsWith('\n')) {
      _buffer.write(lines.removeLast());
    } else {
      lines.removeLast(); // Remove empty string after last newline
    }

    for (final line in lines) {
      if (line.trim().isEmpty) continue;
      final dto = StreamMessageDto.fromJsonLine(line);
      if (dto.type != StreamMessageType.unknown) {
        sink.add(dto);
      }
    }
  }

  void _handleError(
      Object error, StackTrace stackTrace, EventSink<StreamMessageDto> sink) {
    sink.addError(error, stackTrace);
  }

  void _handleDone(EventSink<StreamMessageDto> sink) {
    if (_buffer.isNotEmpty) {
      final line = _buffer.toString();
      final dto = StreamMessageDto.fromJsonLine(line);
      if (dto.type != StreamMessageType.unknown) {
        sink.add(dto);
      }
    }
    sink.close();
  }

  void reset() {
    _buffer.clear();
  }
}

class TickAssembler {
  final Map<String, int> _pipLocations = {};

  void updatePipLocation(String symbol, int pipLocation) {
    _pipLocations[symbol] = pipLocation;
  }

  TickEntity assemble(StreamPriceDto dto) {
    final pipLoc = _pipLocations[dto.instrument] ?? -4; // Default to 4 decimals
    final pipSize = pow(10, pipLoc).toDouble();

    return TickEntity(
      symbol: dto.instrument,
      bid: dto.bestBid,
      ask: dto.bestAsk,
      spread: dto.spread,
      spreadPips: dto.spread / pipSize,
      dailyHigh: 0, // Need daily stats stream for this
      dailyLow: 0,
      timestamp: DateTime.parse(dto.time).microsecondsSinceEpoch,
      isLive: dto.isTradeable,
    );
  }
}
