import 'package:flutter/material.dart';
class TypeInfoSizeSm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 24,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: ShapeDecoration(
            color: const Color(0xFFEFF4FF) /* Semantics-Info-Info-Container */,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: const Color(0xFF3C6AF5) /* Semantics-Info-Info */,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 4,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    'Info',
                    style: TextStyle(
                      color: const Color(0xFF3C6AF5) /* Semantics-Info-Info */,
                      fontSize: 10,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.06,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}