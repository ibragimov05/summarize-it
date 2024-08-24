import 'package:bloc/bloc.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/data/services/shared_prefs/theme_mode_prefs_service.dart';

class DarkThemeCubit extends Cubit<bool> {
  DarkThemeCubit() : super(AppConstants.themeValue);

  void toggleTheme() async {
    ThemeModePrefsService.set(!state);
    emit(!state);
  }
}
