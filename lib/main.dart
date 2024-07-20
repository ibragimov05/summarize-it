import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:summarize_it/core/app.dart';
import 'package:summarize_it/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'logic/blocs/all_blocs.dart';
import 'logic/blocs/observer/all_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: '.env');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => FilePickerBloc()),
        BlocProvider(create: (ctx) => PdfToImageBloc()),
        BlocProvider(create: (ctx) => GenerativeAiBloc()),
      ],
      child: const SummarizeIt(),
    ),
  );
}
