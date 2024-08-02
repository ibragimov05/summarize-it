import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:summarize_it/core/utils/device_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/search.json',
            width: DeviceScreen.w(context) / 2.5,
            height: DeviceScreen.w(context) / 2.5,
          ),
          const Text(
            'Search screen',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
