import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:summarize_it/ui/screens/summary_screen/widgets/summary_modal_bottom_sheet.dart';
import 'package:summarize_it/ui/widgets/arrow_back_button.dart';
import 'package:summarize_it/ui/widgets/regular_button.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/core/utils/device_screen.dart';

import '../../../logic/blocs/generative_ai/generative_ai_bloc.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.summarizeItTransparent,
        shadowColor: AppColors.summarizeItWhite,
        leading: const ArrowBackButton(),
        title: const Text(AppConstants.summaryOfBook),
        actions: [
          IconButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: const SummaryModalBottomSheet(),
              ),
            ),
            icon: const Icon(Icons.info_outline),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<GenerativeAiBloc, GenerativeAiStates>(
              builder: (context, state) {
                if (state is LoadedGenerativeAiState) {
                  return Markdown(data: state.result);
                }
                return const Center(
                  child: Text(AppConstants.noResultsFound),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  spreadRadius: 1,
                  blurRadius: 25,
                  offset: Offset(0, -10),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RegularButton(
                  w: DeviceScreen.w(context) / 2 - 50,
                  buttonLabel: AppConstants.audio,
                  onTap: () {},
                ),
                RegularButton(
                  w: DeviceScreen.w(context) / 2 - 50,
                  buttonLabel: AppConstants.save,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
