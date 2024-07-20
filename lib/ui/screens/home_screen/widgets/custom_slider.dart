import 'package:flutter/material.dart';
import 'package:summarize_it/utils/ai_constants.dart';
import 'package:summarize_it/utils/app_colors.dart';

class CustomSlider extends StatefulWidget {
  final Function(int) onSliderValChanged;
  const CustomSlider({super.key, required this.onSliderValChanged});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _summaryLength = 1;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _summaryLength,
      min: 1,
      max: 3,
      divisions: 2,
      thumbColor: AppColors.green900,
      activeColor: AppColors.green900,
      label: SummaryLength.values[_summaryLength.toInt() - 1].name,
      onChanged: (value) {
        widget.onSliderValChanged(value.toInt());
        setState(() {
          _summaryLength = value;
        });
      },
    );
  }
}
