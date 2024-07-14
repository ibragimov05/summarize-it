import 'package:flutter/material.dart';
import 'package:summarize_it/ui/screens/onboarding/widgets/ellipse_widget.dart';
import 'package:summarize_it/utils/app_colors.dart';
import 'package:summarize_it/utils/app_constants.dart';
import 'package:summarize_it/utils/app_text_styles.dart';
import 'package:summarize_it/utils/responsive.dart';

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
    return Scaffold(
      backgroundColor: AppColors.green900,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //! summarize it text
          Center(
            child: Text(
              AppConstants.summarizeIt,
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
        height: Responsive.screenH(context) / 2.3,
        margin: const EdgeInsets.all(30),
        // padding: const EdgeInsets.all(15),
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
                  setState(() {
                    _currentIndex = value;
                  });
                },
                itemCount: AppConstants.onboardingTextTitles.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //! onboarding texts
                      Text(
                        AppConstants.onboardingTextTitles[index],
                        style:
                            AppTextStyles.workSansMain.copyWith(fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        AppConstants.onboardingTexts[index],
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
                    duration: const Duration(milliseconds: 550),
                    curve: Curves.linear,
                  );
                } else if (_currentIndex == 2) {
                  // SharedPreferences sharedPreferences =
                  //     await SharedPreferences.getInstance();
                  // sharedPreferences.setBool('saw-onboarding', true);
                  // if (context.mounted) {
                  //   Navigator.of(context).pop();
                  // }
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
                            ? AppConstants.getStarted
                            : AppConstants.continueText,
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
    );
  }
}
