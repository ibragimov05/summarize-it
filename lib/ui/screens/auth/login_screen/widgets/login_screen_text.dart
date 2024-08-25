import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';

class LoginScreenText extends StatelessWidget {
  final String text;

  const LoginScreenText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.workSansMain.copyWith(
        fontSize: 15,
        color: AppFunctions.isLight(context)
            ? AppColors.greyscale400
            : AppColors.greyscale100,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
