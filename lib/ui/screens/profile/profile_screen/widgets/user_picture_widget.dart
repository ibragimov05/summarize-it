import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class UserPictureWidget extends StatelessWidget {
  const UserPictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const CircleAvatar(
        backgroundColor: AppColors.green900,
      ),
    );
  }
}
