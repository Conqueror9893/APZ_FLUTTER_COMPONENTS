import 'package:flutter/material.dart';
class CurrentDefault extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              Text(
                'My details',
                style: TextStyle(
                  color: const Color(0xFF8A96A6) /* Tabs-Default */,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 1.50,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}