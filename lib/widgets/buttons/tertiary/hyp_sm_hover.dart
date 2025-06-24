import 'package:flutter/material.dart';
class SizeSmHierarchyHyperlinkStateHover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 36,
          padding: const EdgeInsets.symmetric(vertical: 8),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 8,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        'Hyp-sm-hover',
                        style: TextStyle(
                          color: const Color(0xFFD7DBE0) /* Text-colour-Hyperlink-Hover */,
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
          ),
        ),
      ],
    );
  }
}