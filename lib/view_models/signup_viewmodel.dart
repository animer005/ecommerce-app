import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/user_model.dart';

class SignupViewModel extends ChangeNotifier {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  AppUser? newUser;
  String? errorMessage;
  bool isLoading = false;

  Future<bool> signup() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty) {
      errorMessage = 'Please enter a username.';
      isLoading = false;
      notifyListeners();
      return false;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = credential.user!.uid;
      final user = AppUser(uid: uid, username: username, email: email);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set(user.toMap());

      await credential.user?.updateDisplayName(username);

      newUser = user;
      isLoading = false;
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) {
      errorMessage = _mapAuthError(e);
      isLoading = false;
      notifyListeners();
      return false;
    } catch (e) {
      errorMessage = 'Something went wrong. Please try again.';
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  String _mapAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'An account with this email already exists.';
      case 'invalid-email':
        return 'That email address looks invalid.';
      case 'weak-password':
        return 'Password is too weak. Use at least 6 characters.';
      default:
        return e.message ?? 'Sign up failed. Please try again.';
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}