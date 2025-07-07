import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'appz_input_field_enums.dart';

// Helper function to parse color from hex string
Color _parseColor(String? hexColor, Color defaultColor) {
  if (hexColor == null || hexColor.isEmpty) return defaultColor;
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor"; // Add alpha if missing
  }
  if (hexColor.length == 8) {
    try {
      return Color(int.parse(hexColor, radix: 16));
    } catch (e) {
      // Fallback to default if parsing fails
      print("Error parsing color: $hexColor. Error: $e");
      return defaultColor;
    }
  }
  return defaultColor;
}

class AppzStateStyle {
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final Color labelColor;
  final String fontFamily;
  final double fontSize;
  final double labelFontSize;
  final double paddingHorizontal;
  final double paddingVertical;

  const AppzStateStyle({
    required this.borderColor,
    this.borderWidth = 1.0,
    required this.borderRadius,
    required this.backgroundColor,
    required this.textColor,
    required this.labelColor,
    required this.fontFamily,
    required this.fontSize,
    required this.labelFontSize,
    required this.paddingHorizontal,
    required this.paddingVertical,
  });

  // Factory to create from JSON, merging with a base (default) style
  factory AppzStateStyle.fromJson(Map<String, dynamic> json, AppzStateStyle baseStyle) {
    return AppzStateStyle(
      borderColor: _parseColor(json['borderColor'] as String?, baseStyle.borderColor),
      borderWidth: (json['borderWidth'] as num?)?.toDouble() ?? baseStyle.borderWidth,
      borderRadius: (json['borderRadius'] as num?)?.toDouble() ?? baseStyle.borderRadius,
      backgroundColor: _parseColor(json['backgroundColor'] as String?, baseStyle.backgroundColor),
      textColor: _parseColor(json['textColor'] as String?, baseStyle.textColor),
      labelColor: _parseColor(json['labelColor'] as String?, baseStyle.labelColor),
      fontFamily: json['fontFamily'] as String? ?? baseStyle.fontFamily,
      fontSize: (json['fontSize'] as num?)?.toDouble() ?? baseStyle.fontSize,
      labelFontSize: (json['labelFontSize'] as num?)?.toDouble() ?? baseStyle.labelFontSize,
      paddingHorizontal: (json['paddingHorizontal'] as num?)?.toDouble() ?? baseStyle.paddingHorizontal,
      paddingVertical: (json['paddingVertical'] as num?)?.toDouble() ?? baseStyle.paddingVertical,
    );
  }

  // Creates a style by overriding properties of this style with another one (for merging)
  AppzStateStylecopyWith(AppzStateStyle? overrideStyle) {
    if (overrideStyle == null) return this;
    return AppzStateStyle(
      borderColor: overrideStyle.borderColor, // Assuming overrideStyle is already resolved from JSON
      borderWidth: overrideStyle.borderWidth,
      borderRadius: overrideStyle.borderRadius,
      backgroundColor: overrideStyle.backgroundColor,
      textColor: overrideStyle.textColor,
      labelColor: overrideStyle.labelColor,
      fontFamily: overrideStyle.fontFamily,
      fontSize: overrideStyle.fontSize,
      labelFontSize: overrideStyle.labelFontSize,
      paddingHorizontal: overrideStyle.paddingHorizontal,
      paddingVertical: overrideStyle.paddingVertical,
    );
  }
}

class AppzStyleConfig {
  AppzStyleConfig._privateConstructor();
  static final AppzStyleConfig _instance = AppzStyleConfig._privateConstructor();
  static AppzStyleConfig get instance => _instance;

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  late AppzStateStyle _defaultStyle;
  Map<String, Map<String, dynamic>> _rawJsonStyles = {}; // To store the raw JSON for merging

  // Hardcoded fallback default style
  static final AppzStateStyle _fallbackDefaultStyle = AppzStateStyle(
    borderColor: _parseColor("#D9D9D9", Colors.grey),
    borderWidth: 1.0,
    borderRadius: 10.0,
    backgroundColor: _parseColor("#F6F6F6", Colors.grey[200]!),
    textColor: _parseColor("#000000", Colors.black),
    labelColor: _parseColor("#333333", Colors.black87),
    fontFamily: "Inter",
    fontSize: 14.0,
    labelFontSize: 12.0,
    paddingHorizontal: 12.0,
    paddingVertical: 10.0,
  );

