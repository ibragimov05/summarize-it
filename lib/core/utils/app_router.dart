import 'package:flutter/cupertino.dart';
import 'package:summarize_it/data/models/book.dart';
import 'package:summarize_it/ui/screens/bookmarks/bookmarked_summary_screen/bookmarked_summary_screen.dart';
import 'package:summarize_it/ui/screens/no_connection/no_connection_screen.dart';
import 'package:summarize_it/ui/screens/onboarding/splash_screen/splash_screen.dart';
import 'package:summarize_it/ui/screens/profile/edit_profile_screen/edit_profile_screen.dart';
import 'package:summarize_it/ui/screens/auth/forgot_password_screen/forgot_password_screen.dart';
import 'package:summarize_it/ui/screens/auth/login_screen/login_screen.dart';
import 'package:summarize_it/ui/screens/main_screen/main_screen.dart';
import 'package:summarize_it/ui/screens/onboarding/onboarding_screen/onboarding_screen.dart';
import 'package:summarize_it/ui/screens/auth/sign_up_screen/sign_up_screen.dart';
import 'package:summarize_it/ui/screens/home/summary_screen/summary_screen.dart';

class AppRouter {
  static const String main = '/mainScreen';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String forgotPassword = '/forgotPassword';
  static const String summaryScreen = '/summaryScreen';
  static const String bookmarkedSummaryScreen = '/bookmarkedSummaryScreen';
  static const String editProfileScreen = '/editProfileScreen';
  static const String noConnectionScreen = '/noConnectionScreen';

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
      case AppRouter.forgotPassword:
        return _buildPageRoute(const ForgotPasswordScreen());
      case AppRouter.onboarding:
        return _buildPageRoute(const OnboardingScreen());
      case AppRouter.summaryScreen:
        return _buildPageRoute(const SummaryScreen());
      case AppRouter.bookmarkedSummaryScreen:
        final book = settings.arguments as Book;
        return _buildPageRoute(BookmarkedSummaryScreen(book: book));
      case AppRouter.editProfileScreen:
        return _buildPageRoute(const EditProfileScreen());
      case AppRouter.noConnectionScreen:
        return _buildPageRoute(const NoConnectionScreen());
      default:
        return _buildPageRoute(const SplashScreen());
    }
  }
}
