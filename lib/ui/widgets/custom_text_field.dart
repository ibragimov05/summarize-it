import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:summarize_it/core/utils/app_assets.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final bool isObscure;
  final bool isKeyboardDone;
  final TextInputType textInputType;
  final String? Function(String?) validator;
  final TextEditingController textEditingController;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.validator,
    required this.textEditingController,
    this.isObscure = false,
    this.isKeyboardDone = true,
    this.textInputType = TextInputType.text,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormField<String>(
          validator: widget.validator,
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
                    keyboardType: widget.textInputType,
                    textInputAction: widget.isKeyboardDone
                        ? TextInputAction.done
                        : TextInputAction.next,
                    controller: widget.textEditingController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      suffixIcon: _passwordToggleObscure(),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: widget.hintText,
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

  Widget? _passwordToggleObscure() => widget.isObscure
      ? GestureDetector(
          onTap: () => setState(() => _isObscure = !_isObscure),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(
              _isObscure ? AppAssets.passwordEyeSlash : AppAssets.passwordEye,
            ),
          ),
        )
      : null;
}
