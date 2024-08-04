import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/core/utils/app_functions.dart';
import 'package:summarize_it/ui/screens/profile/edit_profile_screen/widgets/profile_text_form_field.dart';
import 'package:summarize_it/ui/widgets/arrow_back_button.dart';
import 'package:summarize_it/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:summarize_it/ui/widgets/regular_button.dart';

import '../../../../logic/blocs/user_info/user_info_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameTextController =
      TextEditingController();
  final TextEditingController _secondNameTextController =
      TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBackButton(),
        title: const Text(AppConstants.profile),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: BlocBuilder<UserInfoBloc, UserInfoState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const CustomCircularProgressIndicator();
            } else {
              _firstNameTextController.text = state.firstName ?? 'unnamed';
              _secondNameTextController.text = state.lastName ?? 'unnamed';
              _emailTextController.text = state.email ?? 'email';
              return Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        ProfileTextFormField(
                          labelText: 'First name',
                          textEditingController: _firstNameTextController,
                          validator: (p0) =>
                              AppFunctions.textValidator(p0, 'first name'),
                        ),
                        ProfileTextFormField(
                          labelText: 'Second name',
                          textEditingController: _secondNameTextController,
                          validator: (p0) =>
                              AppFunctions.textValidator(p0, 'second name'),
                        ),
                        ProfileTextFormField(
                          labelText: 'Email',
                          textEditingController: _emailTextController,
                          validator: (p0) => null,
                          isEnabled: false,
                        ),
                      ],
                    ),
                    RegularButton(
                      w: double.infinity,
                      buttonLabel: 'Save changes',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
