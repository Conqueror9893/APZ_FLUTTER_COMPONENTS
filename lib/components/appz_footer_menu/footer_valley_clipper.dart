import 'package:flutter/material.dart';

class FooterValleyClipper extends CustomClipper<Path> {
  final double notchRadius;
  final double notchMargin;

  FooterValleyClipper({required this.notchRadius, required this.notchMargin});

  @override
  Path getClip(Size size) {
    final double centerX = size.width / 2;
    final double notchWidth = notchRadius * 2 + notchMargin;
    final double notchDepth = notchRadius + notchMargin / 2;
    final double notchStart = centerX - notchWidth / 2;
    final double notchEnd = centerX + notchWidth / 2;

    final Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(notchStart, 0);
    // Valley (notch)
    path.cubicTo(
      notchStart + notchMargin / 2,
      0,
      centerX - notchRadius,
      notchDepth,
      centerX,
      notchDepth,
    );
    path.cubicTo(
      centerX + notchRadius,
      notchDepth,
      notchEnd - notchMargin / 2,
      0,
      notchEnd,
      0,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
