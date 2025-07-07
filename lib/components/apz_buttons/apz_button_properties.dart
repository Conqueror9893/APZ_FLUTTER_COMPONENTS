import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, tertiary }
enum ButtonSize { small, medium, large }
enum ButtonState { normal, hover, disabled }

class ButtonProperties {
  static const Map<ButtonSize, double> height = {
    ButtonSize.small: 32,
    ButtonSize.medium: 48,
    ButtonSize.large: 56,
  };

  static const Map<ButtonSize, double> fontSize = {
    ButtonSize.small: 12,
    ButtonSize.medium: 14,
    ButtonSize.large: 16,
  };

  static const Map<ButtonSize, EdgeInsets> padding = {
    ButtonSize.small: EdgeInsets.symmetric(horizontal: 12),
    ButtonSize.medium: EdgeInsets.symmetric(horizontal: 16),
    ButtonSize.large: EdgeInsets.symmetric(horizontal: 20),
  };

  // Fallback color mapping if config not used
  static const Map<ButtonType, Map<ButtonState, Color>> defaultColors = {
    ButtonType.primary: {
      ButtonState.normal: Color(0xFF6200EE),
      ButtonState.hover: Color(0xFF3700B3),
      ButtonState.disabled: Color(0xFF9E9E9E),
    },
    ButtonType.secondary: {
      ButtonState.normal: Color(0xFF03DAC6),
      ButtonState.hover: Color(0xFF018786),
      ButtonState.disabled: Color(0xFF9E9E9E),
    },
    ButtonType.tertiary: {
      ButtonState.normal: Color(0xFF018786),
      ButtonState.hover: Color(0xFF03DAC6),
      ButtonState.disabled: Color(0xFF9E9E9E),
    },
  };
}
