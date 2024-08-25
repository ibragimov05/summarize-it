import 'package:shared_preferences/shared_preferences.dart';
import 'package:summarize_it/app_settings.dart';

class PinCodePrefsService {
  static const String _passwordKey = '__pin_code__';

  static Future<bool> update(int newPassword) async =>
      await getIt.get<SharedPreferences>().setInt(_passwordKey, newPassword);

  static int? get get {
    final data = getIt.get<SharedPreferences>().getInt(_passwordKey);

    if (data == null) return null;

    return data;
  }

  static Future<bool> clear() async =>
      await getIt.get<SharedPreferences>().remove(_passwordKey);
}
