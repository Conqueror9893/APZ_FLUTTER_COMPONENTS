// import 'package:flutter/material.dart';
// class SizeSmHierarchyPrimaryStateDefault extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           height: 36,
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           clipBehavior: Clip.antiAlias,
//           decoration: ShapeDecoration(
//             color: const Color(0xFF0054A6) /* Button-Primary-Default */,
//             shape: RoundedRectangleBorder(
//               side: BorderSide(
//                 width: 1,
//                 color: const Color(0xFF0054A6) /* Button-Primary-Default-outline */,
//               ),
//               borderRadius: BorderRadius.circular(100),
//             ),
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             spacing: 8,
//             children: [
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 spacing: 8,
//                 children: [
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     spacing: 10,
//                     children: [
//                       Text(
//                         'Pri-sm-default',
//                         style: TextStyle(
//                           color: Colors.white /* Text-colour-Button-Default */,
//                           fontSize: 12,
//                           fontFamily: 'Outfit',
//                           fontWeight: FontWeight.w600,
//                           letterSpacing: 0.07,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatefulWidget {
  final String label; // m
  final VoidCallback onPressed; // m
  final Color color; // D
  final Color textColor; // D
  final Color? borderColor; // nm
  final bool isLoading; // nm

  const CustomPrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color = const Color(0xFF0054A6),
    this.textColor = Colors.white,
    this.borderColor,
    this.isLoading = false,
  }) : super(key: key);

  @override
  State<CustomPrimaryButton> createState() => _CustomPrimaryButtonState();
}

class _CustomPrimaryButtonState extends State<CustomPrimaryButton> {
  bool _isPressed = false;

  void _handleTap() {
    setState(() {
      _isPressed = true;
    });
    widget.onPressed();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          _isPressed = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isLoading ? null : _handleTap,
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: ShapeDecoration(
          color: widget.isLoading ? Colors.grey : widget.color,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: widget.borderColor ?? widget.color,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.isLoading)
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            else
              Text(
                widget.label,
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: 12,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.07,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
