import 'package:shared_preferences/shared_preferences.dart';
import 'package:summarize_it/app_settings.dart';

class ThemeModePrefsService {
  static const String _themeModePrefsKey = '__theme_mode__';

  static Future<bool> set(bool value) async =>
      await getIt.get<SharedPreferences>().setBool(_themeModePrefsKey, value);

  static bool? get get {
    return getIt.get<SharedPreferences>().getBool(_themeModePrefsKey);
  }

  static Future<bool> clear() async =>
      await getIt.get<SharedPreferences>().remove(_themeModePrefsKey);
}
