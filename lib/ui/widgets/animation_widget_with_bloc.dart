import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/device_screen.dart';
import '../../logic/cubits/animations_cubit/animation_cubit.dart';

class AnimationWidgetWithBloc extends StatelessWidget {
  final String animationPath;
  const AnimationWidgetWithBloc({super.key, required this.animationPath});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimationCubit, bool>(
      builder: (context, state) {
        if (state) {
          return Lottie.asset(
            animationPath,
            width: DeviceScreen.w(context) / 2.5,
            height: DeviceScreen.w(context) / 2.5,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
