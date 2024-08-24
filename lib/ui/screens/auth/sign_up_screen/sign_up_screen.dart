import 'package:easy_localization/easy_localization.dart';
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

  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();

  String? _confirmPasswordValidator(String? password) {
    if (password == null || password.trim().isEmpty) {
      return 'Please, enter your password';
    } else if (_passwordTextController.text !=
        _confirmPasswordTextController.text) {
      return 'Password should be similar';
    } else {
      return null;
    }
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
          title: Text(
            context.tr('signUp'),
            style: AppTextStyles.workSansW600,
          ),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 5, right: 20, left: 20),
            children: <Widget>[
              Text(
                context.tr('completeYourAccount'),
                style: AppTextStyles.workSansMain.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),

              /// [FIRST NAME]
              SignUpTextStyle(text: context.tr('firstName')),
              CustomTextFormField(
                hintText: context.tr('hintTextFirstName'),
                validator: (String? text) => AppFunctions.textValidator(
                    text, context.tr('firstName').toLowerCase()),
                textEditingController: _firstNameTextController,
              ),

              /// [Last NAME]
              SignUpTextStyle(text: context.tr('lastName')),
              CustomTextFormField(
                hintText: context.tr('hintTextLastName'),
                validator: (String? text) => AppFunctions.textValidator(
                    text, context.tr('lastName').toLowerCase()),
                textEditingController: _lastNameTextController,
              ),

              /// [EMAIL]
              SignUpTextStyle(text: context.tr('email')),
              CustomTextFormField(
                hintText: context.tr('hintTextEmail'),
                validator: AppFunctions.emailValidator,
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailTextController,
              ),

              /// [PASSWORD]
              SignUpTextStyle(text: context.tr('password')),
              CustomTextFormField(
                hintText: context.tr('hintTextPassword'),
                isObscure: true,
                validator: (String? password) =>
                    AppFunctions.passwordValidator(password, true),
                textInputType: TextInputType.text,
                textEditingController: _passwordTextController,
              ),

              /// [PASSWORD CONFIRMATION]
              SignUpTextStyle(text: context.tr('confirmPassword')),
              CustomTextFormField(
                hintText: context.tr('hintTextConfirmPassword'),
                isObscure: true,
                validator: _confirmPasswordValidator,
                isKeyboardDone: true,
                textInputType: TextInputType.text,
                textEditingController: _confirmPasswordTextController,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 25),
                child: BlocListener<AuthBloc, AuthState>(
                  listenWhen: (previous, current) =>
                      current is AuthenticatedState ||
                      current is ErrorAuthState,
                  listener: (context, state) {
                    if (state is ErrorAuthState) {
                      _buttonController.error();
                      Future.delayed(
                        const Duration(seconds: 3),
                        () => _buttonController.reset(),
                      );
                    }
                  },
                  child: CustomMainGreenButton(
                    buttonController: _buttonController,
                    buttonText: context.tr('signUp'),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _buttonController.start();
                        context.read<AuthBloc>().add(
                              RegisterUserEvent(
                                firstName: _firstNameTextController.text,
                                secondName: _lastNameTextController.text,
                                email: _emailTextController.text,
                                password: _passwordTextController.text,
                              ),
                            );
                      } else {
                        _buttonController.reset();
                      }
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.tr('alreadyHaveAnAccount'),
                    style: AppTextStyles.workSansMain.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppFunctions.isLight(context)
                          ? AppColors.greyscale500
                          : AppColors.greyscale100,
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
                      context.tr('login'),
                      style: AppTextStyles.workSansMain.copyWith(
                        fontSize: 16,
                        color: AppFunctions.isLight(context)
                            ? AppColors.green900
                            : AppColors.green600,
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

  @override
  void dispose() {
    _firstNameTextController.dispose();
    _lastNameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _confirmPasswordTextController.dispose();
    super.dispose();
  }
}
