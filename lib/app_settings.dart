import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/core/utils/hive_box_constants.dart';
import 'package:summarize_it/data/models/user_model.dart';
import 'package:summarize_it/firebase_options.dart';

import 'logic/blocs/all_blocs.dart';
import 'logic/cubits/all_cubit.dart';
import 'data/services/all_services.dart';
import 'data/repositories/all_repositories.dart';

final GetIt getIt = GetIt.instance;

class Settings {
  static Future<void> appSetUp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await dotenv.load(fileName: '.env');
    await Hive.initFlutter();

    Hive.registerAdapter(UserModelAdapter());
    HiveConstants.box = await Hive.openBox(HiveConstants.boxName);

    AppConstants.themeValue =
        HiveConstants.box.get(HiveConstants.isDark) ?? false;
    AppConstants.animationValue =
        HiveConstants.box.get(HiveConstants.showAnimations) ?? true;

    Bloc.observer = AppBlocObserver();
  }

  static void dependencySetUp() {
    /// getting instances of services
    final FirebaseAuthService firebaseAuthService = FirebaseAuthService();
    final UserDioService userHttpService = UserDioService();
    final FirebaseBookService firebaseBookService = FirebaseBookService();
    final AudioService audioService = AudioService();

    /// registering repositories using get it
    getIt.registerLazySingleton(
        () => AuthRepository(firebaseAuthService: firebaseAuthService));
    getIt.registerLazySingleton(
        () => UserRepository(userHttpService: userHttpService));
    getIt.registerLazySingleton(
        () => BooksRepository(firebaseBookService: firebaseBookService));
    getIt.registerLazySingleton(
        () => AudioRepository(audioService: audioService));

    /// registering blocs && cubits
    getIt.registerLazySingleton(
      () => AuthBloc(
        authRepository: getIt.get<AuthRepository>(),
        userRepository: getIt.get<UserRepository>(),
      ),
    );
    getIt.registerLazySingleton(
      () => UserInfoBloc(userRepository: getIt.get<UserRepository>()),
    );
    getIt.registerLazySingleton(() => BooksBloc(
          bookRepository: getIt.get<BooksRepository>(),
        ));
    getIt.registerLazySingleton(
      () => AudioPlayerBloc(audioRepository: getIt.get<AudioRepository>()),
    );

    getIt.registerLazySingleton(() => DarkThemeCubit());
    getIt.registerLazySingleton(() => AnimationCubit());
    getIt.registerLazySingleton(() => TabBoxCubit());
    getIt.registerLazySingleton(() => FilePickerBloc());
    getIt.registerLazySingleton(() => PdfToImageBloc());
    getIt.registerLazySingleton(() => GenerativeAiBloc());
    getIt.registerLazySingleton(() => PdfPageCubit());
  }
}
