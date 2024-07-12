// import 'package:flutter/material.dart';
// import 'package:summarize_it/ui/widgets/arrow_back_button.dart';
// import 'package:summarize_it/utils/app_colors.dart';
// import 'package:summarize_it/utils/app_constants.dart';

// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
// return Scaffold(
//   appBar: AppBar(
//     leading: const ArrowBackButton(),
//     title: Text(AppConstants.signUp),
//   ),
//   body: ListView(
//     children: <Widget>[

//     ],
//   ),
// );
//   }
// }
import 'package:flutter/material.dart';
import 'package:summarize_it/ui/widgets/arrow_back_button.dart';
import 'package:summarize_it/utils/app_constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBackButton(),
        title: Text(AppConstants.signUp),
      ),
      body: ListView(
        children: <Widget>[],
      ),
    );
  }
}
