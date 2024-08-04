import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:summarize_it/core/utils/device_screen.dart';
import 'package:summarize_it/core/utils/extensions.dart';

class LoadingShimmerWidget extends StatelessWidget {
  final bool isProfileScreen;
  const LoadingShimmerWidget({super.key, required this.isProfileScreen});

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
              if (!isProfileScreen) _shimmerContainer(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _shimmerContainer(BuildContext context) => Container(
        width: DeviceScreen.w(context) / 3,
        height: isProfileScreen ? 15.0 : 10.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isProfileScreen ? 8 : 5),
          color: Colors.white,
        ),
      );
}
