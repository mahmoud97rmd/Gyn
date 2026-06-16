// Path: lib/features/chart/presentation/painters/indicator_painter.dart
import 'package:flutter/material.dart';

class IndicatorPainter extends CustomPainter {
  final List<double> values;
  final double maxPrice;
  final double minPrice;
  final double candleWidth;
  final double spacing;
  final Color color;

  IndicatorPainter({
    required this.values,
    required this.maxPrice,
    required this.minPrice,
    this.candleWidth = 6.0,
    this.spacing = 2.0,
    this.color = Colors.blue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (values.isEmpty || maxPrice == minPrice) return;

    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final priceRange = maxPrice - minPrice;
    final heightRatio = size.height / priceRange;

    final path = Path();
    bool first = true;

    for (int i = 0; i < values.length; i++) {
      final val = values[i];
      if (val.isNaN) continue;

      final x =
          size.width - ((i + 1) * (candleWidth + spacing)) + (candleWidth / 2);
      if (x < 0) break;

      final y = size.height - ((val - minPrice) * heightRatio);

      if (first) {
        path.moveTo(x, y);
        first = false;
      } else {
        path.lineTo(x, y);
      }
    }

    if (!first) {
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant IndicatorPainter oldDelegate) {
    return oldDelegate.values != values ||
        oldDelegate.maxPrice != maxPrice ||
        oldDelegate.minPrice != minPrice;
  }
}
