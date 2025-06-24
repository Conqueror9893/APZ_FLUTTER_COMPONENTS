import 'package:flutter/material.dart';
class TypeValue extends StatelessWidget {
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
      ],
    );
  }
}