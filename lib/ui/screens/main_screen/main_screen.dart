import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:summarize_it/ui/screens/home_screen/home_screen.dart';
import 'package:summarize_it/utils/app_colors.dart';
import 'package:summarize_it/utils/app_constants.dart';
import 'package:summarize_it/utils/app_text_styles.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];

  int _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentScreen],
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
                onTap: () => setState(() => _currentScreen = i),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/tab_box/${AppConstants.tabBox[i].toLowerCase()}${_currentScreen == i ? '-2' : ''}.svg',
                    ),
                    Text(
                      AppConstants.tabBox[i],
                      style: AppTextStyles.workSansMain.copyWith(
                        fontWeight: FontWeight.w400,
                        color: _currentScreen == i
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
  }
}
