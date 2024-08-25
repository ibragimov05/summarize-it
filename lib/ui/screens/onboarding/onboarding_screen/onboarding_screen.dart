import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:summarize_it/app_settings.dart';
import 'package:summarize_it/ui/screens/onboarding/onboarding_screen/widgets/ellipse_widget.dart';

import '../../../../core/utils/app_settings.dart';
import '../../../../core/utils/utils.dart'
    show AppColors, AppConstants, AppTextStyles, DeviceScreen;

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.green900,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //! summarize it text
            Center(
              child: Text(
                context.tr('summarizeIt'),
                style: AppTextStyles.workSansMain.copyWith(
                  fontSize: 35,
                  color: AppColors.summarizeItWhite,
                ),
              ),
            ),
            const SizedBox(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          width: double.infinity,
          height: DeviceScreen.h(context) / 2.3,
          margin: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: AppColors.summarizeItWhite,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //! ellipse widget
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: EllipseWidget(indexPage: _currentIndex),
              ),

              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    _currentIndex = value;
                    setState(() {});
                  },
                  itemCount: AppConstants.onboardingTextTitles.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //! onboarding texts
                        Text(
                          context.tr(AppConstants.onboardingTextTitles[index]),
                          style:
                              AppTextStyles.workSansMain.copyWith(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          context.tr(AppConstants.onboardingTexts[index]),
                          style: AppTextStyles.workSansMain.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //! main button
              GestureDetector(
                onTap: () async {
                  if (_currentIndex != 2) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.linear,
                    );
                  } else if (_currentIndex == 2) {
                    AppSettings.sawOnboarding = true;
                    getIt
                        .get<SharedPreferences>()
                        .setBool('saw-onboarding', true);
                    Navigator.of(context).pop();
                  }
                },
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 55,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.green900,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          _currentIndex == 2
                              ? context.tr('getStarted')
                              : context.tr('continueText'),
                          style: AppTextStyles.workSansMain.copyWith(
                            fontSize: 17,
                            color: AppColors.summarizeItWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
