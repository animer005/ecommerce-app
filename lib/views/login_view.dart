import 'package:flutter/material.dart';
import 'package:ecommerce_app/view_models/login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _viewModel = LoginViewModel();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _viewModel.emailController,
              decoration: const InputDecoration(
                icon: Icon(Icons.email),
                hintText: "Enter your email",
                label: Text("Email"),
              ),
            ),
            TextField(
              controller: _viewModel.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                icon: Icon(Icons.lock),
                hintText: "Enter your password",
                label: Text("Password"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    final success = _viewModel.login();
                    if (success) {
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: TextButton(
                  child: const Text("Don't have an account? Sign up"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}