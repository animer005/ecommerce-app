import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/user_model.dart' ;

class LoginViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  User? loggedInUser;

  bool login() {
    loggedInUser = User(
      username: 'guest',
      email: emailController.text,
      password: passwordController.text,
    );
    notifyListeners();

    return true;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
