import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';

import '../../../../widgets/widgets.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../data/models/book.dart';
import 'recent_summaries_shimmer_widget.dart';
import '../../../../../logic/blocs/books/books_bloc.dart';
import '../../../../../logic/cubits/tab_box_cubit/tab_box_cubit.dart';
import '../../../bookmarks/bookmarks_screen/widget/show_summary_widget.dart';

class HomeScreenMainWidget extends StatefulWidget {
  const HomeScreenMainWidget({super.key});

  @override
  State<HomeScreenMainWidget> createState() => _HomeScreenMainWidgetState();
}

class _HomeScreenMainWidgetState extends State<HomeScreenMainWidget> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.green900,
      onRefresh: () async =>
          context.read<BooksBloc>().add(BooksEvent.getBooks(uid: UserData.uid)),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: CarouselSlider(
                items: AppConstants.homeScreenMessages.map((message) {
                  return Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppFunctions.isLight(context)
                          ? AppColors.green900.withOpacity(0.1)
                          : AppColors.greyscale100.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      children: [
                        CircleContainerWidget(
                          right: AppFunctions.randomNumber,
                          top: AppFunctions.randomNumber,
                          bottom: AppFunctions.randomNumber,
                          left: AppFunctions.randomNumber,
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
                                color: AppFunctions.isLight(context)
                                    ? AppColors.green900
                                    : AppColors.greyscale100,
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
                color: AppFunctions.isLight(context)
                    ? AppColors.summarizeItWhite
                    : AppColors.mainBlackColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.tr('summaryOfPast7Days'),
                      style: AppTextStyles.workSansW600.copyWith(
                        color: AppFunctions.isLight(context)
                            ? AppColors.green900
                            : AppColors.greyscale100,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context
                          .read<TabBoxCubit>()
                          .changeTabBoxIndex(newIndex: 2),
                      child: Text(
                        context.tr('showAll'),
                        style: AppTextStyles.workSansW500.copyWith(
                          color: AppFunctions.isLight(context)
                              ? AppColors.greyscale400
                              : AppColors.greyscale300.withOpacity(0.5),
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
              state.whenOrNull(
                error: (message) => AppFunctions.showErrorSnackBar(
                  context,
                  context.tr('somethingWentWrong'),
                ),
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (books) {
                  List<Book> pastSevenDaySummaries =
                      AppFunctions.getPast7DaysSummaries(books: books);
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
                      : SliverToBoxAdapter(
                          child: SizedBox(
                            height: DeviceScreen.h(context) / 2.2,
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
                },
                orElse: () => const SliverFillRemaining(
                  child: RecentSummariesShimmerWidget(),
                ),
              );
            },
          ),
        ],
      ),
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
