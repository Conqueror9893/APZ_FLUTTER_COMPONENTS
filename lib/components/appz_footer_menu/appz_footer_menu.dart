import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'footer_menu_style_config.dart';
import 'model/footer_menu_item.dart';

class AppzFooterMenu extends StatefulWidget {
  final List<FooterMenuItem> menuItems;
  final int selectedIndex;
  final Function(int)? onItemSelected;
  final VoidCallback? onFabTap;
  final String? fabIconPath;

  const AppzFooterMenu({
    Key? key,
    required this.menuItems,
    this.selectedIndex = 0,
    this.onItemSelected,
    this.onFabTap,
    this.fabIconPath,
  }) : super(key: key);

  @override
  State<AppzFooterMenu> createState() => _AppzFooterMenuState();
}

class _AppzFooterMenuState extends State<AppzFooterMenu> {
  late final FooterMenuStyleConfig _styleConfig;
  bool _styleLoaded = false;

  @override
  void initState() {
    super.initState();
    _styleConfig = FooterMenuStyleConfig.instance;
    _loadStyle();
  }

  Future<void> _loadStyle() async {
    await _styleConfig.load();
    if (mounted) {
      setState(() {
        _styleLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_styleLoaded) return const SizedBox.shrink();

    return Scaffold(
      floatingActionButton: Container(
        width: _styleConfig.fabSize,
        height: _styleConfig.fabSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: _styleConfig.fabShadow,
        ),
        child: FloatingActionButton(
          onPressed: widget.onFabTap,
          backgroundColor: _styleConfig.fabBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_styleConfig.fabBorderRadius),
          ),
          child: SvgPicture.asset(
            widget.fabIconPath ?? _styleConfig.fabIcon,
            width: _styleConfig.fabIconSize,
            height: _styleConfig.fabIconSize,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: widget.menuItems.length,
        activeIndex: widget.selectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: _styleConfig.leftCornerRadius,
        rightCornerRadius: _styleConfig.rightCornerRadius,
        notchMargin: 10,
        height: _styleConfig.bottomNavHeight,
        shadow: _styleConfig.bottomNavShadow,
        tabBuilder: (index, isActive) {
          final item = widget.menuItems[index];
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: _styleConfig.bottomNavContainerPaddingHorizontal,
              vertical: _styleConfig.bottomNavContainerPaddingVertical,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: _styleConfig.bottomNavMenuItemPaddingHorizontal,
              vertical: _styleConfig.bottomNavMenuItemPaddingVertical,
            ),
            decoration: BoxDecoration(
              color: isActive
                  ? _styleConfig.bottomNavActiveColor
                  : _styleConfig.bottomNavInactiveColor,
              borderRadius:
                  BorderRadius.circular(_styleConfig.bottomNavBorderRadius),
            ),
            child: SvgPicture.asset(
              item.iconPath,
              width: _styleConfig.menuItemIconSize,
              height: _styleConfig.menuItemIconSize,
            ),
          );
        },
        onTap: (index) {
          if (widget.onItemSelected != null) {
            widget.onItemSelected!(index);
          }
        },
      ),
      body: const SizedBox.shrink(), // or pass a child via widget if needed
    );
  }
}
