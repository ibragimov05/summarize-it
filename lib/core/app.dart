
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:summarize_it/ui/screens/login_screen/login_screen.dart';
import 'package:summarize_it/ui/screens/main_screen/main_screen.dart';
import 'package:summarize_it/utils/app_colors.dart';
import 'package:summarize_it/utils/app_router.dart';
import 'package:summarize_it/utils/app_text_styles.dart';

class SummarizeIt extends StatelessWidget {
  const SummarizeIt({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      debugShowFloatingThemeButton: true,
      light: ThemeData.light(useMaterial3: true),
      dark: ThemeData.dark(useMaterial3: true),
      initial: AdaptiveThemeMode.light,
      builder: (ThemeData light, ThemeData dark) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.summarizeItWhite,
            centerTitle: true,
            titleTextStyle: AppTextStyles.workSansMain.copyWith(
              fontSize: 20,
              color: AppColors.greyscale900,
            ),
          ),
        ),
        darkTheme: dark,
        onGenerateRoute: AppRouter.generateRoute,
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const MainScreen();
            } else {
              return const LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
