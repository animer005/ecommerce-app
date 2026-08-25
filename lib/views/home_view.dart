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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(title: const Text('Homescreen')),
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
  }
}