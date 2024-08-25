import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';
import 'package:easy_localization/easy_localization.dart';

import 'utils/utils.dart';
import '../logic/cubits/dark_theme/dark_theme_cubit.dart';

class SummarizeIt extends StatelessWidget {
  const SummarizeIt({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkThemeCubit, bool>(
      builder: (context, state) {
        return ToastificationWrapper(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: ThemeData(
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: AppColors.green900,
                selectionColor: AppColors.green900.withOpacity(0.1),
                selectionHandleColor: AppColors.green900,
              ),
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
            darkTheme: ThemeData.dark().copyWith(
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: AppColors.green900,
                selectionColor: AppColors.green900.withOpacity(0.1),
                selectionHandleColor: AppColors.green900,
              ),
            ),
            themeMode: state ? ThemeMode.dark : ThemeMode.light,
            onGenerateRoute: AppRouter.generateRoute,
          ),
        );
      },
    );
  }
}
