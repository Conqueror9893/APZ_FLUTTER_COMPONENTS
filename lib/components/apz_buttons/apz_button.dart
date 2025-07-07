import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'apz_button_properties.dart';

class ButtonConfig {
  static final ButtonConfig _instance = ButtonConfig._internal();
  factory ButtonConfig() => _instance;
  ButtonConfig._internal();

  Color primaryColor = const Color.from(alpha: 1, red: 0.384, green: 0, blue: 0.933);
  Color primaryHoverColor = const Color(0xFF3700B3);
  Color secondaryColor = const Color(0xFFFFFFFF);
  Color secondaryHoverColor = const Color(0xFFF5F5F5);
  Color tertiaryColor = const Color(0xFF0000FF);
  Color tertiaryHoverColor = const Color(0xFF6666FF);
  Color disabledColor = const Color(0xFF9E9E9E);
  double borderRadius = 8;
  String fontFamily = 'Roboto';

  Future<void> loadFromJson(Map<String, dynamic> json) async {
    primaryColor = _hexToColor(json["primaryColor"]);
    primaryHoverColor = _hexToColor(json["primaryHoverColor"]);
    secondaryColor = _hexToColor(json["secondaryColor"]);
    secondaryHoverColor = _hexToColor(json["secondaryHoverColor"]);
    tertiaryColor = _hexToColor(json["tertiaryColor"]);
    tertiaryHoverColor = _hexToColor(json["tertiaryHoverColor"]);
    disabledColor = _hexToColor(json["disabledColor"]);
    borderRadius = (json["borderRadius"] ?? 8).toDouble();
    fontFamily = json["fontFamily"] ?? "Roboto";
  }

  Color getColor(ButtonType type, ButtonState state) {
    if (state == ButtonState.disabled) return disabledColor;
    if (state == ButtonState.hover) {
      switch (type) {
        case ButtonType.primary:
          return primaryHoverColor;
        case ButtonType.secondary:
          return secondaryHoverColor;
        case ButtonType.tertiary:
          return Colors.transparent; // text color will change
      }
    }
    switch (type) {
      case ButtonType.primary:
        return primaryColor;
      case ButtonType.secondary:
        return secondaryColor;
      case ButtonType.tertiary:
        return Colors.transparent;
    }
  }

  Color getTextColor(ButtonType type, ButtonState state) {
    if (state == ButtonState.disabled) return disabledColor;
    if (type == ButtonType.tertiary && state == ButtonState.hover) {
      return tertiaryHoverColor;
    }
    if (type == ButtonType.primary || type == ButtonType.tertiary) {
      return Colors.white;
    }
    if (type == ButtonType.secondary) {
      return Colors.black;
    }
    return Colors.black;
  }

  Color _hexToColor(String hex) {
    hex = hex.replaceFirst('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return Color(int.parse(hex, radix: 16));
  }
}

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonType type;
  final ButtonSize size;
  final ButtonState state;

  const AppButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.size = ButtonSize.medium,
    this.state = ButtonState.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = ButtonConfig();
    final double height = ButtonProperties.height[size]!;
    final double fontSize = ButtonProperties.fontSize[size]!;
    final EdgeInsets padding = ButtonProperties.padding[size]!;

    final Color bgColor = config.getColor(type, state);
    final Color textColor = config.getTextColor(type, state);
    final bool isDisabled = state == ButtonState.disabled || onPressed == null;

    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(bgColor),
          padding: WidgetStateProperty.all(padding),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(config.borderRadius),
            ),
          ),
          overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.hovered)) {
              if (type == ButtonType.tertiary) {
                return Colors.transparent;
              }
              return bgColor;
            }
            return null;
          }),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontFamily: config.fontFamily,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}




// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'button_properties.dart';

// class ButtonConfig {
//   final Color primaryColor;
//   final Color secondaryColor;
//   final Color tertiaryColor;
//   final Color disabledColor;
//   final Color hoverOverlayColor;
//   final double borderRadius;
//   final String fontFamily;

//   ButtonConfig({
//     required this.primaryColor,
//     required this.secondaryColor,
//     required this.tertiaryColor,
//     required this.disabledColor,
//     required this.hoverOverlayColor,
//     required this.borderRadius,
//     required this.fontFamily,
//   });

//   factory ButtonConfig.fromJson(Map<String, dynamic> json) {
//     return ButtonConfig(
//       primaryColor: _hexToColor(json['primaryColor']),
//       secondaryColor: _hexToColor(json['secondaryColor']),
//       tertiaryColor: _hexToColor(json['tertiaryColor']),
//       disabledColor: _hexToColor(json['disabledColor']),
//       hoverOverlayColor: _hexToColor(json['hoverOverlayColor']),
//       borderRadius: (json['borderRadius'] as num).toDouble(),
//       fontFamily: json['fontFamily'],
//     );
//   }

//   static Color _hexToColor(String hex) {
//     hex = hex.replaceFirst('#', '');
//     if (hex.length == 6) hex = 'FF$hex';
//     return Color(int.parse(hex, radix: 16));
//   }
// }

// class ButtonConfigLoader {
//   static ButtonConfig? _config;

//   static Future<ButtonConfig> loadConfig() async {
//     if (_config != null) return _config!;
//     final jsonStr = await rootBundle.loadString('assets/button_config.json');
//     final jsonData = json.decode(jsonStr);
//     _config = ButtonConfig.fromJson(jsonData);
//     return _config!;
//   }
// }

// class AppButton extends StatelessWidget {
//   final String label;
//   final VoidCallback? onPressed;
//   final ButtonType type;
//   final ButtonSize size;
//   final ButtonState state;

//   const AppButton({
//     Key? key,
//     required this.label,
//     required this.onPressed,
//     this.type = ButtonType.primary,
//     this.size = ButtonSize.medium,
//     this.state = ButtonState.normal,
//   }) : super(key: key);

//   Color _getColor(ButtonConfig config) {
//     if (state == ButtonState.disabled) return config.disabledColor;
//     switch (type) {
//       case ButtonType.primary:
//         return config.primaryColor;
//       case ButtonType.secondary:
//         return config.secondaryColor;
//       case ButtonType.tertiary:
//         return config.tertiaryColor;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<ButtonConfig>(
//       future: ButtonConfigLoader.loadConfig(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return const SizedBox(); // Or a placeholder
//         }

//         final config = snapshot.data!;
//         final color = _getColor(config);

//         return ElevatedButton(
//           onPressed: state == ButtonState.disabled ? null : onPressed,
//           style: ElevatedButton.styleFrom(
//             backgroundColor: color,
//             padding: ButtonProperties.padding[size],
//             minimumSize: Size.fromHeight(ButtonProperties.height[size]!),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(config.borderRadius),
//             ),
//             textStyle: TextStyle(
//               fontSize: ButtonProperties.fontSize[size],
//               fontFamily: config.fontFamily,
//             ),
//           ),
//           child: Text(label),
//         );
//       },
//     );
//   }
// }
