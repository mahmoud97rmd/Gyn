// Path: lib/features/chart/presentation/painters/candlestick_painter.dart
import 'package:flutter/material.dart';
import '../../../../core/domain/entities/candle_entity.dart';

class CandlestickPainter extends CustomPainter {
  final List<CandleEntity> candles;
  final double candleWidth;
  final double spacing;
  final double maxPrice;
  final double minPrice;
  final double scrollOffset;

  CandlestickPainter({
    required this.candles,
    this.candleWidth = 6.0,
    this.spacing = 2.0,
    required this.maxPrice,
    required this.minPrice,
    this.scrollOffset = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (candles.isEmpty || maxPrice == minPrice) return;

    final paint = Paint()..style = PaintingStyle.fill;
    final priceRange = maxPrice - minPrice;
    final heightRatio = size.height / priceRange;

    for (int i = 0; i < candles.length; i++) {
      final candle = candles[i];
      // Reverse drawing (newest on the right, but candles array is oldest to newest, wait!
      // If history comes from DB, last is newest. Let's assume candles.last is newest.
      // So index 0 is oldest, index N-1 is newest.
      final reverseIndex = candles.length - 1 - i;
      final x = size.width -
          50 -
          ((reverseIndex + 1) * (candleWidth + spacing)) +
          scrollOffset;

      if (x < -candleWidth || x > size.width) continue; // Off screen

      final isBull = candle.close >= candle.open;
      paint.color = isBull ? Colors.green : Colors.red;

      final openY = size.height - ((candle.open - minPrice) * heightRatio);
      final closeY = size.height - ((candle.close - minPrice) * heightRatio);
      final highY = size.height - ((candle.high - minPrice) * heightRatio);
      final lowY = size.height - ((candle.low - minPrice) * heightRatio);

      // Draw wick
      canvas.drawLine(
        Offset(x + candleWidth / 2, highY),
        Offset(x + candleWidth / 2, lowY),
        paint..strokeWidth = 1.0,
      );

      // Draw body
      final topY = isBull ? closeY : openY;
      final bottomY = isBull ? openY : closeY;

      canvas.drawRect(
        Rect.fromLTRB(
            x, topY, x + candleWidth, bottomY == topY ? bottomY + 1 : bottomY),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CandlestickPainter oldDelegate) {
    return oldDelegate.candles != candles ||
        oldDelegate.maxPrice != maxPrice ||
        oldDelegate.minPrice != minPrice ||
        oldDelegate.scrollOffset != scrollOffset ||
        oldDelegate.candleWidth != candleWidth;
  }
}
