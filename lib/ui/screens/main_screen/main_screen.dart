import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:summarize_it/logic/blocs/user_info/user_info_bloc.dart';
import 'package:summarize_it/logic/cubits/tab_box_cubit/tab_box_cubit.dart';
import 'package:summarize_it/ui/screens/bookmarks/bookmarks_screen/bookmarks_screen.dart';
import 'package:summarize_it/ui/screens/home/home_screen/home_screen.dart';
import 'package:summarize_it/ui/screens/search/search_screen/search_screen.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';
import 'package:summarize_it/ui/screens/profile/profile_screen/profile_screen.dart';

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
                          AppConstants.tabBox[i],
                          style: AppTextStyles.workSansMain.copyWith(
                            fontWeight: FontWeight.w400,
                            color: state == i
                                ? AppColors.greyscale900
                                : AppColors.greyscale400,
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
