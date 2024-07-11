import 'package:flutter/material.dart';
import 'package:summarize_it/utils/app_colors.dart';
import 'package:summarize_it/utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isObscure;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.isObscure,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFf7f8fd),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        obscureText: isObscure,
        decoration: InputDecoration(
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          hintText: hintText,
          hintStyle: AppTextStyles.workSansMain.copyWith(
            color: AppColors.greyscale400,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
