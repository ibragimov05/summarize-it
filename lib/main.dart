import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import 'core/app.dart';
import 'app_settings.dart';
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
      supportedLocales: const [
        Locale('en'),
        Locale('uz'),
      ],
      fallbackLocale: const Locale('en'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: getIt.get<AuthBloc>()..add(const AuthEvent.watch()),
          ),
          BlocProvider.value(value: getIt.get<UserBloc>()),
          BlocProvider.value(value: getIt.get<BooksBloc>()),
          BlocProvider.value(value: getIt.get<DarkThemeCubit>()),
          BlocProvider.value(value: getIt.get<AnimationCubit>()),
          BlocProvider.value(value: getIt.get<TabBoxCubit>()),
          BlocProvider.value(value: getIt.get<GroupChatBloc>()),
        ],
        child: const SummarizeIt(),
      ),
    ),
  );
}
