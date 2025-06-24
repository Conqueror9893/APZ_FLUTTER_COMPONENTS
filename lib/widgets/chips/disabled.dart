import 'package:flutter/material.dart';
class Property1Disable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Container(
          height: 34,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          decoration: ShapeDecoration(
            color: const Color(0xFFF3F4F6) /* Surface-Disabled */,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              Container(
                width: 16,
                height: 16,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Stack(),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    'Label',
                    style: TextStyle(
                      color: const Color(0xFFB3BBC6) /* Text-colour-Chips-Disabled */,
                      fontSize: 14,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.08,
                    ),
                  ),
                ],
              ),
              Container(
                width: 16,
                height: 16,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Stack(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}