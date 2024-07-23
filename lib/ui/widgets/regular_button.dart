import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';

class RegularButton extends StatelessWidget {
  final double w;
  final String buttonLabel;
  final void Function() onTap;

  const RegularButton({
    super.key,
    required this.w,
    required this.buttonLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: w,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.green900,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            buttonLabel,
            style: AppTextStyles.workSansMain.copyWith(
              color: AppColors.summarizeItWhite,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
