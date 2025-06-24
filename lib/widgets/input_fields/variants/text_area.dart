import 'package:flutter/material.dart';
class TextArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: ShapeDecoration(
            color: const Color(0xFFF3F4F6) /* Form-Fields-Input-Default */,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: const Color(0xFFD7DBE0) /* Form-Fields-Input-Outline-default */,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Container(width: 24, height: 24, child: Stack()),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      'Placeholder',
                      style: TextStyle(
                        color: const Color(0xFFB3BBC6) /* Text-colour-Input-Default */,
                        fontSize: 14,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.08,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}