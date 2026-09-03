import 'package:flutter/material.dart';
import 'package:ecommerce_app/utilities/app_themes.dart';
import 'package:ecommerce_app/utilities/notifications.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final notis = Notis();

  void _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return ValueListenableBuilder<bool>(
          valueListenable: AppTheme.isDarkNotifier,
          builder: (context, isDark, child) {
            return AlertDialog(
              title: const Text('Settings'),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Dark Mode'),
                  Switch(
                    value: AppTheme.isDark,
                    onChanged: (value) {
                      AppTheme.isDark = value;
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppTheme.isDarkNotifier,
      builder: (context, isDark, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Homescreen'),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () => _showSettingsDialog(context),
              ),
            ],
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                notis.showNotis(
                  title: 'Test Notification',
                  body: 'This is a test, it works!',
                );
              },
              child: const Text('Send Test Notification'),
            ),
          ),
        );
      },
    );
  }
}