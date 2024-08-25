import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';

class CustomSlider extends StatefulWidget {
  final Function(int)? onSliderValChanged;
  const CustomSlider({super.key, required this.onSliderValChanged});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _summaryLength = 1;

  @override
  Widget build(BuildContext context) => SliderTheme(
        data: SliderTheme.of(context).copyWith(
          thumbColor: AppColors.green900,
          activeTrackColor: AppColors.green900,
          overlayColor: AppColors.green900.withOpacity(0.3),
          valueIndicatorTextStyle: AppTextStyles.workSansW500,
          valueIndicatorColor: AppColors.green900,
        ),
        child: Slider(
          value: _summaryLength,
          min: 1,
          max: 3,
          divisions: 2,
          label: SummaryLength.values[_summaryLength.toInt() - 1].name,
          onChanged: widget.onSliderValChanged == null
              ? null
              : (value) {
                  widget.onSliderValChanged!(value.toInt());
                  setState(() => _summaryLength = value);
                },
        ),
      );
}
