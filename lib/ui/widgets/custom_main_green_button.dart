import 'package:flutter/material.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';

class CustomMainGreenButton extends StatelessWidget {
  final String buttonText;
  final RoundedLoadingButtonController buttonController;
  final void Function() onTap;

  // final RoundedLoadingButtonController _btnController =
  //       RoundedLoadingButtonController();
  const CustomMainGreenButton({
    super.key,
    required this.buttonController,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      controller: buttonController,
      onPressed: onTap,
      width: MediaQuery.of(context).size.width,
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
}
