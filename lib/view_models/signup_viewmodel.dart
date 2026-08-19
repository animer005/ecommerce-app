import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/user_model.dart';

class SignupViewModel extends ChangeNotifier {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  User? newUser;

  bool signup() {
    newUser = User(
      username: usernameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    notifyListeners();
    return true;
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
