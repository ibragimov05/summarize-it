import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/core/utils/app_assets.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/core/utils/app_functions.dart';
import 'package:summarize_it/core/utils/app_router.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';
import 'package:summarize_it/core/utils/extensions.dart';
import 'package:summarize_it/logic/blocs/auth/auth_bloc.dart';
import 'package:summarize_it/logic/cubits/dark_theme/dark_theme_cubit.dart';
import 'package:summarize_it/ui/screens/profile/profile_screen/widgets/custom_list_tile.dart';
import 'package:summarize_it/ui/screens/profile/profile_screen/widgets/title_text.dart';

import '../../../../core/utils/app_colors.dart';
import 'widgets/icon_with_bloc_builder.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  const TitleText(text: AppConstants.profileInfo),
                  CustomListTile(
                    icoPath: AppAssets.icoUser,
                    text: AppConstants.profile,
                    shouldAddArrow: true,
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.editProfileScreen);
                    },
                  ),
                  const TitleText(text: AppConstants.security),
                  CustomListTile(
                    icoPath: AppAssets.icoKey,
                    text: AppConstants.changePassword,
                    shouldAddArrow: true,
                    onTap: () {},
                  ),
                  CustomListTile(
                    icoPath: AppAssets.icoLock,
                    text: AppConstants.forgotPassword,
                    onTap: () {
                      context.read<AuthBloc>().add(ResetPasswordEvent());
                      AppFunctions.showSnackBar(
                        context,
                        'Link to reset your password has been sent to your email!',
                      );
                    },
                  ),
                  const TitleText(text: AppConstants.general),
                  CustomListTile(
                    icoPath: AppAssets.icoLanguageCircle,
                    text: AppConstants.language,
                    shouldAddArrow: true,
                    onTap: () {},
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const IconWithBlocBuilder(
                              icoPath: AppAssets.icoMoon,
                            ),
                            10.w(),
                            Text(
                              AppConstants.darkMode,
                              style: AppTextStyles.workSansMain.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        BlocBuilder<DarkThemeCubit, bool>(
                          builder: (BuildContext context, bool state) {
                            return Switch.adaptive(
                              hoverColor: AppColors.greyscale100,
                              inactiveTrackColor: AppColors.greyscale100,
                              activeColor: AppColors.greyscale600,
                              activeTrackColor: AppColors.greyscale100,
                              value: state,
                              onChanged: (value) =>
                                  context.read<DarkThemeCubit>().toggleTheme(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const TitleText(text: AppConstants.about),
                  CustomListTile(
                    icoPath: AppAssets.icoInfo,
                    text: AppConstants.helpAndSupport,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => context.read<AuthBloc>().add(LogoutEvent()),
              child: Container(
                width: double.infinity,
                height: 55,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: AppColors.green900,
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Log out',
                    style: AppTextStyles.workSansW500.copyWith(
                      fontSize: 18,
                      color: AppColors.green900,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
