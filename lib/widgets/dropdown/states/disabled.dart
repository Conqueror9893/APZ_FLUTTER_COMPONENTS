import 'package:flutter/material.dart';
class StateDisabled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 343,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Container(
                width: double.infinity,
                child: Column(
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
                    Container(
                      width: double.infinity,
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFEDEEF1) /* Form-Fields-Dropdown-Disabled */,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: const Color(0xFFEDEEF1) /* Form-Fields-Dropdown-Outline-disabled */,
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
                                  'Please select',
                                  style: TextStyle(
                                    color: const Color(0xFFB3BBC6) /* Text-colour-Input-Disabled */,
                                    fontSize: 14,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.08,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Opacity(
                            opacity: 0.38,
                            child: Container(width: 20, height: 20, child: Stack()),
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