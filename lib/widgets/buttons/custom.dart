// // import 'package:flutter/material.dart';
// // A single reusable button with dynamic styling and state support
// import 'package:flutter/material.dart';

// enum ButtonType { primary, secondary, tertiary }
// enum ButtonSize { small, medium, large }
// enum ButtonState { normal, hover, disabled }

// class CustomButton extends StatefulWidget {
//   final String label;
//   final ButtonType type;
//   final ButtonSize size;
//   final ButtonState state;
//   final VoidCallback? onPressed;
//   final height;
//   final width;

//   const CustomButton({
//     super.key,
//     required this.label,
//     this.type = ButtonType.primary,
//     this.size = ButtonSize.medium,
//     this.state = ButtonState.normal,
//     this.onPressed,
//     this.height,
//     this.width
//   });

//   @override
//   State<CustomButton> createState() => _CustomButtonState();
// }

// class _CustomButtonState extends State<CustomButton> {
//   bool isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     final isDisabled = widget.state == ButtonState.disabled;
//     final effectiveState = isDisabled
//         ? ButtonState.disabled
//         : (isHovered ? ButtonState.hover : widget.state);

//     final style = _ButtonStyleConfig.getStyle(
//       type: widget.type,
//       size: widget.size,
//       state: effectiveState,
//     );

//     return MouseRegion(
//       onEnter: (_) => setState(() => isHovered = true),
//       onExit: (_) => setState(() => isHovered = false),
//       child: GestureDetector(
//         onTap: isDisabled ? null : widget.onPressed,
//         child: Container(
//           padding: style.padding,
//           decoration: BoxDecoration(
//             color: style.backgroundColor,
//             border: Border.all(color: style.borderColor),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           child: Text(
//             widget.label,
//             style: TextStyle(
//               fontSize: style.fontSize,
//               fontWeight: FontWeight.w600,
//               color: style.textColor,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // A helper class to configure styles based on type, size, and state
// class _ButtonStyleConfig {
//   final Color backgroundColor;
//   final Color textColor;
//   final Color borderColor;
//   final double fontSize;
//   final EdgeInsets padding;

//   _ButtonStyleConfig({
//     required this.backgroundColor,
//     required this.textColor,
//     required this.borderColor,
//     required this.fontSize,
//     required this.padding,
//   });

//   static _ButtonStyleConfig getStyle({
//     required ButtonType type,
//     required ButtonSize size,
//     required ButtonState state,
//   }) {
//     final bg = {
//       ButtonType.primary: [Color(0xFF0054A6), Color(0xFF003E7E), Color(0xFFCCCCCC)],
//       ButtonType.secondary: [Color(0xFFFFFFFF), Color(0xFFEEEEEE), Color(0xFFCCCCCC)],
//       ButtonType.tertiary: [Colors.transparent, Color(0xFFF5F5F5), Color(0xFFCCCCCC)],
//     }[type]!;

//     final text = {
//       ButtonType.primary: [Colors.white, Colors.white, Colors.white70],
//       ButtonType.secondary: [Color(0xFF0054A6), Color(0xFF003E7E), Colors.grey],
//       ButtonType.tertiary: [Color(0xFF0054A6), Color(0xFF003E7E), Colors.grey],
//     }[type]!;

//     final border = {
//       ButtonType.primary: [Color(0xFF0054A6), Color(0xFF003E7E), Color(0xFFAAAAAA)],
//       ButtonType.secondary: [Color(0xFF0054A6), Color(0xFF003E7E), Color(0xFFAAAAAA)],
//       ButtonType.tertiary: [Colors.transparent, Colors.transparent, Colors.transparent],
//     }[type]!;

//     final sizeStyle = {
//       ButtonSize.small: [12.0, EdgeInsets.symmetric(horizontal: 12, vertical: 6)],
//       ButtonSize.medium: [14.0, EdgeInsets.symmetric(horizontal: 16, vertical: 8)],
//       ButtonSize.large: [16.0, EdgeInsets.symmetric(horizontal: 20, vertical: 10)],
//     }[size]!;

