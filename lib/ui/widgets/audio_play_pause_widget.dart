import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/core/utils/app_colors.dart';

import '../../logic/cubits/audio_cubit/audio_cubit.dart';

class AudioPlayPauseWidget extends StatelessWidget {
  final String summary;

  const AudioPlayPauseWidget({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AudioCubit(),
      child: BlocBuilder<AudioCubit, bool>(
        builder: (context, isPlaying) {
          return GestureDetector(
            onTap: () {
              if (!isPlaying) {
                context.read<AudioCubit>().play(summary);
              } else {
                context.read<AudioCubit>().pause();
              }
            },
            child: Container(
              height: 55,
              width: 55,
              decoration: const BoxDecoration(
                color: AppColors.green900,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}