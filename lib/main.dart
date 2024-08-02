import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/app_settings.dart';
import 'package:summarize_it/core/app.dart';
import 'package:summarize_it/logic/blocs/user_info/user_info_bloc.dart';

import 'data/repositories/all_repositories.dart';
import 'data/services/all_services.dart';
import 'logic/blocs/all_blocs.dart';
import 'logic/cubits/all_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppSettings.setUp();

  final FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  final UserDioService userHttpService = UserDioService();
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
                  )),
          BlocProvider(
            create: (BuildContext context) =>
                UserInfoBloc(userRepository: context.read<UserRepository>())
                  ..add(
                    GetUserInfoEvent(),
                  ),
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
