import 'package:flutter/material.dart';
import 'package:summarize_it/core/utils/app_colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeCap: StrokeCap.round,
        backgroundColor: Colors.transparent,
        color: AppColors.green900,
      ),
    );
  }
}
