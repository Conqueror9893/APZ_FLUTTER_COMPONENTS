import 'package:flutter/material.dart';
class ProgressSteps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 12,
          children: [
            Container(
              width: 24,
              height: 24,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF8CC36F) /* Success-colors-green-400 */,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 6,
                            top: 6,
                            child: Container(
                              width: 12,
                              height: 12,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Text(
                  'Personal info',
                  style: TextStyle(
                    color: const Color(0xFFB3BBC6) /* Text-colour-Input-Default */,
                    fontSize: 14,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.08,
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          width: 24,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 16),
                child: Container(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(3.14),
                  width: 1.50,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3D444F) /* Icon-Default */,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 12,
          children: [
            Container(
              width: 24,
              height: 24,
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
                        color: const Color(0xFF3D444F) /* Icon-Default */,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1.50,
                            color: const Color(0xFF3D444F) /* Icon-Default */,
                          ),
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      child: Stack(),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Text(
                  'Account info',
                  style: TextStyle(
                    color: const Color(0xFF24272D) /* Text-colour-Paragraph-Style-2 */,
                    fontSize: 14,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.08,
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          width: 24,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 16),
                child: Container(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(3.14),
                  width: 1.50,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6) /* Outline-Disabled */,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 12,
          children: [
            Container(
              width: 24,
              height: 24,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1.50,
                            color: const Color(0xFFF3F4F6) /* Outline-Disabled */,
                          ),
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 6,
                            top: 6,
                            child: Container(width: 12, height: 12, child: Stack()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Text(
                  'Review',
                  style: TextStyle(
                    color: const Color(0xFFB3BBC6) /* Text-colour-Input-Default */,
                    fontSize: 14,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.08,
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          width: 24,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 16),
                child: Container(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(3.14),
                  width: 1.50,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6) /* Outline-Disabled */,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 12,
          children: [
            Container(
              width: 24,
              height: 24,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1.50,
                            color: const Color(0xFFF3F4F6) /* Outline-Disabled */,
                          ),
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 6,
                            top: 6,
                            child: Container(width: 12, height: 12, child: Stack()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Text(
                  'Confirmation',
                  style: TextStyle(
                    color: const Color(0xFFB3BBC6) /* Text-colour-Input-Default */,
                    fontSize: 14,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.08,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
