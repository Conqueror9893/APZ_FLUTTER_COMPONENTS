import 'package:flutter/material.dart';
class SupportingTextFalseArrowNone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x07101828),
                blurRadius: 6,
                offset: Offset(0, 4),
                spreadRadius: -2,
              ),BoxShadow(
                color: Color(0x14101828),
                blurRadius: 16,
                offset: Offset(0, 12),
                spreadRadius: -4,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: ShapeDecoration(
                  color: Colors.white /* Form-Fields-Tooltip-Default */,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: const Color(0xFFEDEEF1) /* Form-Fields-Tooltip-Outline */,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Text(
                          'This is a tooltip',
                          style: TextStyle(
                            color: const Color(0xFF24272D) /* Text-colour-Tooltip-Style-2 */,
                            fontSize: 12,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.07,
                          ),
                        ),
                      ],
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