  Future<void> load(String assetPath) async {
    if (_isInitialized) return;

    try {
      final String jsonString = await rootBundle.loadString(assetPath);
      _rawJsonStyles = Map<String, Map<String, dynamic>>.from(json.decode(jsonString) as Map);

      // Initialize _defaultStyle from JSON or fallback
      final defaultJson = _rawJsonStyles['default'];
      if (defaultJson != null) {
        _defaultStyle = AppzStateStyle.fromJson(defaultJson, _fallbackDefaultStyle); // Base fallback for default itself
      } else {
        print("Warning: 'default' style not found in input_ui_config.json. Using hardcoded fallback default style.");
        _defaultStyle = _fallbackDefaultStyle;
      }
      _isInitialized = true;
      print("AppzStyleConfig loaded successfully from $assetPath.");
    } catch (e) {
      print("Error loading UI config from $assetPath: $e. Using hardcoded fallback default style for all states.");
      _defaultStyle = _fallbackDefaultStyle; // Use fallback if any error occurs
      _rawJsonStyles = {}; // Clear raw styles to ensure fallback is used consistently
      _isInitialized = true;
    }
  }

  AppzStateStyle _getRawStyleForStateName(String stateName) {
    final stateJson = _rawJsonStyles[stateName];
    if (stateJson != null) {
      // When creating a style for a specific state (e.g., "focused"),
      // it should use the fully resolved "_defaultStyle" as its base for merging.
      return AppzStateStyle.fromJson(stateJson, _defaultStyle);
    }
    // If the specific state (e.g. "focused") is not in JSON, it fully inherits from default.
    return _defaultStyle;
  }

  AppzStateStyle getStyleForState(AppzFieldState state, {bool isFilled = false}) {
    if (!_isInitialized) {
      print("Warning: AppzStyleConfig not initialized or load failed. Returning complete fallback style.");
      return _fallbackDefaultStyle;
    }

    AppzStateStyle currentStyle;

    switch (state) {
      case AppzFieldState.defaultState:
        currentStyle = _defaultStyle;
        break;
      case AppzFieldState.focused:
        currentStyle = _getRawStyleForStateName('focused');
        break;
      case AppzFieldState.error:
        currentStyle = _getRawStyleForStateName('error');
        break;
      case AppzFieldState.disabled:
        currentStyle = _getRawStyleForStateName('disabled');
        break;
      case AppzFieldState.filled:
        // 'filled' state might primarily inherit from default, but can have overrides
        currentStyle = _getRawStyleForStateName('filled');
        break;
      default:
        currentStyle = _defaultStyle;
    }

    // If the field is filled, and there's a specific "filled" configuration,
    // let its background override the current state's background if it's different from default.
    // This logic might need refinement based on desired behavior.
    // If the field `isFilled` (meaning it has text), AND the current state is NOT `AppzFieldState.filled` itself
    // (to avoid double processing if 'filled' was the primary state chosen by the switch),
    // then we check if the 'filled' configuration in JSON has any specific overrides.
    // These overrides are then applied ON TOP of the `currentStyle` determined by the primary state.
    if (isFilled && state != AppzFieldState.filled) {
        final filledStyleJsonOverrides = _rawJsonStyles['filled'];
        if (filledStyleJsonOverrides != null) {
            // Apply 'filled' overrides on top of the 'currentStyle'
            // The base for AppzStateStyle.fromJson here is the currentStyle from the switch case
            return AppzStateStyle.fromJson(filledStyleJsonOverrides, currentStyle);
        }
    }
    return currentStyle;
  }

   // Helper to create a copy of AppzStateStyle with some properties overridden
   // This is not used directly by AppzStateStyle.fromJson but can be useful externally if needed.
}

// Extension on AppzStateStyle to provide a copyWith method.
extension AppzStateStyleCopyWithExtension on AppzStateStyle {
  AppzStateStyle copyWith({
    Color? borderColor,
    double? borderWidth,
    double? borderRadius,
    Color? backgroundColor,
    Color? textColor,
    Color? labelColor,
    String? fontFamily,
    double? fontSize,
    double? labelFontSize,
    double? paddingHorizontal,
    double? paddingVertical,
  }) {
    return AppzStateStyle(
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      labelColor: labelColor ?? this.labelColor,
      fontFamily: fontFamily ?? this.fontFamily,
      fontSize: fontSize ?? this.fontSize,
      labelFontSize: labelFontSize ?? this.labelFontSize,
      paddingHorizontal: paddingHorizontal ?? this.paddingHorizontal,
      paddingVertical: paddingVertical ?? this.paddingVertical,
    );
  }
}
