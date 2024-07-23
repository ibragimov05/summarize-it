import 'package:flutter/material.dart';
import 'package:summarize_it/core/utils/app_functions.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Icon(
        AppFunctions.isAndroid() ? Icons.arrow_back : Icons.arrow_back_ios,
      ),
    );
  }
}
