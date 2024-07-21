import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:summarize_it/core/app.dart';
import 'package:summarize_it/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:summarize_it/logic/cubits/dark_theme/dark_theme_cubit.dart';
import 'package:summarize_it/utils/app_constants.dart';

import 'logic/blocs/all_blocs.dart';
import 'logic/blocs/observer/all_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  AppConstants.themeValue = prefs.getBool('is-dark') ?? false;

  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: '.env');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DarkThemeCubit()),
        BlocProvider(create: (ctx) => FilePickerBloc()),
        BlocProvider(create: (ctx) => PdfToImageBloc()),
        BlocProvider(create: (ctx) => GenerativeAiBloc()),
      ],
      child: const SummarizeIt(),
    ),
  );
}
