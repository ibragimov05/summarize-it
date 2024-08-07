import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/core/utils/app_assets.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_constants.dart';
import 'package:summarize_it/core/utils/app_functions.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';
import 'package:summarize_it/core/utils/device_screen.dart';
import 'package:summarize_it/logic/blocs/books/books_bloc.dart';
import 'package:summarize_it/logic/cubits/all_cubit.dart';
import 'package:summarize_it/ui/screens/bookmarks/bookmarks_screen/widget/show_summary_widget.dart';
import 'package:summarize_it/ui/screens/home/home_screen/widgets/recent_summaries_shimmer_widget.dart';

import '../../../../../data/models/book.dart';
import '../../../../widgets/animation_widget_with_bloc.dart';

class HomeScreenMainWidget extends StatefulWidget {
  const HomeScreenMainWidget({super.key});

  @override
  State<HomeScreenMainWidget> createState() => _HomeScreenMainWidgetState();
}

class _HomeScreenMainWidgetState extends State<HomeScreenMainWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
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
                            context.tr(message),
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
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: CustomSliverPersistentHeader(
            minHeight: kToolbarHeight,
            maxHeight: kToolbarHeight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration:
                  const BoxDecoration(color: Colors.white, boxShadow: []),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.tr('summaryOfPast7Days'),
                    style: AppTextStyles.workSansW600.copyWith(
                      color: AppColors.green900,
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        context.read<TabBoxCubit>().changeTabBoxIndex(2),
                    child: Text(
                      context.tr('showAll'),
                      style: AppTextStyles.workSansW500.copyWith(
                        color: AppColors.greyscale400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        BlocConsumer<BooksBloc, BooksState>(
          listener: (context, state) {
            if (state is ErrorBookState) {
              AppFunctions.showErrorSnackBar(
                  context, context.tr('somethingWentWrong'));
            }
          },
          builder: (context, state) {
            if (state is LoadedBookState) {
              List<Book> pastSevenDaySummaries =
                  AppFunctions.getPast7DaysSummaries(books: state.books);
              return pastSevenDaySummaries.isNotEmpty
                  ? SliverPadding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: kToolbarHeight + 10,
                      ),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => ShowSummaryWidget(
                            book: pastSevenDaySummaries[index],
                            isDismissible: false,
                          ),
                          childCount: pastSevenDaySummaries.length,
                        ),
                      ),
                    )
                  : SliverFillRemaining(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const AnimationWidgetWithBloc(
                              animationPath: AppAssets.lottieSearch,
                            ),
                            SizedBox(
                              width: DeviceScreen.w(context) / 1.3,
                              child: Text(
                                context.tr('noSummaryFound'),
                                style: AppTextStyles.workSansW600.copyWith(
                                  fontSize: 16,
                                  color: AppColors.green800,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
            }
            return const SliverFillRemaining(
              child: RecentSummariesShimmerWidget(),
            );
          },
        ),
      ],
    );
  }
}


class CustomSliverPersistentHeader extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  CustomSliverPersistentHeader({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(covariant CustomSliverPersistentHeader oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
