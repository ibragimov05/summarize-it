import 'package:flutter/material.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../core/utils/utils.dart';

class CustomMainGreenButton extends StatelessWidget {
  final double? w;
  final String buttonText;
  final RoundedLoadingButtonController buttonController;
  final void Function() onTap;

  const CustomMainGreenButton({
    super.key,
    required this.buttonController,
    required this.buttonText,
    required this.onTap,
    this.w,
  });

  @override
  Widget build(BuildContext context) => RoundedLoadingButton(
        controller: buttonController,
        onPressed: onTap,
        width: w == null ? MediaQuery.of(context).size.width : w!,
        color: AppColors.green900,
        animateOnTap: true,
        successColor: AppColors.green900,
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
