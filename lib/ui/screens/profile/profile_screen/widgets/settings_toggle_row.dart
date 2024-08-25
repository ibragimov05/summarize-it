import 'package:flutter/material.dart';

import 'icon_with_bloc_builder.dart';
import '../../../../../core/utils/utils.dart';

class SettingsToggleRow extends StatelessWidget {
  final String icoPath;
  final String text;
  final bool value;
  final Function() onChanged;

  const SettingsToggleRow({
    super.key,
    required this.icoPath,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onChanged,
        child: Container(
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
              Switch.adaptive(
                hoverColor: AppColors.greyscale100,
                inactiveTrackColor: AppColors.greyscale100,
                activeColor: AppColors.greyscale600,
                activeTrackColor: AppColors.greyscale300,
                value: value,
                onChanged: (value) => onChanged(),
              ),
            ],
          ),
        ),
      );
}
