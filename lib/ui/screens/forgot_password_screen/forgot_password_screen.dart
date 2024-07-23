import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:summarize_it/ui/widgets/arrow_back_button.dart';
import 'package:summarize_it/ui/widgets/custom_main_green_button.dart';
import 'package:summarize_it/ui/widgets/custom_text_field.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/core/utils/app_functions.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';

import '../../../data/services/firebase/firebase_auth_service.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final RoundedLoadingButtonController _buttonController =
      RoundedLoadingButtonController();

  void _onContinueTap() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuthService.resetPassword(
            email: _emailTextController.text);
        if (mounted) {
          AppFunctions.showSnackBar(
              context, AppConstants.resetPasswordEmailSent);
          _emailTextController.clear();
          _buttonController.reset();
        }
      } on FirebaseAuthException catch (e) {
        if (mounted) {
          AppFunctions.showErrorSnackBar(context, 'firebase error: $e');
        }
      } catch (e) {
        if (mounted) AppFunctions.showErrorSnackBar(context, 'error: $e');
      }
    } else {
      _buttonController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! forgot password
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppConstants.forgotPassword,
                    style: AppTextStyles.workSansMain.copyWith(fontSize: 24),
                  ),
                  Text(
                    AppConstants.recoverYourAccountPassword,
                    style: AppTextStyles.workSansMain.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyscale500,
                    ),
                  ),
                ],
              ),
            ),

            //! email text fieald
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10),
              child: Text(
                AppConstants.email,
                style: AppTextStyles.workSansMain.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyscale400,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: CustomTextFormField(
                hintText: AppConstants.hintTextEmail,
                isObscure: false,
                validator: AppFunctions.emailValidator,
                isKeyboardDone: true,
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailTextController,
              ),
            ),
          ],
        ),
      ),
      //! continue button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomMainGreenButton(
          buttonController: _buttonController,
          buttonText: AppConstants.continueText,
          onTap: _onContinueTap,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }
}
