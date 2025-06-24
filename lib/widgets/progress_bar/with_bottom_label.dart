import 'package:flutter/material.dart';
class Progress0LabelBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 320,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 8,
            children: [
              Container(
                width: double.infinity,
                height: 8,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 320,
                        height: 8,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFEDEEF1) /* Grey-colors-grey-100 */,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF0054A6) /* Semantics-Primary-active */,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '0%',
                style: TextStyle(
                  color: const Color(0xFF24272D) /* Text-colour-Label-&-Helper-Text-Active */,
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
    );
  }
}