import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/logic/cubits/dark_theme/dark_theme_cubit.dart';
import 'package:summarize_it/logic/services/firebase/firebase_auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            await FirebaseAuthService.logoutUser();
          },
          child: const Center(
            child: Text(
              'Profile screen',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            context.read<DarkThemeCubit>().toggleTheme();
          },
          icon: Icon(Icons.dark_mode),
        ),
      ],
    );
  }
}
