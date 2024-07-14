import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:summarize_it/logic/services/firebase/firebase_auth_service.dart';
import 'package:summarize_it/ui/screens/login_screen/widgets/login_screen_text.dart';
import 'package:summarize_it/ui/widgets/custom_main_green_button.dart';
import 'package:summarize_it/ui/widgets/custom_text_field.dart';
import 'package:summarize_it/utils/app_colors.dart';
import 'package:summarize_it/utils/app_constants.dart';
import 'package:summarize_it/utils/app_functions.dart';
import 'package:summarize_it/utils/app_router.dart';
import 'package:summarize_it/utils/app_text_styles.dart';
import 'package:summarize_it/utils/responsive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final RoundedLoadingButtonController _roundedLoadingButtonController =
      RoundedLoadingButtonController();

  void _onSignInButtonTapped() async {
    if (_formKey.currentState!.validate()) {
      _roundedLoadingButtonController.start();
      try {
        await FirebaseAuthService.loginUser(
          email: _emailTextController.text,
          password: _passwordTextController.text,
        );
      } on FirebaseAuthException catch (e) {
        if (mounted) {
          AppFunctions.showErrorSnackBar(context, 'firebase error: $e');
        }
      } catch (e) {
        if (mounted) AppFunctions.showErrorSnackBar(context, 'error: $e');
      } finally {
        _roundedLoadingButtonController.reset();
      }
    } else {
      _roundedLoadingButtonController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //! background
          Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.green900.withOpacity(0.9),
          ),

          //! hi welcome back
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
                  //! sign in
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
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //! email address
                            const LoginScreenText(text: 'Email Address'),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 30),
                              child: CustomTextFormField(
                                textEditingController: _emailTextController,
                                hintText: 'Enter your email address',
                                isObscure: false,
                                isKeyboardDone: false,
                                textInputType: TextInputType.emailAddress,
                                validator: AppFunctions.emailValidator,
                              ),
                            ),

                            //! password
                            const LoginScreenText(text: 'Password'),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 30),
                              child: CustomTextFormField(
                                textEditingController: _passwordTextController,
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

                      //! remember me? forgot password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // const Row(
                          //   children: [
                          //     Icon(Icons.circle_outlined),
                          //     Gap(5),
                          //     LoginScreenText(text: AppConstants.rememberMe),
                          //   ],
                          // ),
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
                    onTap: _onSignInButtonTapped,
                  ),
                  const Gap(30),

                  //! don't have an account? Sign up
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
                      const Gap(5),
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

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }
}
