import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/logic/blocs/all_blocs.dart';
import 'package:summarize_it/core/utils/app_constants.dart';

class ClearBookPages extends StatelessWidget {
  const ClearBookPages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PdfToImageBloc, PdfToImageStates>(
      builder: (context, state) {
        return IconButton(
          tooltip: AppConstants.clearScreen,
          onPressed: () {
            context.read<GenerativeAiBloc>().add(ToInitialGenerativeAiEvent());
            context.read<PdfToImageBloc>().add(ToInitialStatePdfToImageEvent());
            context.read<FilePickerBloc>().add(ToInitialStateFilePickerEvent());
          },
          icon: const Icon(Icons.highlight_remove_outlined),
        );
      },
    );
  }
}
