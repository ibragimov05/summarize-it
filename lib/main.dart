import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:summarize_it/core/app.dart';
import 'package:summarize_it/data/repositories/book_repository.dart';
import 'package:summarize_it/data/services/firebase/firebase_book_service.dart';
import 'package:summarize_it/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:summarize_it/logic/cubits/dark_theme/dark_theme_cubit.dart';
import 'package:summarize_it/core/utils/app_constants.dart';

import 'logic/blocs/all_blocs.dart';
import 'logic/blocs/observer/all_observer.dart';
import 'logic/cubits/tab_box_cubit/tab_box_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  AppConstants.themeValue = prefs.getBool('is-dark') ?? false;

  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: '.env');

  final FirebaseBookService firebaseBookService = FirebaseBookService();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (BuildContext context) =>
              BooksRepository(firebaseBookService: firebaseBookService),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => DarkThemeCubit()),
          BlocProvider(create: (BuildContext context) => TabBoxCubit()),
          BlocProvider(create: (BuildContext context) => FilePickerBloc()),
          BlocProvider(create: (BuildContext context) => PdfToImageBloc()),
          BlocProvider(create: (BuildContext context) => GenerativeAiBloc()),
          BlocProvider(
            create: (BuildContext context) => BooksBloc(
              bookRepository: context.read<BooksRepository>(),
            ),
          ),
        ],
        child: const SummarizeIt(),
      ),
    ),
  );
}
