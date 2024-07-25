import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../logic/cubits/dark_theme/dark_theme_cubit.dart';

class IconWithBlocBuilder extends StatelessWidget {
  final String icoPath;
  const IconWithBlocBuilder({super.key,required this.icoPath});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkThemeCubit, bool>(
      builder: (context, state) => SvgPicture.asset(
        icoPath,
        colorFilter: ColorFilter.mode(
          state ? AppColors.greyscale100 : AppColors.greyscale900,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
