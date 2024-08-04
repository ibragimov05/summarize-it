import 'package:carousel_slider/carousel_slider.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/core/utils/app_assets.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/core/utils/app_functions.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';
import 'package:summarize_it/logic/blocs/books/books_bloc.dart';
import 'package:summarize_it/logic/cubits/all_cubit.dart';
import 'package:summarize_it/ui/screens/bookmarks/bookmarks_screen/widget/show_summary_widget.dart';
import 'package:summarize_it/ui/widgets/custom_circular_progress_indicator.dart';

import '../../../../../data/models/book.dart';
import '../../../../widgets/animation_widget_with_bloc.dart';

class HomeScreenMainWidget extends StatefulWidget {
  const HomeScreenMainWidget({super.key});

  @override
  State<HomeScreenMainWidget> createState() => _HomeScreenMainWidgetState();
}

class _HomeScreenMainWidgetState extends State<HomeScreenMainWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: CarouselSlider(
            items: AppConstants.homeScreenMessages.map((message) {
              return Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.green900.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: AppFunctions.randomNumber,
                      right: AppFunctions.randomNumber,
                      left: AppFunctions.randomNumber,
                      top: AppFunctions.randomNumber,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: AppColors.green400.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Center(
                        child: Text(
                          message,
                          textAlign: TextAlign.start,
                          style: AppTextStyles.workSansMain.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: AppColors.green900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: double.infinity,
              autoPlay: true,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeIn,
              pauseAutoPlayOnTouch: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Summary of the Past 7 Days',
                style: AppTextStyles.workSansW600.copyWith(
                  color: AppColors.green900,
                ),
              ),
              GestureDetector(
                onTap: () => context.read<TabBoxCubit>().changeTabBoxIndex(2),
                child: Text(
                  'Show all',
                  style: AppTextStyles.workSansW500.copyWith(
                    color: AppColors.greyscale400,
                  ),
                ),
              ),
            ],
          ),
        ),
        BlocConsumer<BooksBloc, BooksState>(
          listener: (context, state) {
            if (state is ErrorBookState) {
              AppFunctions.showErrorSnackBar(
                  context, 'Something went wrong! Please try again');
            }
          },
          builder: (context, state) {
            if (state is LoadedBookState) {
              List<Book> pastSevenDaySummaries =
                  AppFunctions.getPast7DaysSummaries(books: state.books);
              return Expanded(
                child: pastSevenDaySummaries.isNotEmpty
                    ? FadingEdgeScrollView.fromScrollView(
                        gradientFractionOnStart: 0.3,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: kToolbarHeight + 10,
                          ),
                          controller: _scrollController,
                          itemCount: pastSevenDaySummaries.length,
                          itemBuilder: (context, index) => ShowSummaryWidget(
                            book: pastSevenDaySummaries[index],
                            isDismissible: false,
                          ),
                        ),
                      )
                    : const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimationWidgetWithBloc(
                              animationPath: AppAssets.lottieSearch,
                            ),
                             Text(AppConstants.noSummaryFound),
                          ],
                        ),
                      ),
              );
            }
            return const CustomCircularProgressIndicator();
          },
        ),
      ],
    );
  }
}
