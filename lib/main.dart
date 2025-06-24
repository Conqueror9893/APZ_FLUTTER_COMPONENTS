import 'package:flutter/material.dart';
import 'widgets/widgets_index.dart';

void main() => runApp(const WidgetGalleryApp());

class WidgetGalleryApp extends StatelessWidget {
  const WidgetGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Gallery',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WidgetListScreen(),
    );
  }
}

class WidgetListScreen extends StatelessWidget {
  const WidgetListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Gallery')),
      body: ListView.builder(
        itemCount: widgetDemos.length,
        itemBuilder: (context, index) {
          final demo = widgetDemos[index];
          return ListTile(
            title: Text(demo.name),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DemoScreen(demo: demo),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DemoScreen extends StatelessWidget {
  final WidgetDemo demo;
  const DemoScreen({super.key, required this.demo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(demo.name)),
      body: Center(child: demo.builder(context)),
    );
  }
} 