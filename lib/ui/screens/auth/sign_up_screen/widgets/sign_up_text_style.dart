import 'package:flutter/material.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';

class SignUpTextStyle extends StatelessWidget {
  final String text;
  const SignUpTextStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 7),
      child: Text(
        text,
        style: AppTextStyles.workSansMain.copyWith(
          color: AppColors.greyscale400,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
