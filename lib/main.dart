import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/app_settings.dart';
import 'package:summarize_it/core/app.dart';

import 'logic/blocs/all_blocs.dart';
import 'logic/cubits/all_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.ensureInitialized();

  await Settings.appSetUp();
  Settings.dependencySetUp();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('en'), Locale('uz'), Locale('ru')],
      fallbackLocale: const Locale('en'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: getIt.get<AuthBloc>()),
          BlocProvider.value(value: getIt.get<UserInfoBloc>()),
          BlocProvider.value(value: getIt.get<BooksBloc>()),
          BlocProvider.value(value: getIt.get<DarkThemeCubit>()),
          BlocProvider.value(value: getIt.get<AnimationCubit>()),
          BlocProvider.value(value: getIt.get<AudioPlayerBloc>()),
          BlocProvider.value(value: getIt.get<TabBoxCubit>()),
          BlocProvider.value(value: getIt.get<FilePickerBloc>()),
          BlocProvider.value(value: getIt.get<PdfToImageBloc>()),
          BlocProvider.value(value: getIt.get<GenerativeAiBloc>()),
          BlocProvider.value(value: getIt.get<PdfPageCubit>()),
        ],
        child: const SummarizeIt(),
      ),
    ),
  );
}
