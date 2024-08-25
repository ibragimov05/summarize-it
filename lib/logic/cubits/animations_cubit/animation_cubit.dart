import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/data/services/shared_prefs/animation_prefs_service.dart';

import '../../../core/utils/app_settings.dart';

class AnimationCubit extends Cubit<bool> {
  AnimationCubit() : super(AppSettings.animationValue);

  void toggleAnimationSettings() {
    AnimationPrefsService.set(!state);
    emit(!state);
  }
}
