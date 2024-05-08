import 'package:flutter/material.dart';
import 'dart:math';

class HexagonPainter extends CustomPainter {
  final Color color;
  final String abvrCode;

  HexagonPainter({required this.color, required this.abvrCode});

  @override
  void paint(Canvas canvas, Size size) {
    final double side = size.height / 2 / cos(pi / 6);
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    final Paint paint = Paint()..color = color;

    Path path = Path();
    path.moveTo(centerX + side * cos(pi / 6), centerY - side * sin(pi / 6));

    for (int i = 1; i <= 6; i++) {
      path.lineTo(centerX + side * cos(pi / 3 * i + pi / 6),
          centerY - side * sin(pi / 3 * i + pi / 6));
    }

    path.close();
    canvas.drawPath(path, paint);

    TextPainter painter = TextPainter(
      text: TextSpan(
        text: abvrCode,
        style: const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    painter.layout();
    painter.paint(canvas,
        Offset(centerX - painter.width / 2, centerY - painter.height / 2));
  }

  @override
  bool shouldRepaint(HexagonPainter oldDelegate) {
    return color != oldDelegate.color || abvrCode != oldDelegate.abvrCode;
  }
}
