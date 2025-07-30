import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'footer_menu_style_config.dart';
import 'model/footer_menu_item.dart';
import 'nav_clipper.dart';

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
  double? h, w;

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

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: widget.onFabTap,
        backgroundColor: _styleConfig.fabBackgroundColor,
        child: SvgPicture.asset(
          widget.fabIconPath ?? _styleConfig.fabIcon,
          width: _styleConfig.fabIconSize,
          height: _styleConfig.fabIconSize,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipPath(
        clipper: NavClipper(
          h: h,
          w: w,
          r: 10,
          lcr: _styleConfig.leftCornerRadius,
          rcr: _styleConfig.rightCornerRadius,
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: _styleConfig.bottomNavNotchMargin,
          color: _styleConfig.bottomNavBackgroundColor,
          child: SizedBox(
            height: _styleConfig.bottomNavHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(widget.menuItems.length, (index) {
                final item = widget.menuItems[index];
                final bool isSelected = index == widget.selectedIndex;
                return IconButton(
                  icon: SvgPicture.asset(
                    item.iconPath,
                    color: isSelected
                        ? _styleConfig.bottomNavActiveColor
                        : _styleConfig.bottomNavInactiveColor,
                  ),
                  onPressed: () {
                    if (widget.onItemSelected != null) {
                      widget.onItemSelected!(index);
                    }
                  },
                );
              }),
            ),
          ),
        ),
      ),
      body: const SizedBox.shrink(),
    );
  }
}
