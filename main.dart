import 'package:flutter/material.dart';
// Adjust import paths as per your project structure
import 'example/appz_input_field_example_page.dart';
import 'lib/components/appz_input_field/appz_style_config.dart';

Future<void> main() async {
  // Ensure that widget binding is initialized before calling native code.
  WidgetsFlutterBinding.ensureInitialized();

  // Load the UI configuration
  // It's important to await this before runApp so styles are ready.
  await AppzStyleConfig.instance.load('assets/ui_config.json');
  await AppzStyleConfig.instance.load('assets/input_ui_config.json');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppzInputField Demo V2',
      theme: ThemeData(
        // You might want to define some base app theme properties here.
        // For now, AppzInputField is self-contained with its styling via JSON.
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AppzInputFieldExamplePage(),
      debugShowCheckedModeBanner: false, // Optional: to hide the debug banner
    );
  }
}
