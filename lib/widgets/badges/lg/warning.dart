import 'package:flutter/material.dart';
class TypeWarningSizeLg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            color: const Color(0xFFFEF2E6) /* Form-Fields-Badges-Warning-Default */,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: const Color(0xFFF8A754) /* Form-Fields-Badges-Warning-Default-outline */,
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
              Text(
                'Warning',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFFF8A754) /* Form-Fields-Badges-Warning-Default-outline */,
                  fontSize: 12,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.07,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}