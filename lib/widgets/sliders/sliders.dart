import 'package:flutter/material.dart';
class WebLayoutMb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 311,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Container(
                width: double.infinity,
                child: Column(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 4,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 10,
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
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 44,
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
                        spacing: 8,
                        children: [
                          Container(width: 20, height: 20, child: Stack()),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Text(
                                  'Please type here',
                                  style: TextStyle(
                                    color: const Color(0xFFB3BBC6) /* Text-colour-Input-Default */,
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
                            width: 24,
                            height: 24,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                            child: Stack(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 92,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 294,
                      top: 41.50,
                      child: Container(
                        width: 10,
                        height: 24,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 18,
                              child: Container(
                                width: 1,
                                height: 12,
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFEDEEF1) /* Form-Fields-Sliders-default */,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: -16,
                              top: 29.50,
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 2),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      spacing: 10,
                                      children: [
                                        Text(
                                          '₹ 4.5L',
                                          style: TextStyle(
                                            color: const Color(0xFF24272D) /* Text-colour-Input-Active */,
                                            fontSize: 12,
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 53,
                      child: Container(
                        width: 311,
                        height: 3,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFEDEEF1) /* Form-Fields-Sliders-default */,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 51,
                      child: Container(
                        width: 77.75,
                        height: 6,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 7,
                              top: -11,
                              child: Container(
                                width: 10,
                                height: 24,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 4.50,
                                      top: 20,
                                      child: Container(
                                        width: 1,
                                        height: 12,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFEDEEF1) /* Form-Fields-Sliders-default */,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 1,
                                      top: 32,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 2),
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                                    color: const Color(0xFF24272D) /* Text-colour-Input-Active */,
                                                    fontSize: 12,
                                                    fontFamily: 'Outfit',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 2,
                              child: Container(
                                width: 78,
                                height: 3,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF0054A6) /* Form-Fields-Sliders-Filled */,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 66,
                              top: -9,
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF0054A6) /* Button-Primary-Default */,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFF0054A6) /* Form-Fields-Sliders-Filled */,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 4,
                                              color: Colors.white /* Base-colors-White */,
                                            ),
                                            borderRadius: BorderRadius.circular(32),
                                          ),
                                          shadows: [
                                            BoxShadow(
                                              color: Color(0x0F101828),
                                              blurRadius: 4,
                                              offset: Offset(0, 2),
                                              spreadRadius: -2,
                                            ),BoxShadow(
                                              color: Color(0x19101828),
                                              blurRadius: 8,
                                              offset: Offset(0, 4),
                                              spreadRadius: -2,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: -14.50,
                                      top: -42,
                                      child: Container(
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
                                                color: const Color(0xFF0054A6) /* Form-Fields-Tooltip-Active */,
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
                                                        '₹20K',
                                                        style: TextStyle(
                                                          color: Colors.white /* Text-colour-Tooltip-Style-1 */,
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
                                    ),
                                  ],
                                ),
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
          ),
        ),
      ],
    );
  }
}
