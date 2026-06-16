// Path: lib/features/chart/presentation/painters/grid_painter.dart
import 'package:flutter/material.dart';

class GridPainter extends CustomPainter {
  final double maxPrice;
  final double minPrice;
  final int horizontalLines;
  final int verticalLines;

  GridPainter({
    required this.maxPrice,
    required this.minPrice,
    this.horizontalLines = 5,
    this.verticalLines = 5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.1)
      ..strokeWidth = 1.0;

    // Horizontal lines
    final vStep = size.height / (horizontalLines + 1);
    for (int i = 1; i <= horizontalLines; i++) {
      final y = i * vStep;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    // Vertical lines
    final hStep = size.width / (verticalLines + 1);
    for (int i = 1; i <= verticalLines; i++) {
      final x = i * hStep;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant GridPainter oldDelegate) {
    return oldDelegate.maxPrice != maxPrice || oldDelegate.minPrice != minPrice;
  }
}
