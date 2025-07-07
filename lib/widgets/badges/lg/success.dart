import 'package:flutter/material.dart';
class TypeSuccessSizeLg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            color: const Color(0xFFF1F8ED) /* Form-Fields-Badges-Success-Default */,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: const Color(0xFF9FCD86) /* Form-Fields-Badges-Success-Default-outline */,
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
                'Success',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF6FB44B) /* Success-colors-green-500 */,
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