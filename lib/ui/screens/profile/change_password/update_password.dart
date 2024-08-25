import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../widgets/widgets.dart';
import '../../../../core/utils/utils.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final currentUser = FirebaseAuth.instance.currentUser;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _onSaveTap() async {
    if (_formKey.currentState!.validate()) {
      if (currentUser == null) return;
      try {
        await currentUser?.updatePassword(
          _passwordController.text,
        );

        if (!mounted) return;

        AppFunctions.showToast(
          message: context.tr('passwordChanged'),
          isSuccess: true,
          context: context,
        );
      } catch (_) {
        if (!mounted) return;

        AppFunctions.showToast(
          message: context.tr('loginAgain'),
          isSuccess: false,
          context: context,
        );
      } finally {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(context.tr('updatePassword')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      hintText: context.tr('password'),
                      validator: (p0) =>
                          AppFunctions.passwordValidator(p0, true),
                      isObscure: true,
                      textEditingController: _passwordController,
                    ),
                    20.h(),
                    CustomTextFormField(
                      hintText: context.tr('confirmPassword'),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please confirm your password';
                        } else if (_passwordController.text !=
                            _confirmPasswordController.text) {
                          return 'Password should be similar';
                        }
                        return null;
                      },
                      isObscure: true,
                      isKeyboardDone: true,
                      textEditingController: _confirmPasswordController,
                    ),
                  ],
                ),
              ),
              RegularButton(
                w: double.infinity,
                buttonLabel: 'Save',
                onTap: _onSaveTap,
              ),
            ],
          ),
        ),
      );
}
