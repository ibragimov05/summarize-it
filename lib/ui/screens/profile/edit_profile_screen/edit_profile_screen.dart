import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:summarize_it/ui/screens/profile/edit_profile_screen/widgets/profile_text_form_field.dart';
import 'package:summarize_it/ui/widgets/arrow_back_button.dart';
import 'package:summarize_it/ui/widgets/custom_main_green_button.dart';

import '../../../../logic/blocs/user_info/user_info_bloc.dart';
import '/core/utils/all_utils.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBackButton(),
        title:  Text(context.tr('profile')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: BlocConsumer<UserInfoBloc, UserInfoState>(
          buildWhen: (previous, current) =>
              previous.isLoading != current.isLoading && !current.isLoading,
          listener: (context, state) {
            if (!state.isLoading) {
              _buttonController.reset();
              Navigator.of(context).pop();
              AppFunctions.showToast(
                message: context.tr('infoChangedSuccessfully'),
                context: context,
              );
            }
          },
          builder: (context, state) {
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
                        isEnabled: state.isLoading ? false : true,
                        textEditingController: _firstNameTextController,
                        validator: (p0) =>
                            AppFunctions.textValidator(p0, 'first name'),
                      ),
                      ProfileTextFormField(
                        labelText: 'Second name',
                        isEnabled: state.isLoading ? false : true,
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
                  CustomMainGreenButton(
                    w: DeviceScreen.w(context),
                    buttonText: 'Save changes',
                    buttonController: _buttonController,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _buttonController.start();
                        context.read<UserInfoBloc>().add(EditUserInfoEvent(
                              newFirstName: _firstNameTextController.text,
                              newSecondName: _secondNameTextController.text,
                            ));
                      } else {
                        _buttonController.reset();
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
