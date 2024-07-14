import 'package:flutter/material.dart';
import 'package:summarize_it/utils/app_colors.dart';

class EllipseWidget extends StatelessWidget {
  final int indexPage;
  const EllipseWidget({super.key, required this.indexPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) => _buildEllipse(index)),
    );
  }

  Widget _buildEllipse(int pageIndex) => Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            width: indexPage == pageIndex ? 30 : 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: indexPage == pageIndex
                  ? AppColors.greyscale800
                  : AppColors.greyscale100,
            ),
          ),
          const SizedBox(width: 10),
        ],
      );
}
