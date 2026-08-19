import 'package:flutter/material.dart';
import 'package:ecommerce_app/utilities/app_themes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(title: const Text('Homescreen')),
      body: const Center(child: Text('Placeholder')),
    );
  }
}
