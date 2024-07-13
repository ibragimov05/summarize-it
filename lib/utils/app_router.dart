import 'package:flutter/cupertino.dart';
import 'package:summarize_it/ui/screens/login_screen/login_screen.dart';
import 'package:summarize_it/ui/screens/main_screen/main_screen.dart';
import 'package:summarize_it/ui/screens/sign_up_screen/sign_up_screen.dart';

class AppRouter {
  static const String main = '/mainScreen';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signUp = '/signUp';

  static PageRoute _buildPageRoute(Widget widget) {
    return CupertinoPageRoute(builder: (BuildContext context) => widget);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.main:
        return _buildPageRoute(const MainScreen());
      case AppRouter.signUp:
        return _buildPageRoute(const SignUpScreen());
      case AppRouter.login:
        return _buildPageRoute(const LoginScreen());
      default:
        return _buildPageRoute(const LoginScreen());
    }
  }
}
