import 'package:flutter/material.dart';
class TypeWithTicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 24,
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
              Container(
                width: 327,
                height: 32,
                padding: const EdgeInsets.only(top: 5, left: 16, bottom: 5),
                decoration: ShapeDecoration(
                  color: Colors.white /* Form-Fields-Header-Header-sub */,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: const Color(0x660054A6) /* Form-Fields-Header-Header-sub-outline */,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x660054A6),
                      blurRadius: 34,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 24,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Text(
                          'Update your KYC before 01 May 2025',
                          style: TextStyle(
                            color: const Color(0xFF24272D) /* Text-colour-Input-Active */,
                            fontSize: 12,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 26,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 16,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://placehold.co/40x40"),
                              fit: BoxFit.cover,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 12,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Text(
                                  'Hi, Username',
                                  style: TextStyle(
                                    color: const Color(0xFF24272D) /* Text-colour-Title-Text-Default */,
                                    fontSize: 20,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 12,
                      children: [
                        Container(width: 22, height: 22, child: Stack()),
                        Container(
                          width: 30.80,
                          height: 22,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 30.80,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage("https://placehold.co/31x22"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
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
          ),
        ),
      ],
    );
  }
}