import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:summarize_it/core/utils/utils.dart';

class PlayPauseAudioWidget extends StatefulWidget {
  final String summaryAudioUrl;

  const PlayPauseAudioWidget({
    super.key,
    required this.summaryAudioUrl,
  });

  @override
  State<PlayPauseAudioWidget> createState() => _PlayPauseAudioWidgetState();
}

class _PlayPauseAudioWidgetState extends State<PlayPauseAudioWidget>
    with SingleTickerProviderStateMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();

  late AnimationController _controller;

  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer.setUrl(widget.summaryAudioUrl);
    _audioPlayer.playbackEventStream.listen(
          (event) {
        if (event.processingState == ProcessingState.completed) {
          _isPlaying = false;
          _controller.reverse(); // Stop animation when audio finishes
          setState(() {});
        }
      },
    );

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'audio',
      shape: const CircleBorder(),
      backgroundColor: AppColors.green900,
      onPressed: () {
        if (_isPlaying) {
          _audioPlayer.pause();
          _controller.reverse();
        } else {
          _controller.forward();
          _audioPlayer.play();
        }
        _isPlaying = !_isPlaying;
        setState(() {});
      },
      child: AnimatedIcon(
        icon: AnimatedIcons.play_pause,
        progress: _controller,
        color: AppColors.summarizeItWhite,
      ),
    );
  }
}
