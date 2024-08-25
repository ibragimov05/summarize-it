import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(
          strokeCap: StrokeCap.round,
          backgroundColor: Colors.transparent,
          color: AppColors.green900,
        ),
      );
}
