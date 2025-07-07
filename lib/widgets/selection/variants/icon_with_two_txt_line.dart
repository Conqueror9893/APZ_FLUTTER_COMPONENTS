import 'package:flutter/material.dart';
class Property1WithTwoTextLines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Container(
                  width: 24.50,
                  height: 24,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 2,
                        top: 2,
                        child: Container(
                          width: 20,
                          height: 20,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1.43,
                                color: const Color(0xFFB3BBC6) /* Form-Fields-Selections-Inactive */,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Stack(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      SizedBox(
                        width: 175,
                        child: Text(
                          'Text line one with value text',
                          style: TextStyle(
                            color: const Color(0xFF24272D) /* Text-colour-Input-Active */,
                            fontSize: 14,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.08,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 167,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      SizedBox(
                        width: 167,
                        child: Text(
                          'Text line two with sub text',
                          style: TextStyle(
                            color: const Color(0xFFB3BBC6) /* Text-colour-Input-Default */,
                            fontSize: 12,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.07,
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
      ],
    );
  }
}