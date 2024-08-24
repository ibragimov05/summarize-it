import 'package:get_it/get_it.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:summarize_it/core/utils/utils.dart';
import 'package:summarize_it/data/services/shared_prefs/animation_prefs_service.dart';
import 'package:summarize_it/data/services/shared_prefs/theme_mode_prefs_service.dart';
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

    SharedPreferences preferences = await SharedPreferences.getInstance();

    getIt.registerSingleton(preferences);

    AppConstants.themeValue = ThemeModePrefsService.get ?? false;
    AppConstants.animationValue = AnimationPrefsService.get ?? true;

    // Bloc.observer = const AppBlocObserver();
  }

  static void dependencySetUp()  {


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
      () => UserBloc(userRepository: getIt.get<UserRepository>()),
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

// extension on String {
//   bool get toThemeMode {
//     if (this == 'true') return true;
//     return false;
//   }
// }
