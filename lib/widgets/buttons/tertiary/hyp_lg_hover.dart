import 'package:flutter/material.dart';
class SizeLgHierarchyHyperlinkStateHover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 44,
          padding: const EdgeInsets.symmetric(vertical: 8),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 12,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 12,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        'Hyp-lg-hover',
                        style: TextStyle(
                          color: const Color(0xFFD7DBE0) /* Text-colour-Hyperlink-Hover */,
                          fontSize: 16,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.10,
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