import 'package:flutter/material.dart';

class TicketContainer extends StatelessWidget {
  final Widget child;

  const TicketContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TicketPainter(),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
        child: child,
      ),
    );
  }
}

class TicketPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bgPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    double radius = 12;
    double notchY = 145;

    Path path = Path();

    path.moveTo(0, 20);
    path.quadraticBezierTo(0, 0, 20, 0);
    path.lineTo(size.width - 20, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 20);

    path.lineTo(size.width, notchY - radius);
    path.arcToPoint(
      Offset(size.width, notchY + radius),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    double waveHeight = 12;
    path.lineTo(size.width, size.height - waveHeight);

    // Zig-Zag
    double waveWidth = 20; // প্রতিটি ঢেউয়ের চওড়া
    int waveCount = (size.width / waveWidth).floor();
    double remainingWidth = size.width - (waveCount * waveWidth);


    for (int i = 0; i < waveCount; i++) {
      path.relativeQuadraticBezierTo(
        -waveWidth / 2, -waveHeight,
        -waveWidth, 0,
      );
    }

    if (remainingWidth > 0) {
      path.lineTo(0, size.height - waveHeight);
    }

    path.lineTo(0, notchY + radius);
    path.arcToPoint(
      Offset(0, notchY - radius),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    path.lineTo(0, 20);
    path.close();


    canvas.drawPath(path, bgPaint);

    // Dotted Line
    final dotPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    double dashWidth = 5;
    double dashSpace = 4;
    double startX = 20;

    while (startX < size.width - 20) {
      canvas.drawLine(
        Offset(startX, notchY),
        Offset(startX + dashWidth, notchY),
        dotPaint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}