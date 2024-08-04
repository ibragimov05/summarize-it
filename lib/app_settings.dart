import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/core/utils/hive_box_constants.dart';
import 'package:summarize_it/data/models/user_model.dart';
import 'package:summarize_it/firebase_options.dart';
import 'package:summarize_it/logic/blocs/observer/all_observer.dart';

class AppSettings {
  static Future<void> setUp() async {
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
}
