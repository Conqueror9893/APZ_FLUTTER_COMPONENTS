import 'package:flutter/material.dart';
class StatusDefaultStyleRound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 26,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: ShapeDecoration(
            color: const Color(0xFFF3F4F6) /* Grey-colors-grey-50 */,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
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
                    'Text',
                    style: TextStyle(
                      color: const Color(0xFF24272D) /* Text-colour-Input-Active */,
                      fontSize: 14,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Container(
                width: 19.20,
                height: 19.20,
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
