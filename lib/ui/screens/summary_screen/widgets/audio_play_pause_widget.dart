// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:just_audio/just_audio.dart';

// import '../../../../logic/blocs/audio/audio_bloc.dart';

// class AudioPlayPauseWidget extends StatefulWidget {
//   const AudioPlayPauseWidget({super.key});

//   @override
//   State<AudioPlayPauseWidget> createState() => _AudioPlayPauseWidgetState();
// }

// class _AudioPlayPauseWidgetState extends State<AudioPlayPauseWidget> {
//   bool isPlaying = false;
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AudioBloc, AudioStates>(
//       builder: (context, state) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//                 onPressed: () =>
//                     context.read<AudioBloc>().add(SkipBackwardAudioEvent()),
//                 icon: const Icon(Icons.replay_5)),
//             IconButton(
//               onPressed: () {
//                 if (!isPlaying && (state is AudioDownloadedState)) {
//                   print(state.filePath);
//                   context.read<AudioBloc>().add(PlayAudioEvent(
//                         filePath: state.filePath,
//                       ));
//                 } else if (isPlaying) {
//                   context.read<AudioBloc>().add(PauseAudioEvent());
//                 }
//                 isPlaying = !isPlaying;
//                 setState(() {});
//               },
//               icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
//             ),
//             IconButton(
//                 onPressed: () =>
//                     context.read<AudioBloc>().add(SkipForwardAudioEvent()),
//                 icon: const Icon(Icons.forward_5)),
//           ],
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../logic/blocs/audio/audio_bloc.dart';

class AudioPlayPauseWidget extends StatefulWidget {
  const AudioPlayPauseWidget({super.key});

  @override
  State<AudioPlayPauseWidget> createState() => _AudioPlayPauseWidgetState();
}

class _AudioPlayPauseWidgetState extends State<AudioPlayPauseWidget> {
  bool isPlaying = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _audioPlayer.setFilePath(
      '/data/user/0/com.example.summarize_it/app_flutter/The-Little-Prince',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioBloc, AudioStates>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                _audioPlayer.seek(_audioPlayer.position - Duration(seconds: 5));
              },
              icon: const Icon(Icons.replay_5),
            ),
            IconButton(
              onPressed: () async {
                print(1);
                if (isPlaying) {
                  await _audioPlayer.pause();
                  isPlaying = false;
                  print(2);
                } else if (!isPlaying) {
                  await _audioPlayer.play();
                  isPlaying = true;
                  print(3);
                }
                setState(() {});
              },
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            ),
            IconButton(
              onPressed: () {
                _audioPlayer.seek(_audioPlayer.position + Duration(seconds: 5));
              },
              icon: const Icon(Icons.forward_5),
            ),
          ],
        );
      },
    );
  }
}
