import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:summarize_it/core/utils/utils.dart'
    show DeviceScreen, SizedBoxExtension;

class RecentSummariesShimmerWidget extends StatelessWidget {
  const RecentSummariesShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: kToolbarHeight + 10,
      ),
      itemCount: 15,
      itemBuilder: (context, index) => Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: DeviceScreen.w(context),
              height: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
            ),
          ),
          15.h(),
        ],
      ),
    );
  }
}
