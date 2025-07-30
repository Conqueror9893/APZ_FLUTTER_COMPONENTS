import 'package:flutter/material.dart';

class FooterMenuItem {
  final String iconPath;
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  const FooterMenuItem({
    required this.iconPath,
    required this.label,
    this.isSelected = false,
    this.onTap,
  });

  FooterMenuItem copyWith({
    String? iconPath,
    String? label,
    bool? isSelected,
    VoidCallback? onTap,
  }) {
    return FooterMenuItem(
      iconPath: iconPath ?? this.iconPath,
      label: label ?? this.label,
      isSelected: isSelected ?? this.isSelected,
      onTap: onTap ?? this.onTap,
    );
  }
}
