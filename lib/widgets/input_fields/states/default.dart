import 'package:flutter/material.dart';
class StateDefault extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
                      Text(
                        '*',
                        style: TextStyle(
                          color: const Color(0xFFD80000) /* Outline-Error */,
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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 10,
                        children: [
                          Text(
                            '+91',
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
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: 282,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Row(
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
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 10,
                            children: [
                              Text(
                                'Placeholder',
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