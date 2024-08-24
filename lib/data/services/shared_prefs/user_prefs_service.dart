import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:summarize_it/app_settings.dart';
import 'package:summarize_it/data/models/models.dart';

class UserPrefsService {
  static const String _userPrefsKey = '__user_data__';

  static Future<bool> updateUser(UserModel user) async => await getIt
      .get<SharedPreferences>()
      .setString(_userPrefsKey, jsonEncode(user.toMap()));

  static UserModel? getUser() {
    final data = getIt.get<SharedPreferences>().getString(_userPrefsKey);

    if (data == null) return null;

    return UserModel.fromJson(jsonDecode(data));
  }

  static Future<bool> clearUser() async =>
      await getIt.get<SharedPreferences>().remove(_userPrefsKey);
}
