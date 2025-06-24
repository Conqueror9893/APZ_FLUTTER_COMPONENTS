import 'package:flutter/material.dart';
class TypeErrorSizeSm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 24,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: ShapeDecoration(
            color: const Color(0xFFFBE6E6) /* Form-Fields-Badges-Error-Default */,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: const Color(0xFFE55454) /* Form-Fields-Badges-Error-Default-outline */,
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
                    'Error',
                    style: TextStyle(
                      color: const Color(0xFFE55454) /* Form-Fields-Badges-Error-Default-outline */,
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