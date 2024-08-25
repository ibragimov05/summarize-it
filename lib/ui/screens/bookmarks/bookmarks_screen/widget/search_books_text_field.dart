import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/utils.dart';

class SearchBooksTextField extends StatefulWidget {
  final void Function(String) onChanged;

  const SearchBooksTextField({super.key, required this.onChanged});

  @override
  State<SearchBooksTextField> createState() => _SearchBooksTextFieldState();
}

class _SearchBooksTextFieldState extends State<SearchBooksTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: widget.onChanged,
        style: AppTextStyles.workSansMain,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(AppAssets.icoSearch),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.green900,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.green900,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.green900,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
