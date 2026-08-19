import 'package:flutter/material.dart';
import 'app_themes.dart';
import 'views/login_view.dart';
import 'views/signup_view.dart';
import 'views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginView(),
        '/signup': (context) => const SignupView(),
        '/home': (context) => const HomeView(),
      },
    );
  }
}