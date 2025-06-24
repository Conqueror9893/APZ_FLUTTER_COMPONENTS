import 'package:flutter/material.dart';
class TypeSuccessSizeSm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 24,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    'Success',
                    style: TextStyle(
                      color: const Color(0xFF6FB44B) /* Success-colors-green-500 */,
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