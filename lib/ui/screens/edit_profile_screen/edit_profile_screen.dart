import 'package:flutter/material.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/ui/widgets/arrow_back_button.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBackButton(),
        title: const Text(AppConstants.profile),
      ),
    );
  }
}
