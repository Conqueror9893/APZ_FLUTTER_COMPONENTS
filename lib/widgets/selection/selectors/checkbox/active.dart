import 'package:flutter/material.dart';
class Property1Active extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
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
                    color: const Color(0xFF0054A6) /* Form-Fields-Selections-Active */,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Stack(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}