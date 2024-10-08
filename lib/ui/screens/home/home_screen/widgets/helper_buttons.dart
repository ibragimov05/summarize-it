import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../logic/blocs/generative_ai/generative_ai_bloc.dart';

class HelperButtons extends StatelessWidget {
  final RoundedLoadingButtonController openDocButtonController;
  final RoundedLoadingButtonController submitButtonController;
  final void Function() onOpenDocTap;
  final void Function()? onSubmitTap;

  const HelperButtons({
    super.key,
    required this.openDocButtonController,
    required this.submitButtonController,
    required this.onOpenDocTap,
    required this.onSubmitTap,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlocBuilder<GenerativeAiBloc, GenerativeAiStates>(
            builder: (context, state) {
              return RoundedLoadingButton(
                width: MediaQuery.of(context).size.width / 2.5,
                color: AppColors.green900,
                animateOnTap: false,
                controller: openDocButtonController,
                onPressed:
                    state is LoadingGenerativeAiState ? null : onOpenDocTap,
                successColor: AppColors.green900.withOpacity(0.5),
                child: Text(
                  tr('openDocuments'),
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
          ),
          RoundedLoadingButton(
            color: AppColors.green900,
            width: MediaQuery.of(context).size.width / 2.5,
            animateOnTap: false,
            controller: submitButtonController,
            onPressed: onSubmitTap,
            successColor: AppColors.green900,
            child: const Text(
              'SummarizeIT',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      );
}
