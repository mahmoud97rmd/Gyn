// Path: lib/features/chart/presentation/widgets/main_chart_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/chart_state_provider.dart';
import '../painters/candlestick_painter.dart';
import '../painters/grid_painter.dart';

class MainChartWidget extends ConsumerStatefulWidget {
  const MainChartWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<MainChartWidget> createState() => _MainChartWidgetState();
}

class _MainChartWidgetState extends ConsumerState<MainChartWidget> {
  double _candleWidth = 8.0;
  double _scrollOffset = 0.0;
  Offset? _crosshairPos;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chartStateProvider);

    if (state.isLoading && state.candles.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.candles.isEmpty) {
      return const Center(
          child: Text('No chart data available',
              style: TextStyle(color: Colors.white)));
    }

    final visibleCandlesCount =
        (MediaQuery.of(context).size.width / (_candleWidth + 2.0)).ceil();
    final startIndex = (_scrollOffset / (_candleWidth + 2.0))
        .floor()
        .clamp(0, state.candles.length);
    final endIndex =
        (startIndex + visibleCandlesCount).clamp(0, state.candles.length);

    final visibleCandles = state.candles.sublist(startIndex, endIndex);
    if (visibleCandles.isEmpty) return const SizedBox.shrink();

    double maxPrice = visibleCandles.fold(
        visibleCandles.first.high, (m, c) => c.high > m ? c.high : m);
    double minPrice = visibleCandles.fold(
        visibleCandles.first.low, (m, c) => c.low < m ? c.low : m);

    final range = maxPrice - minPrice;
    maxPrice += range * 0.1;
    minPrice -= range * 0.1;

    return GestureDetector(
      onScaleUpdate: (details) {
        setState(() {
          _candleWidth = (_candleWidth * details.scale).clamp(2.0, 50.0);
          _scrollOffset -= details.focalPointDelta.dx;
          if (_scrollOffset < 0) _scrollOffset = 0;
        });
      },
      onLongPressStart: (details) =>
          setState(() => _crosshairPos = details.localPosition),
      onLongPressMoveUpdate: (details) =>
          setState(() => _crosshairPos = details.localPosition),
      onLongPressEnd: (details) => setState(() => _crosshairPos = null),
      child: Container(
        color: const Color(0xFF1E1E1E),
        child: Stack(
          children: [
            CustomPaint(
              size: Size.infinite,
              painter: GridPainter(maxPrice: maxPrice, minPrice: minPrice),
            ),
            CustomPaint(
              size: Size.infinite,
              painter: CandlestickPainter(
                candles: state.candles,
                maxPrice: maxPrice,
                minPrice: minPrice,
                candleWidth: _candleWidth,
                spacing: 2.0,
                scrollOffset: _scrollOffset,
              ),
            ),
            if (_crosshairPos != null)
              CustomPaint(
                size: Size.infinite,
                painter: _CrosshairPainter(
                  pos: _crosshairPos!,
                  maxPrice: maxPrice,
                  minPrice: minPrice,
                ),
              ),
            // Price Axis Labels
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: 50,
              child: _PriceAxis(maxPrice: maxPrice, minPrice: minPrice),
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceAxis extends StatelessWidget {
  final double maxPrice;
  final double minPrice;

  const _PriceAxis({required this.maxPrice, required this.minPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1E1E1E).withValues(alpha: 0.8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final steps = 5;
          final range = maxPrice - minPrice;
          final stepVal = range / steps;
          final stepH = constraints.maxHeight / steps;

          return Stack(
            children: List.generate(steps + 1, (i) {
              final price = maxPrice - (i * stepVal);
              return Positioned(
                top: (i * stepH) - 8,
                right: 4,
                child: Text(
                  price.toStringAsFixed(5),
                  style: const TextStyle(color: Colors.grey, fontSize: 10),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

class _CrosshairPainter extends CustomPainter {
  final Offset pos;
  final double maxPrice;
  final double minPrice;

  _CrosshairPainter(
      {required this.pos, required this.maxPrice, required this.minPrice});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white54
      ..strokeWidth = 1.0;

    canvas.drawLine(Offset(pos.dx, 0), Offset(pos.dx, size.height), paint);
    canvas.drawLine(Offset(0, pos.dy), Offset(size.width, pos.dy), paint);

    // Draw price label
    final price = maxPrice - ((pos.dy / size.height) * (maxPrice - minPrice));
    final textPainter = TextPainter(
      text: TextSpan(
          text: price.toStringAsFixed(5),
          style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              backgroundColor: Colors.black87)),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(size.width - 50, pos.dy - 6));
  }

  @override
  bool shouldRepaint(covariant _CrosshairPainter old) => old.pos != pos;
}
