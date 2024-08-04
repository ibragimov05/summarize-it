import 'package:flutter/material.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';
import 'package:summarize_it/core/utils/extensions.dart';

class ProfileTextFormField extends StatefulWidget {
  final String labelText;
  final TextEditingController textEditingController;
  final String? Function(String?) validator;
  final bool? isEnabled;

  const ProfileTextFormField({
    super.key,
    required this.labelText,
    required this.textEditingController,
    required this.validator,
    this.isEnabled = true,
  });

  @override
  State<ProfileTextFormField> createState() => _ProfileTextFormFieldState();
}

class _ProfileTextFormFieldState extends State<ProfileTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: AppTextStyles.workSansW500.copyWith(
            color: AppColors.greyscale400,
            fontSize: 15,
          ),
        ),
        8.h(),
        TextFormField(
          enabled: widget.isEnabled,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide:
                  const BorderSide(color: AppColors.green900, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide:
                  const BorderSide(color: AppColors.green900, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide:
                  const BorderSide(color: AppColors.green900, width: 1.5),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide:
                  const BorderSide(color: AppColors.green900, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide:
                  const BorderSide(color: AppColors.error900, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide:
                  const BorderSide(color: AppColors.error900, width: 1.5),
            ),
            hoverColor: Colors.red,
          ),
          controller: widget.textEditingController,
          validator: widget.validator,
          cursorColor: AppColors.green900,
          style: AppTextStyles.workSansW500
              .copyWith(color: AppColors.greyscale900),
        ),
        20.h(),
      ],
    );
  }
}
