import 'package:flutter/material.dart';
class InputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 343,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
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
                          'Label',
                          style: TextStyle(
                            color: const Color(0xFFB3BBC6) /* Text-colour-Label-&-Help-Default */,
                            fontSize: 12,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.07,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 343,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4,
                      children: [
                        Container(
                          width: 52,
                          height: 44,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: ShapeDecoration(
                            color: Colors.white /* Base-colors-White */,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: const Color(0xFF6192F9) /* Form-Fields-Input-Outline-focused */,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 8,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      color: const Color(0xFF6192F9) /* Text-colour-Input-Highlight */,
                                      fontSize: 14,
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.08,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 52,
                          height: 44,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: ShapeDecoration(
                            color: Colors.white /* Base-colors-White */,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: const Color(0xFF0A0A0A) /* Base-colors-Black */,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 8,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      color: const Color(0xFF0A0A0A) /* Base-colors-Black */,
                                      fontSize: 14,
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.08,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 52,
                          height: 44,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: ShapeDecoration(
                            color: Colors.white /* Base-colors-White */,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: const Color(0xFF0A0A0A) /* Base-colors-Black */,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 8,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      color: const Color(0xFF0A0A0A) /* Base-colors-Black */,
                                      fontSize: 14,
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.08,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 52,
                          height: 44,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: ShapeDecoration(
                            color: Colors.white /* Base-colors-White */,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: const Color(0xFF0A0A0A) /* Base-colors-Black */,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 8,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      color: const Color(0xFF0A0A0A) /* Base-colors-Black */,
                                      fontSize: 14,
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.08,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 52,
                          height: 44,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: ShapeDecoration(
                            color: Colors.white /* Base-colors-White */,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: const Color(0xFF0A0A0A) /* Base-colors-Black */,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 8,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      color: const Color(0xFF0A0A0A) /* Base-colors-Black */,
                                      fontSize: 14,
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.08,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 52,
                          height: 44,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: ShapeDecoration(
                            color: Colors.white /* Base-colors-White */,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: const Color(0xFF0A0A0A) /* Base-colors-Black */,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 8,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      color: const Color(0xFF0A0A0A) /* Base-colors-Black */,
                                      fontSize: 14,
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.08,
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}