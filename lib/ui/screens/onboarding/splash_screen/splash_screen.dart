import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:summarize_it/core/utils/utils.dart'
    show AppColors, AppTextStyles, DeviceScreen;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/loading_duck.json',
              height: DeviceScreen.w(context) / 3,
              width: DeviceScreen.w(context) / 3,
            ),
            Text(
              context.tr('summarizeIt'),
              style: AppTextStyles.workSansMain.copyWith(
                fontSize: 40,
                color: AppColors.summarizeItWhite,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
