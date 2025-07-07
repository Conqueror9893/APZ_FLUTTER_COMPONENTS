import 'package:flutter/material.dart';
class DarkModeTrue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375,
          height: 34,
          child: Stack(
            children: [
              Positioned(
                left: 121,
                top: 21,
                child: Container(
                  width: 134,
                  height: 5,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFE5E5E5) /* Neutral-colors-Neutral-200 */,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
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