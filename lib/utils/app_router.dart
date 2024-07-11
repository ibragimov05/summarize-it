import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summarize_it/ui/screens/login_screen/login_screen.dart';
import 'package:summarize_it/ui/screens/main_screen/main_screen.dart';
import 'package:summarize_it/utils/app_functions.dart';

class AppRouter {
  static const String main = '/mainScreen';
  static const String onboarding = '/onboarding';
  static const String login = '/login';

  static PageRoute _buildPageRoute(Widget widget, bool isAndroid) {
    return isAndroid
        ? MaterialPageRoute(builder: (BuildContext context) => widget)
        : CupertinoPageRoute(builder: (BuildContext context) => widget);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    bool isAndroid = AppFunctions.isAndroid();
    switch (settings.name) {
      case AppRouter.main:
        return _buildPageRoute(const MainScreen(), isAndroid);
      default:
        return _buildPageRoute(const LoginScreen(), isAndroid);
    }
  }
}
