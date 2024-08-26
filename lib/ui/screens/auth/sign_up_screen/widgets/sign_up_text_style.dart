import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';

class SignUpTextStyle extends StatelessWidget {
  final String text;
  const SignUpTextStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 7),
        child: Text(
          text,
          style: AppTextStyles.workSansMain.copyWith(
            color: AppFunctions.isLight(context)
                ? AppColors.greyscale400
                : AppColors.greyscale100,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
