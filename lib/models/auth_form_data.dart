import 'dart:io';

import 'package:flutter/material.dart';

enum AuthMode{Signup, Login}

class AuthFormData {

  String name = "";
  String email = "";
  String password = "";
  File? image;
  AuthMode _mode = AuthMode.Login;

  bool get isLogin {
    return _mode == AuthMode.Login;
  }

  bool get isSignUp {
    return _mode == AuthMode.Signup;
  }

  void toggleAuthMode() {
    _mode = isLogin ? AuthMode.Signup : AuthMode.Login;
  }
}