import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AppFunctions {
  static bool isAndroid() {
    if (kIsWeb) {
      return false;
    } else if (Platform.isAndroid) {
      return true;
    } else {
      return false;
    }
  }

  static bool isLight(BuildContext context) {
    if (AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light) {
      return true;
    } else {
      return false;
    }
  }

  static String? emailValidator(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'Please, enter your email';
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email)) {
      return 'Please, enter a valid email';
    }
    return null;
  }

  static String? passwordValidator(String? password, bool isSignUp) {
    if (password == null || password.trim().isEmpty) {
      return 'Please, enter your password';
    } else if (isSignUp &&
        !RegExp(r'^(?=.*[a-zA-Z])(?=.*[!@#$%^&*]).{8,}$').hasMatch(password)) {
      return 'Password should be strong';
    }
    return null;
  }
}
