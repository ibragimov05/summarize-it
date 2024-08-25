import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../chat/chat_screen.dart';
import '../../../core/utils/utils.dart';
import '../home/home_screen/home_screen.dart';
import '../profile/profile_screen/profile_screen.dart';
import '../bookmarks/bookmarks_screen/bookmarks_screen.dart';
import '../../../logic/cubits/tab_box_cubit/tab_box_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DateTime? _lastPressedAt;

  final List<Widget> _screens = const [
    HomeScreen(),
    ChatScreen(),
    BookmarksScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> result) {
        if (!(result.contains(ConnectivityResult.wifi) ||
            result.contains(ConnectivityResult.mobile))) {
          if (!mounted) return;
          Navigator.pushNamed(context, AppRouter.noConnectionScreen);
        }
      },
    );
  }

  void _onPopInvoked(bool didPop, Object? result) {
    final now = DateTime.now();
    final backButtonHasNotBeenPressedOrHasBeenPressedLongTimeAgo =
        _lastPressedAt == null ||
            now.difference(_lastPressedAt!) > const Duration(seconds: 2);

    if (backButtonHasNotBeenPressedOrHasBeenPressedLongTimeAgo) {
      if (context.read<TabBoxCubit>().state.tabBoxCurrentIndex != 0) {
        context.read<TabBoxCubit>().changeTabBoxIndex(newIndex: 0);
      } else {
        _lastPressedAt = now;

        context.read<TabBoxCubit>().increasePopCount();

        AppFunctions.showSnackBar(context, context.tr('pressTwice'));
      }
    }
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<TabBoxCubit, TabBoxState>(
        builder: (BuildContext context, state) => PopScope(
          canPop: state.canPop,
          onPopInvokedWithResult: _onPopInvoked,
          child: Scaffold(
            body: _screens[state.tabBoxCurrentIndex],
            bottomNavigationBar: Container(
              height: 60,
              padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.greyscale300),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < 4; i++)
                    GestureDetector(
                      onTap: () => context
                          .read<TabBoxCubit>()
                          .changeTabBoxIndex(newIndex: i),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/tab_box/${AppConstants.tabBox[i].toLowerCase()}${state.tabBoxCurrentIndex == i ? '-2' : ''}.svg',
                          ),
                          Text(
                            context.tr('tabBox$i'),
                            style: AppTextStyles.workSansMain.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppFunctions.isLight(context)
                                  ? state.tabBoxCurrentIndex == i
                                      ? AppColors.greyscale900
                                      : AppColors.greyscale400
                                  : state.tabBoxCurrentIndex == i
                                      ? AppColors.green900
                                      : AppColors.greyscale400,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
}
