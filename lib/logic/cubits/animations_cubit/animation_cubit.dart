import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/data/services/shared_prefs/animation_prefs_service.dart';

class AnimationCubit extends Cubit<bool> {
  AnimationCubit() : super(AppConstants.animationValue);

  void toggleAnimationSettings() async {
    AnimationPrefsService.set(!state);
    emit(!state);
  }
}
