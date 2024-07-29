import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:summarize_it/core/app.dart';
import 'package:summarize_it/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:summarize_it/core/utils/app_constants.dart';

import 'data/repositories/all_repositories.dart';
import 'data/services/all_services.dart';
import 'logic/blocs/all_blocs.dart';
import 'logic/cubits/all_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  AppConstants.themeValue = prefs.getBool('is-dark') ?? false;

  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: '.env');

  final FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  final UserHttpService userHttpService = UserHttpService();
  final FirebaseBookService firebaseBookService = FirebaseBookService();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(
            firebaseAuthService: firebaseAuthService,
          ),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(
            userHttpService: userHttpService,
          ),
        ),
        RepositoryProvider(
          create: (BuildContext context) => BooksRepository(
            firebaseBookService: firebaseBookService,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
              userRepository: context.read<UserRepository>(),
            )..add(InitialAuthEvent()),
          ),
          BlocProvider(create: (BuildContext context) => DarkThemeCubit()),
          BlocProvider(create: (BuildContext context) => TabBoxCubit()),
          BlocProvider(create: (BuildContext context) => FilePickerBloc()),
          BlocProvider(create: (BuildContext context) => PdfToImageBloc()),
          BlocProvider(create: (BuildContext context) => GenerativeAiBloc()),
          BlocProvider(
            create: (BuildContext context) =>
                BooksBloc(bookRepository: context.read<BooksRepository>()),
          ),
        ],
        child: const SummarizeIt(),
      ),
    ),
  );
}
