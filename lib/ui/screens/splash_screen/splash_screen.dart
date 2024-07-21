import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:summarize_it/utils/app_colors.dart';
import 'package:summarize_it/utils/app_constants.dart';
import 'package:summarize_it/utils/app_text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppConstants.summarizeIt,
              style: AppTextStyles.workSansMain.copyWith(
                fontSize: 40,
                color: AppColors.summarizeItWhite,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Gap(30),
            const CircularProgressIndicator(
              backgroundColor: AppColors.green900,
              color: AppColors.summarizeItWhite,
              strokeAlign: 2,
              strokeWidth: 5,
            ),
          ],
        ),
      ),
    );
  }
}
