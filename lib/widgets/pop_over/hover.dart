import 'package:flutter/material.dart';
class StateHover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 202,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFFE5E5E5) /* Neutral-colors-Neutral-200 */,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 12,
            children: [
              Container(width: 24, height: 24, child: Stack()),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    SizedBox(
                      width: 142,
                      child: Text(
                        'Value',
                        style: TextStyle(
                          color: const Color(0xFF24272D) /* Text-colour-Label-&-Helper-Text-Active */,
                          fontSize: 14,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.08,
                        ),
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