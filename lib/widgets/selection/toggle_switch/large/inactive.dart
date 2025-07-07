import 'package:flutter/material.dart';
class SizeMdStateInactive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 44,
          height: 24,
          padding: const EdgeInsets.all(2),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFFB3BBC6) /* Form-Fields-Toggle-Switch-Inactive */,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: ShapeDecoration(
                  color: Colors.white /* Base-colors-White */,
                  shape: OvalBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0x0F101828),
                      blurRadius: 2,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    ),BoxShadow(
                      color: Color(0x19101828),
                      blurRadius: 3,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    )
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