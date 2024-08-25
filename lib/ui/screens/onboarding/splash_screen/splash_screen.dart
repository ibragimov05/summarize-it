import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:summarize_it/app_settings.dart';
import 'package:summarize_it/core/utils/apis.dart';

import 'package:summarize_it/core/utils/utils.dart'
    show AppColors, AppTextStyles, DeviceScreen;
import 'package:summarize_it/data/services/shared_prefs/user_prefs_service.dart';

import '../../../../core/utils/app_settings.dart';
import '../../../../core/utils/user_data.dart';
import '../../../../logic/blocs/all_blocs.dart';
import '../../../../logic/blocs/group_chat/group_chat_bloc.dart';
import '../../auth/login_screen/login_screen.dart';
import '../../main_screen/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _collectData.then(
      (value) => Future.delayed(const Duration(seconds: 2)).then(
        (value) => _toTheNextScreen(),
      ),
    );
  }

  Future<void> get _collectData async {
    AppSettings.sawOnboarding =
        getIt.get<SharedPreferences>().getBool('saw-onboarding') ?? false;

    final user = UserPrefsService.getUser();

    if (user == null) return;

    await Apis.set();
    UserData.set(user);
  }

  Future<void> _toTheNextScreen() async {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthenticatedState) {
                context.read<BooksBloc>().add(BooksEvent.getBooks(
                      uid: FirebaseAuth.instance.currentUser?.uid ?? '',
                    ));
                context.read<GroupChatBloc>().add(
                      const GroupChatEvent.getAllMessages(),
                    );
                return const MainScreen();
              } else {
                return const LoginScreen();
              }
            },
          );
        },
      ),
    );
  }

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
