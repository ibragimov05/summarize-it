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
}
