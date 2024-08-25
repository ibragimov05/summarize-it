import 'package:bloc/bloc.dart';
import 'package:summarize_it/data/services/shared_prefs/theme_mode_prefs_service.dart';

import '../../../core/utils/app_settings.dart';

class DarkThemeCubit extends Cubit<bool> {
  DarkThemeCubit() : super(AppSettings.themeValue);

  void toggleTheme() {
    ThemeModePrefsService.set(!state);
    emit(!state);
  }
}
