import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:summarize_it/logic/blocs/auth/auth_bloc.dart';
import 'package:summarize_it/ui/screens/profile/profile_screen/widgets/title_text.dart';
import 'package:summarize_it/ui/screens/profile/profile_screen/widgets/custom_list_tile.dart';
import 'package:summarize_it/ui/screens/profile/profile_screen/widgets/edit_language_modal.dart';

import '../../../../logic/cubits/animations_cubit/animation_cubit.dart';
import '../../../../logic/cubits/dark_theme/dark_theme_cubit.dart';
import 'widgets/settings_toggle_row.dart';

import 'package:summarize_it/core/utils/utils.dart'
    show AppAssets, AppRouter, AppTextStyles, AppColors, AppFunctions;

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
                  TitleText(text: context.tr("profileInfo")),
                  CustomListTile(
                    icoPath: AppAssets.icoUser,
                    text: context.tr("profile"),
                    shouldAddArrow: true,
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.editProfileScreen);
                    },
                  ),
                  TitleText(text: context.tr("security")),
                  CustomListTile(
                    icoPath: AppAssets.icoKey,
                    text: context.tr("changePassword"),
                    shouldAddArrow: true,
                    onTap: () {},
                  ),
                  CustomListTile(
                    icoPath: AppAssets.icoLock,
                    text: context.tr("forgotPassword"),
                    onTap: () {
                      context.read<AuthBloc>().add(ResetPasswordEvent(
                          email: FirebaseAuth.instance.currentUser?.email ??
                              'null'));
                      AppFunctions.showSnackBar(
                        context,
                        'Link to reset your password has been sent to your email!',
                      );
                    },
                  ),
                  TitleText(text: context.tr("general")),
                  CustomListTile(
                    icoPath: AppAssets.icoLanguageCircle,
                    text: context.tr("language"),
                    shouldAddArrow: true,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) =>
                            EditLanguageModal(currentLocale: context.locale),
                      );
                    },
                  ),
                  BlocBuilder<DarkThemeCubit, bool>(
                    builder: (context, state) {
                      return SettingsToggleRow(
                        icoPath: AppAssets.icoMoon,
                        text: context.tr("darkMode"),
                        value: state,
                        onChanged: (value) =>
                            context.read<DarkThemeCubit>().toggleTheme(),
                      );
                    },
                  ),
                  BlocBuilder<AnimationCubit, bool>(
                    builder: (context, state) {
                      return SettingsToggleRow(
                        icoPath: AppAssets.tickCircle,
                        text: context.tr("animations"),
                        value: state,
                        onChanged: (value) => context
                            .read<AnimationCubit>()
                            .toggleAnimationSettings(),
                      );
                    },
                  ),
                  TitleText(text: context.tr("about")),
                  CustomListTile(
                    icoPath: AppAssets.icoInfo,
                    text: context.tr("helpAndSupport"),
                    onTap: () async => await launchUrl(
                        Uri.parse('https://t.me/Fazliddin3303')),
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
                  color: AppFunctions.isLight(context)
                      ? AppColors.green900.withOpacity(0.1)
                      : AppColors.greyscale100,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: AppColors.green900,
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: Text(
                    context.tr('logout'),
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
