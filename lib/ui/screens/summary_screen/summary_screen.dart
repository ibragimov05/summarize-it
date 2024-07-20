import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:summarize_it/ui/widgets/arrow_back_button.dart';

import '../../../logic/blocs/generative_ai/generative_ai_bloc.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBackButton(),
      ),
      body: BlocBuilder<GenerativeAiBloc, GenerativeAiStates>(
        builder: (context, state) {
          if (state is LoadedGenerativeAiState) {
            return Markdown(data: state.result);
          }
          return const Center(
            child: Text("No results found! Sorry :("),
          );
        },
      ),
    );
  }
}
