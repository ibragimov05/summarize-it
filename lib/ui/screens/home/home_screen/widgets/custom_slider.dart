import 'package:flutter/material.dart';
import 'package:summarize_it/core/utils/ai_constants.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';

class CustomSlider extends StatefulWidget {
  final Function(int)? onSliderValChanged;
  const CustomSlider({super.key, required this.onSliderValChanged});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _summaryLength = 1;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
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
                setState(() {
                  _summaryLength = value;
                });
              },
      ),
    );
  }
}
