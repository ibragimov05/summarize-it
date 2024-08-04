import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:summarize_it/core/utils/extensions.dart';
import 'package:summarize_it/logic/blocs/all_blocs.dart';
import 'package:summarize_it/ui/screens/auth/sign_up_screen/widgets/sign_up_text_style.dart';
import 'package:summarize_it/ui/widgets/arrow_back_button.dart';
import 'package:summarize_it/ui/widgets/custom_main_green_button.dart';
import 'package:summarize_it/ui/widgets/custom_text_field.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/core/utils/app_functions.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController _buttonController =
      RoundedLoadingButtonController();

  final Map<String, TextEditingController> _textControllers = {
    AppConstants.firstName: TextEditingController(),
    AppConstants.lastName: TextEditingController(),
    AppConstants.email: TextEditingController(),
    AppConstants.password: TextEditingController(),
    AppConstants.confirmPassword: TextEditingController(),
  };

  String? _confirmPasswordValidator(String? password) {
    if (password == null || password.trim().isEmpty) {
      return 'Please, enter your password';
    } else if (_textControllers[AppConstants.password]!.text !=
        _textControllers[AppConstants.confirmPassword]!.text) {
      return 'Password should be similar';
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    _textControllers.forEach((key, controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
          if (Navigator.canPop(context)) {
            Navigator.of(context).pop();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: AppColors.summarizeItTransparent,
          leading: const ArrowBackButton(),
          title: const Text(AppConstants.signUp),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 5, right: 20, left: 20),
            children: <Widget>[
              Text(
                AppConstants.completeYourAccount,
                style: AppTextStyles.workSansMain.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SignUpTextStyle(text: AppConstants.firstName),
              CustomTextFormField(
                hintText: AppConstants.hintTextFirstName,
                isObscure: false,
                validator: (String? text) => AppFunctions.textValidator(
                    text, AppConstants.firstName.toLowerCase()),
                isKeyboardDone: false,
                textInputType: TextInputType.text,
                textEditingController:
                    _textControllers[AppConstants.firstName]!,
              ),
              const SignUpTextStyle(text: AppConstants.lastName),
              CustomTextFormField(
                hintText: AppConstants.hintTextLastName,
                isObscure: false,
                validator: (String? text) => AppFunctions.textValidator(
                    text, AppConstants.lastName.toLowerCase()),
                isKeyboardDone: false,
                textInputType: TextInputType.text,
                textEditingController: _textControllers[AppConstants.lastName]!,
              ),
              const SignUpTextStyle(text: AppConstants.email),
              CustomTextFormField(
                hintText: AppConstants.hintTextEmail,
                isObscure: false,
                validator: AppFunctions.emailValidator,
                isKeyboardDone: false,
                textInputType: TextInputType.emailAddress,
                textEditingController: _textControllers[AppConstants.email]!,
              ),
              const SignUpTextStyle(text: AppConstants.password),
              CustomTextFormField(
                hintText: AppConstants.hintTextPassword,
                isObscure: true,
                validator: (String? password) =>
                    AppFunctions.passwordValidator(password, true),
                isKeyboardDone: false,
                textInputType: TextInputType.text,
                textEditingController: _textControllers[AppConstants.password]!,
              ),
              const SignUpTextStyle(text: AppConstants.confirmPassword),
              CustomTextFormField(
                hintText: AppConstants.hintTextConfirmPassword,
                isObscure: true,
                validator: _confirmPasswordValidator,
                isKeyboardDone: true,
                textInputType: TextInputType.text,
                textEditingController:
                    _textControllers[AppConstants.confirmPassword]!,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 25),
                child: BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthenticatedState) {
                      context.read<UserInfoBloc>().add(
                            AddUserInfoEvent(
                              email: _textControllers[AppConstants.email]!.text,
                              uid: FirebaseAuth.instance.currentUser?.uid ??
                                  'null',
                            ),
                          );
                    } else if (state is ErrorAuthState) {
                      _buttonController.error();
                      Future.delayed(
                        const Duration(seconds: 3),
                        () => _buttonController.reset(),
                      );
                    }
                  },
                  child: CustomMainGreenButton(
                    buttonController: _buttonController,
                    buttonText: AppConstants.signUp,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _buttonController.start();
                        context.read<AuthBloc>().add(
                              RegisterUserEvent(
                                firstName:
                                    _textControllers[AppConstants.firstName]!
                                        .text,
                                secondName:
                                    _textControllers[AppConstants.lastName]!
                                        .text,
                                email:
                                    _textControllers[AppConstants.email]!.text,
                                password:
                                    _textControllers[AppConstants.password]!
                                        .text,
                              ),
                            );
                      }
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppConstants.alreadyHaveAnAccount,
                    style: AppTextStyles.workSansMain.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyscale500,
                    ),
                  ),
                  5.w(),
                  GestureDetector(
                    onTap: () {
                      if (context.read<AuthBloc>().state is! LoadingAuthState) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      AppConstants.login,
                      style: AppTextStyles.workSansMain.copyWith(
                        fontSize: 16,
                        color: AppColors.green900,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
