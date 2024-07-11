import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:summarize_it/ui/screens/login_screen/widgets/login_screen_text.dart';
import 'package:summarize_it/ui/widgets/custom_main_green_button.dart';
import 'package:summarize_it/ui/widgets/custom_text_field.dart';
import 'package:summarize_it/utils/app_colors.dart';
import 'package:summarize_it/utils/app_constants.dart';
import 'package:summarize_it/utils/app_text_styles.dart';
import 'package:summarize_it/utils/responsive.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// background
          Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.green900.withOpacity(0.9),
          ),

          /// hi welcome back
          SizedBox(
            width: Responsive.screenW(context),
            height: Responsive.screenH(context) / 4,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppConstants.welcomeBack,
                    style: AppTextStyles.workSansMain.copyWith(
                      fontSize: 25,
                      color: AppColors.summarizeItWhite,
                    ),
                  ),
                  Text(
                    'Lorem ipsum doler sit amet',
                    style: AppTextStyles.workSansMain.copyWith(
                      color: AppColors.summarizeItWhite,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: Responsive.screenH(context) / 1.5,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: AppColors.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      AppConstants.signIn,
                      style: AppTextStyles.workSansMain.copyWith(fontSize: 25),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// email address
                      const LoginScreenText(text: 'Email Address'),
                      const Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 30),
                        child: const CustomTextField(
                          hintText: 'Enter your email address',
                          isObscure: false,
                        ),
                      ),

                      /// password
                      const LoginScreenText(text: 'Password'),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 30),
                        child: const CustomTextField(
                          hintText: 'Enter your password',
                          isObscure: true,
                        ),
                      ),

                      /// remember me? forgot password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.circle_outlined),
                              Gap(5),
                              LoginScreenText(text: AppConstants.rememberMe),
                            ],
                          ),
                          Text(
                            AppConstants.forgotPassword,
                            style: AppTextStyles.workSansMain.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColors.error900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CustomMainGreenButton(
                    buttonText: AppConstants.signIn,
                    onTap: () {},
                  ),
                  const Gap(30),

                  /// don't have an account? Sign up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppConstants.donNotHaveAnAccount,
                        style: AppTextStyles.workSansMain.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.greyscale400,
                        ),
                      ),
                      const Gap(5),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          AppConstants.signUp,
                          style: AppTextStyles.workSansMain.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.green900,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
