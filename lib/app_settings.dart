import 'package:get_it/get_it.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:summarize_it/data/repositories/group_chat_repository.dart';
import 'package:summarize_it/data/services/firebase/group_chat_firebase_service.dart';
import 'package:summarize_it/data/services/shared_prefs/animation_prefs_service.dart';
import 'package:summarize_it/data/services/shared_prefs/theme_mode_prefs_service.dart';
import 'package:summarize_it/firebase_options.dart';
import 'package:summarize_it/logic/blocs/group_chat/group_chat_bloc.dart';

import 'core/utils/app_settings.dart';
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

    SharedPreferences preferences = await SharedPreferences.getInstance();

    getIt.registerSingleton(preferences);

    AppSettings.themeValue = ThemeModePrefsService.get ?? false;
    AppSettings.animationValue = AnimationPrefsService.get ?? true;

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
    getIt.registerLazySingleton(() => GroupChatRepository(
        groupChatFirebaseService: GroupChatFirebaseService()));

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
    getIt.registerLazySingleton(
      () => GroupChatBloc(chatRepository: getIt.get<GroupChatRepository>()),
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
