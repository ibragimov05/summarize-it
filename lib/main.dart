import 'package:flutter/material.dart';
import 'package:summarize_it/core/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/app_settings.dart';
import 'package:easy_localization/easy_localization.dart';

import 'logic/blocs/all_blocs.dart';
import 'logic/blocs/group_chat/group_chat_bloc.dart';
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
            value: getIt.get<AuthBloc>()..add(WatchAuthEvent()),
          ),
          BlocProvider.value(value: getIt.get<UserBloc>()),
          BlocProvider.value(value: getIt.get<BooksBloc>()),
          BlocProvider.value(value: getIt.get<DarkThemeCubit>()),
          BlocProvider.value(value: getIt.get<AnimationCubit>()),
          BlocProvider.value(value: getIt.get<TabBoxCubit>()),
          BlocProvider.value(value: getIt.get<GenerativeAiBloc>()),
          BlocProvider.value(value: getIt.get<GroupChatBloc>()),
        ],
        child: const SummarizeIt(),
      ),
    ),
  );
}
