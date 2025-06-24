import 'package:flutter/material.dart';
class SizeLgLabelFalse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 280,
          height: 280,
          child: Stack(
            children: [
              Positioned(
                left: 13,
                top: 14,
                child: Container(
                  width: 252,
                  height: 252,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 252,
                          height: 252,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 28,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: const Color(0xFFFAFAFA) /* Surface-Background */,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 252,
                          height: 252,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 28,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: const Color(0xFF0054A6) /* Primary-colors-primary-700 */,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 252,
                          height: 252,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 28,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: const Color(0xFFF57C00) /* Semantics-Warning-warning */,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 252,
                          height: 252,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 28,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: const Color(0xFF6192F9) /* Secondary-colors-Secondary-400 */,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 97.50,
                top: 128,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      '56,20,000',
                      style: TextStyle(
                        color: const Color(0xFF24272D) /* Text-colour-Table-Header-Default */,
                        fontSize: 18,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.11,
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