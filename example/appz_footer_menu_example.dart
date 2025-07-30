import 'package:flutter/material.dart';
import 'package:apz_flutter_components/components/appz_footer_menu/appz_footer_menu.dart';
import 'package:apz_flutter_components/components/appz_footer_menu/model/footer_menu_item.dart';

class AppzFooterMenuExample extends StatefulWidget {
  const AppzFooterMenuExample({Key? key}) : super(key: key);

  @override
  State<AppzFooterMenuExample> createState() => _AppzFooterMenuExampleState();
}

class _AppzFooterMenuExampleState extends State<AppzFooterMenuExample> {
  int _selectedIndex = 0;

  final List<FooterMenuItem> _menuItems = [
    const FooterMenuItem(
      iconPath: 'assets/icons/Home.svg',
      label: 'Home',
    ),
    const FooterMenuItem(
      iconPath: 'assets/icons/calendar.svg',
      label: 'Calendar',
    ),
    const FooterMenuItem(
      iconPath: 'assets/icons/announcement-01.svg',
      label: 'Announcements',
    ),
    const FooterMenuItem(
      iconPath: 'assets/icons/dots-more.svg',
      label: 'More',
    ),
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected: ${_menuItems[index].label}'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _onFabTap() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('FAB tapped! (e.g. open search)'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appz Footer Menu Showcase'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Appz Footer Menu Component',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'This component provides a customizable footer navigation menu with a floating action button (FAB) in the center. All styling is token-driven.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Features:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _buildFeatureItem('✓ Configurable menu items'),
                          _buildFeatureItem(
                              '✓ Center Floating Action Button (FAB)'),
                          _buildFeatureItem(
                              '✓ Token-based styling (no hardcoding)'),
                          _buildFeatureItem('✓ Icon support via AppzImage'),
                          _buildFeatureItem('✓ Selection state management'),
                          _buildFeatureItem('✓ Responsive layout'),
                          _buildFeatureItem('✓ Customizable callbacks'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Usage Example:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              '''AppzFooterMenu(
                                  menuItems: menuItems,
                                  selectedIndex: selectedIndex,
                                  onItemSelected: (index) {
                                    // Handle item selection
                                  },
                                  onFabTap: () {
                                    // Handle FAB tap
                                  },
                                  fabIconPath: 'assets/icons/search.svg', // Optional, overrides token
                                )''',
                              style: TextStyle(
                                fontFamily: 'monospace',
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppzFooterMenu(
        menuItems: _menuItems,
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemSelected,
        onFabTap: _onFabTap,
        fabIconPath:
            'assets/icons/search.svg', // You can override the FAB icon here
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
