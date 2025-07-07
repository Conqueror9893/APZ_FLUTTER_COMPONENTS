import 'package:flutter/material.dart';
class TypeSideBySide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 311,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              Container(
                width: 103,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
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
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}