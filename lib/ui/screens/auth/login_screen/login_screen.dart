import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../../widgets/widgets.dart';
import 'widgets/login_screen_text.dart';
import '../../../../core/utils/utils.dart';
import '../../../../logic/blocs/auth/auth_bloc.dart';

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
  void initState() {
    super.initState();
    if (!AppSettings.sawOnboarding) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamed(context, AppRouter.onboarding);
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                        style:
                            AppTextStyles.workSansMain.copyWith(fontSize: 25),
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

                    BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) => state.whenOrNull(
                        error: (errorMessage) {
                          _roundedLoadingButtonController.error();
                          Future.delayed(
                            const Duration(seconds: 3),
                            () => _roundedLoadingButtonController.reset(),
                          );
                          AppFunctions.showToast(
                            message: errorMessage,
                            isSuccess: false,
                            context: context,
                          );
                          return null;
                        },
                      ),
                      child: CustomMainGreenButton(
                        buttonText: context.tr('signIn'),
                        buttonController: _roundedLoadingButtonController,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(AuthEvent.login(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ));
                          } else {
                            _roundedLoadingButtonController.reset();
                          }
                        },
                      ),
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
