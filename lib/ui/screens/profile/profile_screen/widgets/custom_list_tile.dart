import 'package:flutter/material.dart';

import 'icon_with_bloc_builder.dart';
import '../../../../../core/utils/utils.dart';

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
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
