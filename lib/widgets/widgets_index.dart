import 'package:flutter/material.dart';
// Alerts
import 'alerts/alerts.dart';
// Badges (example: sm)
// import 'badges/sm/example.dart';
// Buttons
import 'buttons/custom.dart';
// Categories
import 'categories/horizontal.dart';
import 'categories/verytical.dart';
// Chips
import 'chips/active.dart';
import 'chips/disabled.dart';
// Dropdown
import 'dropdown/states/default.dart' as dropdown_default;
// Footer (example: split_buttons)
// import 'footer/split_buttons.dart/pri_md_default.dart';
// Header
import 'header/with_ticker.dart';
import 'header/without_ticker.dart';
// Home Indicator
import 'home_indicator/dark.dart';
import 'home_indicator/light.dart';
// Input Fields
import 'input_fields/states/default.dart' as input_default;
import 'input_fields/variants/simple_input.dart';
// List Contents
import 'list_contents/label.dart';
import 'list_contents/two_line.dart';
// Logo
import 'logo/logo1.dart';
import 'logo/logo2.dart';
// Menu
import 'menu/menu.dart';
// Navbar
import 'navbar/navbar.dart';
// Pop Over
import 'pop_over/default.dart';
// Progress Bar
import 'progress_bar/with_label.dart';
// Progress Circle
import 'progress_circle/with_label/xs.dart';
// Progress Step
import 'progress_step/progress_step.dart';
// Promotions
import 'promotions/poromotions.dart';
// Searchbar
import 'searchbar/enabled_lg.dart';
// Selection
import 'selection/variants/icon_with_one_txt_line.dart';
// Sliders
import 'sliders/sliders.dart';
// Status Bar
import 'status_bar/dark.dart';
import 'status_bar/light.dart';
// Tabs
import 'tabs/tabs.dart';
// Tags
import 'tags/rectangle.dart';
import 'tags/round.dart';
// Tooltip
import 'tooltip/with_supporting_txt.dart';
import 'tooltip/without_supporting_txt.dart';

class WidgetDemo {
  final String name;
  final WidgetBuilder builder;
  const WidgetDemo({required this.name, required this.builder});
}

final List<WidgetDemo> widgetDemos = [
  WidgetDemo(name: 'Alerts', builder: (_) => Property1Default()),
  // WidgetDemo(name: 'Custom Button', builder: (_) => CustomButton()), // Uncomment and fix if CustomButton exists
  WidgetDemo(name: 'Categories Horizontal', builder: (_) => AppCategoriesHorizontal()),
  WidgetDemo(name: 'Categories Vertical', builder: (_) => AppCategoriesVertical()),
  WidgetDemo(name: 'Chips Active', builder: (_) => Property1Active()),
  WidgetDemo(name: 'Chips Disabled', builder: (_) => Property1Disable()),
  WidgetDemo(name: 'Dropdown Default', builder: (_) => dropdown_default.StateDefault()),
  WidgetDemo(name: 'Header With Ticker', builder: (_) => TypeWithTicker()),
  WidgetDemo(name: 'Header Without Ticker', builder: (_) => TypeWithoutTicker()),
  WidgetDemo(name: 'Home Indicator Dark', builder: (_) => DarkModeTrue()),
  WidgetDemo(name: 'Home Indicator Light', builder: (_) => DarkModeFalse()),
  WidgetDemo(name: 'Input Field Default', builder: (_) => input_default.StateDefault()),
  WidgetDemo(name: 'Input Field Simple', builder: (_) => InputField()),
  WidgetDemo(name: 'List Label', builder: (_) => TypeValue()),
  WidgetDemo(name: 'List Two Line', builder: (_) => TypeSideBySide()),
  WidgetDemo(name: 'Logo 1', builder: (_) => LogoMainLogo()),
  WidgetDemo(name: 'Logo 2', builder: (_) => LogoMainLogoDarkText()),
  WidgetDemo(name: 'Menu', builder: (_) => Menu()),
  WidgetDemo(name: 'Navbar', builder: (_) => NavFooter()),
  WidgetDemo(name: 'Pop Over Default', builder: (_) => StateDefault()),
  WidgetDemo(name: 'Progress Bar With Label', builder: (_) => Progress0LabelRight()),
  WidgetDemo(name: 'Progress Circle XS With Label', builder: (_) => SizeXsLabelTrue()),
  WidgetDemo(name: 'Progress Step', builder: (_) => ProgressSteps()),
  WidgetDemo(name: 'Promotions', builder: (_) => Promotions()),
  WidgetDemo(name: 'Searchbar Enabled LG', builder: (_) => StateEnabledSizeLg()),
  WidgetDemo(name: 'Selection Icon With One Text Line', builder: (_) => Property1WithPriTxt()),
  WidgetDemo(name: 'Sliders', builder: (_) => WebLayoutMb()),
  WidgetDemo(name: 'Status Bar Dark', builder: (_) => DarkModeOn()),
  WidgetDemo(name: 'Status Bar Light', builder: (_) => DarkModeOff()),
  WidgetDemo(name: 'Tabs', builder: (_) => HorizontalTabs()),
  WidgetDemo(name: 'Tags Rectangle', builder: (_) => StatusDefaultStyleRectangle()),
  WidgetDemo(name: 'Tags Round', builder: (_) => StatusDefaultStyleRound()),
  WidgetDemo(name: 'Tooltip With Supporting Text', builder: (_) => Content()),
  WidgetDemo(name: 'Tooltip Without Supporting Text', builder: (_) => SupportingTextFalseArrowNone()),
]; 