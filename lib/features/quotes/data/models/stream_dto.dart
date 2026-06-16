// Path: lib/features/quotes/data/models/stream_dto.dart
import 'dart:convert';
import 'package:equatable/equatable.dart';

enum StreamMessageType { price, heartbeat, unknown }

abstract class StreamMessageDto extends Equatable {
  final StreamMessageType type;
  const StreamMessageDto(this.type);

  factory StreamMessageDto.fromJsonLine(String line) {
    if (line.trim().isEmpty) return const StreamUnknownDto();
    try {
      final json = jsonDecode(line);
      final type = json['type'];
      if (type == 'PRICE') return StreamPriceDto.fromJson(json);
      if (type == 'HEARTBEAT') return StreamHeartbeatDto.fromJson(json);
      return const StreamUnknownDto();
    } catch (_) {
      return const StreamUnknownDto();
    }
  }
}

class StreamPriceDto extends StreamMessageDto {
  final String instrument;
  final String time;
  final String status;
  final bool tradeable;
  final List<StreamBidAskDto> bids;
  final List<StreamBidAskDto> asks;
  final double closeoutBid;
  final double closeoutAsk;

  const StreamPriceDto({
    required this.instrument,
    required this.time,
    required this.status,
    required this.tradeable,
    required this.bids,
    required this.asks,
    required this.closeoutBid,
    required this.closeoutAsk,
  }) : super(StreamMessageType.price);

  factory StreamPriceDto.fromJson(Map<String, dynamic> json) {
    return StreamPriceDto(
      instrument: json['instrument'] ?? '',
      time: json['time'] ?? '',
      status: json['status'] ?? '',
      tradeable: json['tradeable'] ?? false,
      bids: (json['bids'] as List?)
              ?.map((e) => StreamBidAskDto.fromJson(e))
              .toList() ??
          [],
      asks: (json['asks'] as List?)
              ?.map((e) => StreamBidAskDto.fromJson(e))
              .toList() ??
          [],
      closeoutBid:
          double.tryParse(json['closeoutBid']?.toString() ?? '0') ?? 0.0,
      closeoutAsk:
          double.tryParse(json['closeoutAsk']?.toString() ?? '0') ?? 0.0,
    );
  }

  double get bestBid => bids.isNotEmpty ? bids.first.price : closeoutBid;
  double get bestAsk => asks.isNotEmpty ? asks.first.price : closeoutAsk;
  double get spread => bestAsk - bestBid;
  bool get isTradeable => tradeable && status == 'tradeable';

  @override
  List<Object> get props => [instrument, time, status];
}

class StreamBidAskDto extends Equatable {
  final double price;
  final int liquidity;

  const StreamBidAskDto({required this.price, required this.liquidity});

  factory StreamBidAskDto.fromJson(Map<String, dynamic> json) {
    return StreamBidAskDto(
      price: double.tryParse(json['price']?.toString() ?? '0') ?? 0.0,
      liquidity: json['liquidity'] ?? 0,
    );
  }

  @override
  List<Object> get props => [price, liquidity];
}

class StreamHeartbeatDto extends StreamMessageDto {
  final String time;
  const StreamHeartbeatDto({required this.time})
      : super(StreamMessageType.heartbeat);

  factory StreamHeartbeatDto.fromJson(Map<String, dynamic> json) {
    return StreamHeartbeatDto(time: json['time'] ?? '');
  }

  @override
  List<Object> get props => [time];
}

class StreamUnknownDto extends StreamMessageDto {
  const StreamUnknownDto() : super(StreamMessageType.unknown);
  @override
  List<Object> get props => [];
}

enum StreamConnectionState {
  disconnected,
  connecting,
  connected,
  reconnecting,
  error,
  killed;

  bool get isActive =>
      this == connected || this == connecting || this == reconnecting;
  bool get isConnected => this == connected;
  String get displayName => name.toUpperCase();
}
