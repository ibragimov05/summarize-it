import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:summarize_it/core/utils/utils.dart'
    show DeviceScreen, SizedBoxExtension;

class LoadingShimmerWidget extends StatelessWidget {
  const LoadingShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        children: [
          const CircleAvatar(backgroundColor: Colors.white),
          5.w(),
          Column(
            children: [
              _shimmerContainer(context),
              5.h(),
              _shimmerContainer(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _shimmerContainer(BuildContext context) => Container(
        width: DeviceScreen.w(context) / 3,
        height: 10.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
      );
}
