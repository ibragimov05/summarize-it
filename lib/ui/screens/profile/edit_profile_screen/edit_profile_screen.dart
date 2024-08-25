import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/core/utils/user_data.dart';
import 'package:summarize_it/logic/blocs/all_blocs.dart';
import 'package:summarize_it/ui/widgets/arrow_back_button.dart';
import 'package:summarize_it/ui/widgets/custom_main_green_button.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:summarize_it/ui/screens/profile/edit_profile_screen/widgets/profile_text_form_field.dart';

import '../../../../core/utils/utils.dart' show AppFunctions, DeviceScreen;

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

  final RoundedLoadingButtonController _buttonController =
      RoundedLoadingButtonController();

  @override
  void initState() {
    super.initState();
    _firstNameTextController.text = UserData.firstName;
    _secondNameTextController.text = UserData.lastName;
    _emailTextController.text = UserData.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBackButton(),
        title: Text(context.tr('profile')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ProfileTextFormField(
                    labelText: context.tr('hintTextFirstName'),
                    textEditingController: _firstNameTextController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter your name';
                      } else if (_firstNameTextController.text ==
                          UserData.firstName) {
                        return 'Your new name should be different!';
                      } else {
                        return null;
                      }
                    },
                  ),
                  ProfileTextFormField(
                    labelText: context.tr('hintTextLastName'),
                    textEditingController: _secondNameTextController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter your last name';
                      } else if (_secondNameTextController.text ==
                          UserData.lastName) {
                        return 'Your new last name should be different!';
                      } else {
                        return null;
                      }
                    },
                  ),
                  GestureDetector(
                    onTap: () => AppFunctions.showSnackBar(
                      context,
                      'You cannot change your email due to privacy',
                    ),
                    child: ProfileTextFormField(
                      labelText: 'Email',
                      textEditingController: _emailTextController,
                      validator: (p0) => null,
                      isEnabled: false,
                    ),
                  ),
                ],
              ),
              BlocListener<UserBloc, UserState>(
                listener: (context, state) {
                  if (state.userStatus == UserStatus.loaded) {
                    _buttonController.reset();
                    Navigator.of(context).pop();
                    AppFunctions.showToast(
                      message: 'Success',
                      isSuccess: true,
                      context: context,
                    );
                  }
                },
                child: CustomMainGreenButton(
                  w: DeviceScreen.w(context),
                  buttonText: context.tr('save'),
                  buttonController: _buttonController,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _buttonController.start();
                      context.read<UserBloc>().add(UserEvent.updateUserData(
                            firstName: _firstNameTextController.text !=
                                    UserData.firstName
                                ? _firstNameTextController.text
                                : null,
                            secondName: _secondNameTextController.text !=
                                    UserData.lastName
                                ? _secondNameTextController.text
                                : null,
                          ));
                    } else {
                      _buttonController.reset();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
