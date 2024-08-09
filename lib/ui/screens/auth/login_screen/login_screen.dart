import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:summarize_it/logic/blocs/all_blocs.dart';
import 'package:summarize_it/ui/screens/auth/login_screen/widgets/login_screen_text.dart';
import 'package:summarize_it/ui/widgets/custom_main_green_button.dart';
import 'package:summarize_it/ui/widgets/custom_text_field.dart';
import 'package:toastification/toastification.dart';

import '../../../../core/utils/all_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final RoundedLoadingButtonController _roundedLoadingButtonController =
      RoundedLoadingButtonController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                    context.tr('welcomeBack'),
                    style: AppTextStyles.workSansMain.copyWith(
                      fontSize: 25,
                      color: AppColors.summarizeItWhite,
                    ),
                    textAlign: TextAlign.center,
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
              decoration: BoxDecoration(
                color: AppFunctions.isLight(context)
                    ? AppColors.scaffoldBackgroundColor
                    : AppColors.summarizeItBlack,
                borderRadius: const BorderRadius.only(
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
                      context.tr('signIn'),
                      style: AppTextStyles.workSansMain.copyWith(fontSize: 25),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// email address
                            const LoginScreenText(text: 'Email Address'),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 30),
                              child: CustomTextFormField(
                                textEditingController: _emailController,
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
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 30),
                              child: CustomTextFormField(
                                textEditingController: _passwordController,
                                hintText: 'Enter your password',
                                isObscure: true,
                                isKeyboardDone: true,
                                textInputType: TextInputType.text,
                                validator: (String? p0) =>
                                    AppFunctions.passwordValidator(p0, false),
                              ),
                            ),
                          ],
                        ),
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
                              context.tr('forgotPassword'),
                              style: AppTextStyles.workSansMain.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: AppFunctions.isLight(context)
                                    ? AppColors.error900
                                    : AppColors.error600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthenticatedState) {
                        context.read<UserInfoBloc>().add(
                              AddUserInfoEvent(
                                email: _emailController.text,
                                uid: FirebaseAuth.instance.currentUser?.uid ??
                                    'null',
                              ),
                            );
                      } else if (state is ErrorAuthState) {
                        _roundedLoadingButtonController.error();
                        Future.delayed(
                          const Duration(seconds: 3),
                          () => _roundedLoadingButtonController.reset(),
                        );
                        toastification.show(
                          context: context,
                          type: ToastificationType.error,
                          autoCloseDuration: const Duration(seconds: 5),
                          description: Text(state.errorMessage,
                              style: AppTextStyles.workSansW400),
                          icon: const Icon(Icons.error),
                          closeButtonShowType: CloseButtonShowType.onHover,
                        );
                      }
                    },
                    builder: (context, state) {
                      return CustomMainGreenButton(
                        buttonText: context.tr('signIn'),
                        buttonController: _roundedLoadingButtonController,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(LoginUserEvent(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ));
                          } else {
                            _roundedLoadingButtonController.reset();
                          }
                        },
                      );
                    },
                  ),
                  5.h(),

                  /// don't have an account? Sign up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.tr('doNotHaveAnAccount'),
                        style: AppTextStyles.workSansMain.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppFunctions.isLight(context)
                              ? AppColors.greyscale400
                              : AppColors.greyscale100,
                        ),
                      ),
                      5.w(),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, AppRouter.signUp),
                        child: Text(
                          context.tr('signUp'),
                          style: AppTextStyles.workSansMain.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppFunctions.isLight(context)
                                ? AppColors.green900
                                : AppColors.green800,
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
