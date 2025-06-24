import 'package:flutter/material.dart';
class AppCategoriesHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Container(
                height: 86,
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: Colors.white /* Surface-Colour-1 */,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 24,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 37,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 8,
                              children: [
                                Container(
                                  width: 32,
                                  height: 30.57,
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Insurance  ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF6C798B) /* Text-colour-Label-&-Helper-Text-Selected */,
                              fontSize: 12,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.07,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 86,
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: Colors.white /* Surface-Colour-1 */,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 24,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 37,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 8,
                              children: [
                                Container(
                                  width: 32,
                                  height: 27.12,
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Healthcare',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF6C798B) /* Text-colour-Label-&-Helper-Text-Selected */,
                              fontSize: 12,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.07,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 86,
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: Colors.white /* Surface-Colour-1 */,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 24,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 37,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 8,
                              children: [
                                Container(
                                  width: 32,
                                  height: 30.64,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Financial',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF6C798B) /* Text-colour-Label-&-Helper-Text-Selected */,
                              fontSize: 12,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.07,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 86,
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: Colors.white /* Surface-Colour-1 */,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 24,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Container(
                            height: 37,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 8,
                              children: [
                                Container(
                                  width: 32,
                                  height: 22.56,
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Travel',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF6C798B) /* Text-colour-Label-&-Helper-Text-Selected */,
                              fontSize: 12,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.07,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 86,
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: Colors.white /* Surface-Colour-1 */,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 24,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 37,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 8,
                              children: [
                                Container(
                                  width: 32,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    spacing: 2.22,
                                    children: [

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'More',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF6C798B) /* Text-colour-Label-&-Helper-Text-Selected */,
                              fontSize: 12,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.07,
                            ),
                          ),
                        ],
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