//     int index = state == ButtonState.normal ? 0 : (state == ButtonState.hover ? 1 : 2);

//     return _ButtonStyleConfig(
//       backgroundColor: bg[index],
//       textColor: text[index],
//       borderColor: border[index],
//       fontSize: sizeStyle[0] as double,
//       padding: sizeStyle[1] as EdgeInsets,
//     );
//   }
// }



import 'package:flutter/material.dart';

/// Enums to control the button types, states, and sizes
enum ButtonType { primary, secondary, tertiary }
enum ButtonState { normal, hover, disabled }
enum ButtonSize { small, medium, large }

/// Helper class to get styles based on button type and state
class ButtonStyleHelper {
  static Color getBackgroundColor(ButtonType type, ButtonState state) {
    switch (type) {
      case ButtonType.primary:
        return _getPrimaryColor(state);
      case ButtonType.secondary:
        return _getSecondaryColor(state);
      case ButtonType.tertiary:
        return _getTertiaryColor(state);
    }
  }

  static Color _getPrimaryColor(ButtonState state) {
    switch (state) {
      case ButtonState.normal:
        return const Color(0xFF0054A6);
      case ButtonState.hover:
        return const Color(0xFF006FCF);
      case ButtonState.disabled:
        return const Color(0xFFB3D4EF);
    }
  }

  static Color _getSecondaryColor(ButtonState state) {
    switch (state) {
      case ButtonState.normal:
        return const Color(0xFFFFFFFF);
      case ButtonState.hover:
        return const Color(0xFFF5F5F5);
      case ButtonState.disabled:
        return const Color(0xFFE0E0E0);
    }
  }

  static Color _getTertiaryColor(ButtonState state) {
    switch (state) {
      case ButtonState.normal:
        return const Color(0x00000000);
      case ButtonState.hover:
        return const Color(0xFFF5F5F5);
      case ButtonState.disabled:
        return const Color(0xFFE0E0E0);
    }
  }

  static Color getTextColor(ButtonType type, ButtonState state) {
    if (state == ButtonState.disabled) {
      return Colors.grey.shade600;
    }
    return type == ButtonType.primary ? Colors.white : Colors.black;
  }

  static BorderSide getBorder(ButtonType type, ButtonState state) {
    if (type == ButtonType.primary) {
      return BorderSide(color: getBackgroundColor(type, state), width: 1);
    } else {
      return BorderSide(color: Colors.grey.shade400, width: 1);
    }
  }

  static double getHeight(ButtonSize size) {
    switch (size) {
      case ButtonSize.small:
        return 32.0;
      case ButtonSize.medium:
        return 40.0;
      case ButtonSize.large:
        return 48.0;
    }
  }

  static EdgeInsets getPadding(ButtonSize size) {
    switch (size) {
      case ButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0);
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
      case ButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0);
    }
  }
  
  static double getWidth(ButtonSize size) {
     switch (size) {
      case ButtonSize.small:
        return 32.0;
      case ButtonSize.medium:
        return 40.0;
      case ButtonSize.large:
        return 48.0;
    }
  }
}

/// Custom reusable button class
class CustomStyledButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonType type;
  final ButtonState state;
  final ButtonSize size;
  final double? height;
  final double? width;
  final EdgeInsets? padding;

  const CustomStyledButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.state = ButtonState.normal,
    this.size = ButtonSize.medium,
    this.height,
    this.padding,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double buttonHeight = height ?? ButtonStyleHelper.getHeight(size);
    final double buttonWidth = width ?? ButtonStyleHelper.getWidth(size);
    final EdgeInsets buttonPadding = padding ?? ButtonStyleHelper.getPadding(size);

    return GestureDetector(
      onTap: state == ButtonState.disabled ? null : onPressed,
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        padding: buttonPadding,
        decoration: ShapeDecoration(
          color: ButtonStyleHelper.getBackgroundColor(type, state),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: ButtonStyleHelper.getBorder(type, state),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: ButtonStyleHelper.getTextColor(type, state),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
