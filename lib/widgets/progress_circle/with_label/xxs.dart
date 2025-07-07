import 'package:flutter/material.dart';
class SizeXxsLabelTrue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 126.32,
          height: 120,
          child: Stack(
            children: [
              Positioned(
                left: 3,
                top: 0,
                child: Container(
                  width: 120,
                  height: 120,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 5.62,
                        top: 5.62,
                        child: Container(
                          width: 108.75,
                          height: 108.75,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 11.25,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: const Color(0xFFFAFAFA) /* Surface-Background */,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 5.62,
                        top: 5.62,
                        child: Container(
                          width: 108.75,
                          height: 108.75,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 11.25,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: const Color(0xFF0054A6) /* Primary-colors-primary-700 */,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 5.62,
                        top: 5.62,
                        child: Container(
                          width: 108.75,
                          height: 108.75,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 11.25,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: const Color(0xFFF57C00) /* Semantics-Warning-warning */,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 5.62,
                        top: 5.62,
                        child: Container(
                          width: 108.75,
                          height: 108.75,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 11.25,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: const Color(0xFF6192F9) /* Secondary-colors-Secondary-400 */,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 27.50,
                        top: 43,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Text(
                              'Active users',
                              style: TextStyle(
                                color: const Color(0xFFB3BBC6) /* Text-colour-Label-&-Help-Default */,
                                fontSize: 12,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.07,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 25.50,
                        top: 60,
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
                                fontSize: 14,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.08,
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