import 'package:flutter/material.dart';

class NavClipper extends CustomClipper<Path> {
  final double? h;
  final double? w;
  final double? r;
  final double? lcr;
  final double? rcr;

  NavClipper({this.h, this.w, this.r, this.lcr, this.rcr});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, rcr!);
    path.arcToPoint(
      Offset(rcr, 0),
      radius: Radius.circular(rcr),
      clockwise: true,
    );
    path.lineTo(w! * 0.35, 0);
    path.arcToPoint(
      Offset(w! * 0.42, r! * 0.45),
      radius: Radius.circular(r),
      clockwise: false,
    );
    path.arcToPoint(
      Offset(w! * 0.58, r! * 0.45),
      radius: Radius.circular(r! * 0.9),
      clockwise: true,
    );
    path.arcToPoint(
      Offset(w! * 0.65, 0),
      radius: Radius.circular(r),
      clockwise: false,
    );
    path.lineTo(w! - lcr!, 0);
    path.arcToPoint(
      Offset(w!, lcr),
      radius: Radius.circular(lcr),
      clockwise: true,
    );
    path.lineTo(w!, h!);
    path.lineTo(0, h!);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
