import 'package:flutter/material.dart';
class Property1WithPriTxt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Container(
              width: 173,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 10,
                      children: [
                        SizedBox(
                          width: 173,
                          child: Text(
                            'Text line one with value text',
                            style: TextStyle(
                              color: const Color(0xFF24272D) /* Text-colour-Input-Active */,
                              fontSize: 14,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.08,
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
        ),
      ],
    );
  }
}