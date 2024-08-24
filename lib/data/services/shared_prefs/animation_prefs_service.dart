import 'package:shared_preferences/shared_preferences.dart';
import 'package:summarize_it/app_settings.dart';

class AnimationPrefsService {
  static const String _animationPrefsKey = '__show_animation__';

  static Future<bool> set(bool value) async =>
      await getIt.get<SharedPreferences>().setBool(_animationPrefsKey, value);

  static bool? get get =>
      getIt.get<SharedPreferences>().getBool(_animationPrefsKey);

  static Future<bool> clear() async =>
      await getIt.get<SharedPreferences>().remove(_animationPrefsKey);
}
