import 'package:flutter/material.dart';
import 'package:summarize_it/utils/app_colors.dart';
import 'package:summarize_it/utils/app_constants.dart';
import 'package:summarize_it/utils/app_text_styles.dart';

class GreetingMessage extends StatelessWidget {
  const GreetingMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: AppColors.green900,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              AppConstants.greetingMessage,
              textAlign: TextAlign.center,
              style: AppTextStyles.workSansMain.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppColors.summarizeItWhite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
