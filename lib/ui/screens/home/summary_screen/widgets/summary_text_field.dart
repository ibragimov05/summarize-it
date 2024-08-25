import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';

class SummaryTextFormField extends StatelessWidget {
  final TextEditingController _textEditingController;
  final String? Function(String?) _validator;

  const SummaryTextFormField({
    super.key,
    required TextEditingController textEditingController,
    required String? Function(String?) validator,
  })  : _textEditingController = textEditingController,
        _validator = validator;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: _textEditingController,
        maxLines: 4,
        validator: _validator,
        decoration: InputDecoration(
          errorStyle: AppTextStyles.workSansMain.copyWith(
            color: AppColors.error900,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.green900, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.green900, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.green900, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.green900, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.error900, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.error900, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      );
}
