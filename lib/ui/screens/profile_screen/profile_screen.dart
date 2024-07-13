import 'package:flutter/material.dart';
import 'package:summarize_it/logic/services/firebase/firebase_auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
