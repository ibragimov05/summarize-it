import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../../../widgets/widgets.dart';
import '../../../../core/utils/utils.dart';
import '../../../../logic/blocs/auth/auth_bloc.dart';

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

  String get _email => _emailTextController.text;

  void _onContinueTap() async {
    if (_formKey.currentState!.validate()) {
      try {
        context.read<AuthBloc>().add(AuthEvent.resetPassword(email: _email));
        if (mounted) {
          AppFunctions.showSnackBar(
              context, context.tr('resetPasswordEmailSent'));
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
      appBar: AppBar(leading: const ArrowBackButton()),
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
                    context.tr('forgotPassword'),
                    style: AppTextStyles.workSansMain.copyWith(fontSize: 24),
                  ),
                  Text(
                    context.tr('recoverYourAccountPassword'),
                    style: AppTextStyles.workSansMain.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyscale500,
                    ),
                  ),
                ],
              ),
            ),

            //! email text field
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10),
              child: Text(
                context.tr('email'),
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
                hintText: context.tr('hintTextEmail'),
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
          buttonText: context.tr('continueText'),
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
