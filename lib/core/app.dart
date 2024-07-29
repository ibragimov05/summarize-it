import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/logic/blocs/all_blocs.dart';
import 'package:summarize_it/logic/cubits/dark_theme/dark_theme_cubit.dart';
import 'package:summarize_it/ui/screens/auth/login_screen/login_screen.dart';
import 'package:summarize_it/ui/screens/main_screen/main_screen.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_router.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';

class SummarizeIt extends StatelessWidget {
  const SummarizeIt({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkThemeCubit, bool>(
      builder: (context, state) {
        return MaterialApp(
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
          darkTheme: ThemeData.dark(),
          themeMode: state ? ThemeMode.dark : ThemeMode.light,
          onGenerateRoute: AppRouter.generateRoute,
          home: BlocSelector<AuthBloc, AuthState, User?>(
            bloc: context.read<AuthBloc>()..add(WatchAuthEvent()),
            selector: (state) => state.user,
            builder: (context, user) {
              return user == null ? const LoginScreen() : const MainScreen();
            },
          ),
        );
      },
    );
  }
}
