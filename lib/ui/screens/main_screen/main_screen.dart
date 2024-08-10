import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:summarize_it/logic/blocs/user_info/user_info_bloc.dart';
import 'package:summarize_it/logic/cubits/tab_box_cubit/tab_box_cubit.dart';
import 'package:summarize_it/ui/screens/bookmarks/bookmarks_screen/bookmarks_screen.dart';
import 'package:summarize_it/ui/screens/home/home_screen/home_screen.dart';
import 'package:summarize_it/ui/screens/search/search_screen/search_screen.dart';
import 'package:summarize_it/ui/screens/profile/profile_screen/profile_screen.dart';

import '../../../core/utils/all_utils.dart';
import '../../../logic/blocs/books/books_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
    BookmarksScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    context.read<UserInfoBloc>().add(GetUserInfoEvent());
    context.read<BooksBloc>().add(GetBookEvent(
          uid: FirebaseAuth.instance.currentUser!.uid,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBoxCubit, int>(
      builder: (BuildContext context, int state) {
        return Scaffold(
          body: _screens[state],
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
                    onTap: () =>
                        context.read<TabBoxCubit>().changeTabBoxIndex(i),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/tab_box/${AppConstants.tabBox[i].toLowerCase()}${state == i ? '-2' : ''}.svg',
                        ),
                        Text(
                          context.tr('tabBox$i'),
                          style: AppTextStyles.workSansMain.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppFunctions.isLight(context)
                                ? state == i
                                    ? AppColors.greyscale900
                                    : AppColors.greyscale400
                                : state == i
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
        );
      },
    );
  }
}
