import 'package:flutter/material.dart';
class NavFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375,
          height: 129,
          child: Stack(
            children: [
              Positioned(
                left: 30,
                top: 69,
                child: Container(
                  width: 315.15,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 145,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 39,
                        children: [
                          Container(
                            height: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFB9DCFE) /* Form-Fields-NavFooter-Selected-nav */,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 23.08,
                                  height: 23.08,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 23.08,
                            height: 23.08,
                            child: Stack(),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 39,
                        children: [
                          Container(
                            width: 23.08,
                            height: 23.08,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                            child: Stack(),
                          ),
                          Container(
                            width: 23.08,
                            height: 23.08,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                            child: Stack(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 155,
                top: 0,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF0054A6) /* Button-Primary-Default */,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(175),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0xE5000000),
                        blurRadius: 25,
                        offset: Offset(0, 6),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 19.81,
                        top: 20.66,
                        child: Container(
                          width: 29.17,
                          height: 29.17,
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
      ],
    );
  }
}