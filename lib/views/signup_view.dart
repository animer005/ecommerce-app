import 'package:flutter/material.dart';
import 'package:ecommerce_app/view_models/signup_viewmodel.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _viewModel = SignupViewModel();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _viewModel.usernameController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: "Enter your username",
                label: Text("Username"),
              ),
            ),
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
                  child: const Text('Sign Up'),
                  onPressed: () {
                    final success = _viewModel.signup();
                    if (success) {
                      Navigator.pushReplacementNamed(context, '/login');
                    }
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