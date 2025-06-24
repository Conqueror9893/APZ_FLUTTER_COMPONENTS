import 'package:flutter/material.dart';
class Property1Inactive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 24,
          height: 24,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: Stack(),
        ),
      ],
    );
  }
}