import 'package:apz_flutter_components/common/token_parser.dart';
import 'package:flutter/material.dart';

class FooterMenuStyleConfig {
  static final FooterMenuStyleConfig instance =
      FooterMenuStyleConfig._internal();
  final TokenParser _tokenParser = TokenParser();

  FooterMenuStyleConfig._internal();

  Future<void> load() async {
    await _tokenParser.loadTokens();
  }

  // Container dimensions
  double get containerWidth =>
      _tokenParser.getValue<double>(['footerMenu', 'container', 'width'],
          fromSupportingTokens: true) ??
      375.0;
  double get containerHeight =>
      _tokenParser.getValue<double>(['footerMenu', 'container', 'height'],
          fromSupportingTokens: true) ??
      129.0;

  EdgeInsets get containerPadding {
    final paddingMap = _tokenParser.getValue<Map<String, dynamic>>(
        ['footerMenu', 'container', 'padding'],
        fromSupportingTokens: true);
    if (paddingMap != null) {
      return EdgeInsets.symmetric(
        horizontal: (paddingMap['horizontal'] as num).toDouble(),
        vertical: (paddingMap['vertical'] as num).toDouble(),
      );
    }
    return EdgeInsets.symmetric(horizontal: 24.0, vertical: 0.0);
  }

  // Menu items styling
  double get menuItemHeight =>
      _tokenParser.getValue<double>(['footerMenu', 'menuItems', 'height'],
          fromSupportingTokens: true) ??
      39.08;
  double get menuItemSpacing =>
      _tokenParser.getValue<double>(['footerMenu', 'menuItems', 'spacing'],
          fromSupportingTokens: true) ??
      16.0;
  double get menuItemIconSize =>
      _tokenParser.getValue<double>(['footerMenu', 'menuItems', 'iconSize'],
          fromSupportingTokens: true) ??
      23.08;

  EdgeInsets get menuItemPadding {
    final paddingMap = _tokenParser.getValue<Map<String, dynamic>>(
        ['footerMenu', 'menuItems', 'padding'],
        fromSupportingTokens: true);
    if (paddingMap != null) {
      return EdgeInsets.symmetric(
        horizontal: (paddingMap['horizontal'] as num).toDouble(),
        vertical: (paddingMap['vertical'] as num).toDouble(),
      );
    }
    return EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
  }

  double get menuItemBorderRadius =>
      _tokenParser.getValue<double>(['footerMenu', 'menuItems', 'borderRadius'],
          fromSupportingTokens: true) ??
      100.0;

  // Center button styling
  double get centerButtonSize =>
      _tokenParser.getValue<double>(['footerMenu', 'centerButton', 'size'],
          fromSupportingTokens: true) ??
      70.0;
  double get centerButtonBorderRadius =>
      _tokenParser.getValue<double>(
          ['footerMenu', 'centerButton', 'borderRadius'],
          fromSupportingTokens: true) ??
      175.0;
  double get centerButtonIconSize =>
      _tokenParser.getValue<double>(['footerMenu', 'centerButton', 'iconSize'],
          fromSupportingTokens: true) ??
      29.17;

  Offset get centerButtonIconOffset {
    final offsetMap = _tokenParser.getValue<Map<String, dynamic>>(
        ['footerMenu', 'centerButton', 'iconOffset'],
        fromSupportingTokens: true);
    if (offsetMap != null) {
      return Offset(
        (offsetMap['left'] as num).toDouble(),
        (offsetMap['top'] as num).toDouble(),
      );
    }
    return const Offset(19.81, 20.66);
  }

  // Colors
  Color get selectedBackgroundColor {
    final colorHex = _tokenParser.getValue<String>(
        ['footerMenu', 'colors', 'selectedBackground'],
        fromSupportingTokens: true);
    return _parseColor(colorHex ?? '#B9DCFE');
  }

  Color get centerButtonBackgroundColor {
    final colorHex = _tokenParser.getValue<String>(
        ['footerMenu', 'colors', 'centerButtonBackground'],
        fromSupportingTokens: true);
    return _parseColor(colorHex ?? '#0054A6');
  }

  // Shadow
  List<BoxShadow> get centerButtonShadow {
    final shadowMap = _tokenParser.getValue<Map<String, dynamic>>(
        ['footerMenu', 'centerButton', 'shadow'],
        fromSupportingTokens: true);
    if (shadowMap != null) {
      return [
        BoxShadow(
          color: _parseColor(shadowMap['color'] as String? ?? '#E5000000'),
          blurRadius: (shadowMap['blurRadius'] as num).toDouble(),
          offset: Offset(
            (shadowMap['offsetX'] as num).toDouble(),
            (shadowMap['offsetY'] as num).toDouble(),
          ),
          spreadRadius: (shadowMap['spreadRadius'] as num).toDouble(),
        ),
      ];
    }
    return [
      const BoxShadow(
        color: Color(0xE5000000),
        blurRadius: 25.0,
        offset: Offset(0, 6),
        spreadRadius: 0,
      ),
    ];
  }

  // Icons
  String getIconPath(String iconName) {
    return _tokenParser.getValue<String>(['footerMenu', 'icons', iconName],
            fromSupportingTokens: true) ??
        'assets/icons/$iconName.svg';
  }

