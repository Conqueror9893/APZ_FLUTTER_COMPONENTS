import 'package:flutter/material.dart';
class SizeSmLabelTrue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 200,
          child: Stack(
            children: [
              Positioned(
                left: 10,
                top: 10,
                child: Container(
                  width: 180,
                  height: 180,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 20,
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
                          width: 180,
                          height: 180,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 20,
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
                          width: 180,
                          height: 180,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 20,
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
                          width: 180,
                          height: 180,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 20,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: const Color(0xFF6192F9) /* Secondary-colors-Secondary-400 */,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 51.50,
                        top: 66,
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
                  ),
                ),
              ),
              Positioned(
                left: 51.50,
                top: 95,
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
                        fontSize: 20,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.12,
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