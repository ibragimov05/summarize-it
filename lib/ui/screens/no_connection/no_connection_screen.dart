import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../core/utils/utils.dart';
import '../../../logic/blocs/books/books_bloc.dart';
import '../../../logic/blocs/user/user_bloc.dart';

class NoConnectionScreen extends StatefulWidget {
  const NoConnectionScreen({super.key});

  @override
  State<NoConnectionScreen> createState() => _NoConnectionScreenState();
}

class _NoConnectionScreenState extends State<NoConnectionScreen> {
  @override
  void initState() {
    super.initState();
    Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> result) {
        if (result.contains(ConnectivityResult.wifi) ||
            result.contains(ConnectivityResult.mobile)) {
          if (!mounted) return;

          context.read<UserBloc>().add(const UserEvent.getUserEvent());
          context.read<BooksBloc>().add(BooksEvent.getBooks(uid: UserData.uid));

          Navigator.of(context).pop();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        child: Container(
          color: AppColors.green900.withOpacity(0.1),
          child: Scaffold(
            backgroundColor: AppColors.green900,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/lottie/loading_duck.json',
                    height: DeviceScreen.w(context) / 2.5,
                    width: DeviceScreen.w(context) / 2.5,
                  ),
                  SizedBox(
                    width: DeviceScreen.w(context) / 1.4,
                    child: Text(
                      context.tr('noInternet'),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.workSansW700.copyWith(
                        fontSize: 18,
                        color: AppColors.summarizeItWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
