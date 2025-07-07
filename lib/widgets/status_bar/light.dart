import 'package:flutter/material.dart';
class DarkModeOff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375,
          height: 47,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Positioned(
                left: 25,
                top: 14,
                child: Container(
                  width: 54,
                  height: 21,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 1,
                        child: SizedBox(
                          width: 54,
                          height: 20,
                          child: Text(
                            '9:41',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF0A0A0A) /* Base-colors-Black */,
                              fontSize: 17,
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w600,
                              height: 1.29,
                              letterSpacing: -0.41,
                            ),
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
    );
  }
}
