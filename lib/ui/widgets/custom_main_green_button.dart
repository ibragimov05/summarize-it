import 'package:flutter/material.dart';
import 'package:summarize_it/utils/app_colors.dart';
import 'package:summarize_it/utils/app_text_styles.dart';

class CustomMainGreenButton extends StatelessWidget {
  final String buttonText;
  final void Function() onTap;

  const CustomMainGreenButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.green900.withOpacity(0.9),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: AppTextStyles.workSansMain.copyWith(
              fontSize: 18,
              color: AppColors.summarizeItWhite,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
