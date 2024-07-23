import 'package:flutter/material.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';

class LoginScreenText extends StatelessWidget {
  final String text;

  const LoginScreenText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.workSansMain.copyWith(
        fontSize: 15,
        color: AppColors.greyscale400,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
