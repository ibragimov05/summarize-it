import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';

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

  static String? textValidator(String? text, String fieldName) {
    if (text == null || text.trim().isEmpty) {
      return 'Please, enter your $fieldName';
    }
    return null;
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
        !RegExp(r'^(?=.*[a-zA-Z]).{8,}$').hasMatch(password)) {
      return 'Password should be strong';
    }
    return null;
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyles.workSansMain.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.error500,
          ),
        ),
      ),
    );
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
        message,
        style: AppTextStyles.workSansMain.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.greyscale100,
        ),
      )),
    );
  }

  static String getGreetinsText() {
    final int now = DateTime.now().hour;
    if (now >= 5 && now < 12) {
      return 'Good morning.';
    } else if (now >= 12 && now <= 18) {
      return 'Good afternoon.';
    } else if (now > 18 || now < 4) {
      return 'Good evening.';
    } else {
      return 'Greetings!';
    }
  }
}
