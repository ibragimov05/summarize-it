import 'package:flutter/material.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';
import 'package:summarize_it/core/utils/extensions.dart';
import 'package:summarize_it/ui/screens/profile/profile_screen/widgets/icon_with_bloc_builder.dart';

class CustomListTile extends StatelessWidget {
  final String icoPath;
  final String text;
  final bool shouldAddArrow;
  final void Function() onTap;

  const CustomListTile({
    super.key,
    required this.icoPath,
    required this.text,
    required this.onTap,
    this.shouldAddArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconWithBlocBuilder(icoPath: icoPath),
                10.w(),
                Text(
                  text,
                  style: AppTextStyles.workSansMain.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            if (shouldAddArrow)
              const Icon(Icons.arrow_forward_ios_rounded)
            else
              const SizedBox(),
          ],
        ),
      ),
    );
  }
}
