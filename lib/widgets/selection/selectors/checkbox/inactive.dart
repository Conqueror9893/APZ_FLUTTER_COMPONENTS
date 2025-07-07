import 'package:flutter/material.dart';
class Property1Inactive extends StatelessWidget {
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
    );
  }
}