import 'package:flutter/material.dart';
import 'package:summarize_it/utils/app_colors.dart';
import 'package:summarize_it/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool isObscure;
  final bool isKeyboardDone;
  final TextInputType textInputType;
  final String? Function(String?) validator;
  final TextEditingController textEditingController;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.isObscure,
    required this.validator,
    required this.isKeyboardDone,
    required this.textInputType,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormField<String>(
          validator: validator,
          builder: (FormFieldState<String> field) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFf7f8fd),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextFormField(
                    keyboardType: textInputType,
                    textInputAction: isKeyboardDone
                        ? TextInputAction.done
                        : TextInputAction.next,
                    controller: textEditingController,
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: hintText,
                      hintStyle: AppTextStyles.workSansMain.copyWith(
                        color: AppColors.greyscale400,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: AppTextStyles.workSansMain.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    onChanged: (value) {
                      field.didChange(value);
                    },
                  ),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: field.hasError
                      ? Padding(
                          padding: const EdgeInsets.only(left: 16, top: 4),
                          child: Text(
                            field.errorText ?? '',
                            key: ValueKey<String>(field.errorText ?? ''),
                            style: AppTextStyles.workSansMain.copyWith(
                              fontSize: 12,
                              color: AppColors.error900,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(key: ValueKey<String>('')),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
