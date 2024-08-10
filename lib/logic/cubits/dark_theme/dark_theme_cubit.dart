import 'package:bloc/bloc.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/core/utils/hive_box_constants.dart';

class DarkThemeCubit extends Cubit<bool> {
  DarkThemeCubit() : super(AppConstants.themeValue);

  void toggleTheme() async {
    HiveConstants.box.put(HiveConstants.isDark, !state);
    emit(!state);
  }
}
