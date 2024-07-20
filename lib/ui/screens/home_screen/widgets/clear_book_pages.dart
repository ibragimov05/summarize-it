import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/logic/blocs/all_blocs.dart';

class ClearBookPages extends StatelessWidget {
  const ClearBookPages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PdfToImageBloc, PdfToImageStates>(
      builder: (context, state) {
        return IconButton(
          onPressed: () =>
              context.read<PdfToImageBloc>().add(ClearBookPagesEvent()),
          icon: const Icon(Icons.highlight_remove_outlined),
        );
      },
    );
  }
}