  // FAB (Floating Action Button) styling
  double get fabSize =>
      _tokenParser.getValue<double>(['footerMenu', 'fab', 'size'],
          fromSupportingTokens: true) ??
      70.0;
  double get fabBorderRadius =>
      _tokenParser.getValue<double>(['footerMenu', 'fab', 'borderRadius'],
          fromSupportingTokens: true) ??
      44.0;
  Color get fabBackgroundColor => _parseColor(_tokenParser.getValue<String>(
      ['footerMenu', 'fab', 'backgroundColor'],
      fromSupportingTokens: true));
  String get fabIcon =>
      _tokenParser.getValue<String>(['footerMenu', 'fab', 'icon'],
          fromSupportingTokens: true) ??
      '';
  double get fabIconSize =>
      _tokenParser.getValue<double>(['footerMenu', 'fab', 'iconSize'],
          fromSupportingTokens: true) ??
      32.0;
  List<BoxShadow> get fabShadow {
    final shadowMap = _tokenParser.getValue<Map<String, dynamic>>(
        ['footerMenu', 'fab', 'shadow'],
        fromSupportingTokens: true);
    if (shadowMap != null) {
      return [
        BoxShadow(
          color: _parseColor(shadowMap['color'] as String? ?? '#E6000000'),
          blurRadius: (shadowMap['blurRadius'] as num).toDouble(),
          offset: Offset(
            (shadowMap['offsetX'] as num).toDouble(),
            (shadowMap['offsetY'] as num).toDouble(),
          ),
          spreadRadius: (shadowMap['spreadRadius'] as num).toDouble(),
        ),
      ];
    }
    return [
      const BoxShadow(
        color: Color(0xE6000000),
        blurRadius: 25.0,
        offset: Offset(0, 6),
        spreadRadius: 0,
      ),
    ];
  }

  // Bottom Navigation Bar styling
  double get bottomNavHeight =>
      _tokenParser.getValue<double>(['footerMenu', 'bottomNav', 'height'],
          fromSupportingTokens: true) ??
      88.0;
  double get bottomNavMargin =>
      _tokenParser.getValue<double>(['footerMenu', 'bottomNav', 'margin'],
          fromSupportingTokens: true) ??
      20.0;
  EdgeInsets get bottomNavPadding {
    final paddingMap = _tokenParser.getValue<Map<String, dynamic>>(
        ['footerMenu', 'bottomNav', 'padding'],
        fromSupportingTokens: true);
    if (paddingMap != null) {
      return EdgeInsets.symmetric(
        horizontal: (paddingMap['horizontal'] as num).toDouble(),
        vertical: (paddingMap['vertical'] as num).toDouble(),
      );
    }
    return EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0);
  }

  Color get bottomNavBackgroundColor => _parseColor(_tokenParser
      .getValue<String>(['footerMenu', 'bottomNav', 'backgroundColor'],
          fromSupportingTokens: true));
  Color get bottomNavActiveColor => _parseColor(_tokenParser.getValue<String>(
      ['footerMenu', 'bottomNav', 'activeColor'],
      fromSupportingTokens: true));
  Color get bottomNavInactiveColor => _parseColor(_tokenParser.getValue<String>(
      ['footerMenu', 'bottomNav', 'inactiveColor'],
      fromSupportingTokens: true));
  double get bottomNavBorderRadius =>
      _tokenParser.getValue<double>(['footerMenu', 'bottomNav', 'borderRadius'],
          fromSupportingTokens: true) ??
      24.0;
  BoxShadow get bottomNavShadow {
    final shadowColor = _tokenParser.getValue<String>(
      ['footerMenu', 'bottomNav', 'boxShadow', 'color'],
      fromSupportingTokens: true,
    );
    if (shadowColor != null) {
      return BoxShadow(
        color: _parseColor(shadowColor),
        blurRadius: 20,
      );
    }
    return BoxShadow(
      color: Colors.black.withOpacity(0.3),
      blurRadius: 20,
    );
  }

  double get bottomNavNotchMargin =>
      _tokenParser.getValue<double>(
        ['footerMenu', 'bottomNav', 'notchMargin'],
        fromSupportingTokens: true,
      ) ??
      60.0;

  double get bottomNavContainerPaddingHorizontal =>
      _tokenParser.getValue<double>(
        [
          'footerMenu',
          'bottomNav',
          'container',
          'padding',
          'horizontal',
        ],
        fromSupportingTokens: true,
      ) ??
      16.0;

  double get bottomNavContainerPaddingVertical =>
      _tokenParser.getValue<double>(
        [
          'footerMenu',
          'bottomNav',
          'container',
          'padding',
          'vertical',
        ],
        fromSupportingTokens: true,
      ) ??
      24.0;

  double get bottomNavMenuItemPaddingHorizontal =>
      _tokenParser.getValue<double>(
        [
          'footerMenu',
          'bottomNav',
          'menuItem',
          'padding',
          'horizontal',
        ],
        fromSupportingTokens: true,
      ) ??
      16.0;

  double get bottomNavMenuItemPaddingVertical =>
      _tokenParser.getValue<double>(
        [
          'footerMenu',
          'bottomNav',
          'menuItem',
          'padding',
          'vertical',
        ],
        fromSupportingTokens: true,
      ) ??
      8.0;

  double get leftCornerRadius =>
      _tokenParser.getValue<double>(
        ['footerMenu', 'bottomNav', 'leftCornerRadius'],
        fromSupportingTokens: true,
      ) ??
      32.0;

  double get rightCornerRadius =>
      _tokenParser.getValue<double>(
        ['footerMenu', 'bottomNav', 'rightCornerRadius'],
        fromSupportingTokens: true,
      ) ??
      32.0;

  Color _parseColor(String? hexColor) {
    if (hexColor == null) return Colors.transparent;

    // Remove # if present
    hexColor = hexColor.replaceAll('#', '');

    // Handle different hex formats
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor'; // Add alpha channel
    } else if (hexColor.length == 8) {
      // Already has alpha channel
    } else {
      return Colors.transparent;
    }

    try {
      return Color(int.parse(hexColor, radix: 16));
    } catch (e) {
      return Colors.transparent;
    }
  }
}
