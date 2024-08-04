import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/core/utils/hive_box_constants.dart';

class AnimationCubit extends Cubit<bool> {
  AnimationCubit() : super(AppConstants.animationValue);

  void toggleAnimationSettings() async {
    HiveConstants.box.put(HiveConstants.showAnimations, !state);
    emit(!state);
  }
}
