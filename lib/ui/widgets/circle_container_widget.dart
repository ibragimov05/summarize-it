import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';

class CircleContainerWidget extends StatelessWidget {
  final double? top;
  final double? bottom;
  final double? right;
  final double? left;
  final bool isAlign;

  const CircleContainerWidget({
    super.key,
    this.top,
    this.bottom,
    this.right,
    this.left,
    this.isAlign = false,
  });

  @override
  Widget build(BuildContext context) => isAlign
      ? Align(
          alignment: Alignment(right ?? 0, top ?? 0),
          child: _CircleContainer(isAlign: isAlign),
        )
      : Positioned(
          top: top,
          bottom: bottom,
          right: right,
          left: left,
          child: _CircleContainer(isAlign: isAlign),
        );
}

class _CircleContainer extends StatelessWidget {
  final bool isAlign;

  const _CircleContainer({required this.isAlign});

  @override
  Widget build(BuildContext context) => Container(
        height: isAlign ? 300 : 200,
        width: isAlign ? 300 : 200,
        decoration: BoxDecoration(
          color: AppFunctions.isLight(context)
              ? AppColors.green400.withOpacity(0.5)
              : AppColors.greyscale300.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
      );
}
