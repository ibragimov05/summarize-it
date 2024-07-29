import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:summarize_it/core/utils/extensions.dart';
import 'package:summarize_it/logic/blocs/all_blocs.dart';
import 'package:summarize_it/ui/screens/auth/login_screen/widgets/login_screen_text.dart';
import 'package:summarize_it/ui/widgets/custom_main_green_button.dart';
import 'package:summarize_it/ui/widgets/custom_text_field.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/core/utils/app_functions.dart';
import 'package:summarize_it/core/utils/app_router.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';

import '../../../../core/utils/device_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final RoundedLoadingButtonController _roundedLoadingButtonController =
      RoundedLoadingButtonController();

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
            width: DeviceScreen.w(context),
            height: DeviceScreen.h(context) / 4,
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
              height: DeviceScreen.h(context) / 1.5,
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
                  /// sign in
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
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return Form(
                            key: state.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// email address
                                const LoginScreenText(text: 'Email Address'),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 30),
                                  child: CustomTextFormField(
                                    textEditingController:
                                        state.emailController!,
                                    hintText: 'Enter your email address',
                                    isObscure: false,
                                    isKeyboardDone: false,
                                    textInputType: TextInputType.emailAddress,
                                    validator: AppFunctions.emailValidator,
                                  ),
                                ),

                                /// password
                                const LoginScreenText(text: 'Password'),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 30),
                                  child: CustomTextFormField(
                                    textEditingController:
                                        state.passwordController!,
                                    hintText: 'Enter your password',
                                    isObscure: true,
                                    isKeyboardDone: true,
                                    textInputType: TextInputType.text,
                                    validator: (String? p0) =>
                                        AppFunctions.passwordValidator(
                                            p0, false),
                                  ),
                                ),
                              ],
                            ),
                            // );
                            // },
                          );
                        },
                      ),

                      /// remember me? forgot password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, AppRouter.forgotPassword),
                            child: Text(
                              AppConstants.forgotPassword,
                              style: AppTextStyles.workSansMain.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: AppColors.error900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CustomMainGreenButton(
                    buttonText: AppConstants.signIn,
                    buttonController: _roundedLoadingButtonController,
                    onTap: () {
                      context.read<AuthBloc>().add(LoginUserEvent());
                      _roundedLoadingButtonController.reset();
                    },
                  ),
                  5.h(),

                  /// don't have an account? Sign up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppConstants.doNotHaveAnAccount,
                        style: AppTextStyles.workSansMain.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.greyscale400,
                        ),
                      ),
                      5.w(),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, AppRouter.signUp),
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
