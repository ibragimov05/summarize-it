import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:summarize_it/core/utils/utils.dart'
    show AppColors, AppTextStyles;

class RegularButton extends StatelessWidget {
  final double w;
  final String buttonLabel;
  final void Function()? onTap;

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
          color: onTap == null ? AppColors.greyscale600 : AppColors.green900,
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
