import 'package:flutter/material.dart';
class TypeOneLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Text(
                  'Value',
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
      ],
    );
  }
}