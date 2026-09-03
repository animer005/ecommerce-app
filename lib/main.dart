import 'package:ecommerce_app/utilities/notifications.dart';
import 'package:flutter/material.dart';
import 'utilities/app_themes.dart';
import 'views/login_view.dart';
import 'views/signup_view.dart';
import 'views/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'utilities/firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Notis().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppTheme.isDarkNotifier,
      builder: (context, isDark, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          initialRoute: '/login',
          routes: {
            '/login': (context) => const LoginView(),
            '/signup': (context) => const SignupView(),
            '/home': (context) => const HomeView(),
          },
          builder: (context, child) {
            return AnimatedTheme(
              data: AppTheme.theme,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              child: child!,
            );
          },
        );
      },
    );
  }
}