import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:summarize_it/core/utils/app_constants.dart';

class DarkThemeCubit extends Cubit<bool> {
  DarkThemeCubit() : super(AppConstants.themeValue);

  void toggleTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('is-dark', !state);
    emit(!state);
  }
}
