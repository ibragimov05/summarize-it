import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../logic/blocs/all_blocs.dart';

class ClearBookPages extends StatelessWidget {
  const ClearBookPages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PdfToImageBloc, PdfToImageStates>(
      builder: (context, state) {
        return IconButton(
          tooltip: context.tr('clearScreen'),
          onPressed: () {
            context.read<GenerativeAiBloc>().add(const GenerativeAiEvents.toInitial());
            context.read<PdfToImageBloc>().add(const PdfToImageEvents.toInitialState());
            context.read<FilePickerBloc>().add(const FilePickerEvents.toInitialStateFilePicker());
          },
          icon: const Icon(Icons.highlight_remove_outlined),
        );
      },
    );
  }
}
