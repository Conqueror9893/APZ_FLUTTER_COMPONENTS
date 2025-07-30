import 'package:apz_flutter_components/components/apz_button/button_style_config.dart';
import 'package:apz_flutter_components/components/appz_progress_bar/progress_bar_style_config.dart';
import 'package:flutter/material.dart';
import 'package:apz_flutter_components/components/appz_dropdown_field/dropdown_style_config.dart';
import 'package:apz_flutter_components/components/appz_input_field/appz_input_style_config.dart';
import 'package:apz_flutter_components/components/appz_category/appz_category_style_config.dart';
import 'example/appz_footer_menu_example.dart';
import 'package:apz_flutter_components/components/appz_checkbox/checkbox_style_config.dart';
import 'package:apz_flutter_components/components/appz_radio/radio_style_config.dart';
import 'package:apz_flutter_components/components/appz_toggle/toggle_style_config.dart';
import 'package:apz_flutter_components/components/appz_toggle_with_label/toggle_with_label_style_config.dart';
import 'package:apz_flutter_components/components/appz_footer_menu/footer_menu_style_config.dart';

Future<void> main() async {
  // Ensure that widget binding is initialized before calling native code.
  WidgetsFlutterBinding.ensureInitialized();

  await DropdownStyleConfig.instance.load();
  await AppzStyleConfig.instance.load();
  await ProgressBarStyleConfig.instance.load();
  await ButtonStyleConfig.instance.load();
  await AppzCategoryStyleConfig.instance.load();
  await CheckboxStyleConfig.instance.load();
  await RadioStyleConfig.instance.load();
  await ToggleStyleConfig.instance.load();
  await ToggleWithLabelStyleConfig.instance.load();
  await FooterMenuStyleConfig.instance.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppzInputField Demo V2',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const AppzFooterMenuExample(),
      debugShowCheckedModeBanner: false, // Optional: to hide the debug banner
    );
  }
}
