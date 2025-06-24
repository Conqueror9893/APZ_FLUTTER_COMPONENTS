import 'package:flutter/material.dart';
class TextArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(104),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white /* Base-colors-White */,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Opacity(
                            opacity: 0.38,
                            child: Container(width: 18, height: 18, child: Stack()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 4,
                          children: [
                            Text(
                              'Click to upload',
                              style: TextStyle(
                                color: const Color(0xFF6192F9) /* Text-colour-Input-Highlight */,
                                fontSize: 14,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.08,
                              ),
                            ),
                            Text(
                              'the document',
                              style: TextStyle(
                                color: const Color(0xFF24272D) /* Text-colour-Input-Active */,
                                fontSize: 14,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.08,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Text(
                              'SVG, PNG, JPG or PDF ',
                              style: TextStyle(
                                color: const Color(0xFFB3BBC6) /* Text-colour-Input-Default */,
                                fontSize: 12,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.07,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}