import 'package:flutter/material.dart';

class WholePathPainter extends CustomPainter {
  final List<Offset> points;
  final Color color;

  WholePathPainter({required this.points, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) return;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.5
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(points[0].dx, points[0].dy);

    for (int i = 0; i < points.length - 1; i++) {
      final p1 = points[i];
      final p2 = points[i + 1];

      path.cubicTo(
        p1.dx, p1.dy + 60,  
        p2.dx, p2.dy - 60,  
        p2.dx, p2.dy,       
      );
    }

    double dashWidth = 8, dashGap = 6;
    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        canvas.drawPath(
          metric.extractPath(distance, distance + dashWidth),
          paint,
        );
        distance += dashWidth + dashGap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant WholePathPainter oldDelegate) =>
      oldDelegate.points.length != points.length;
}