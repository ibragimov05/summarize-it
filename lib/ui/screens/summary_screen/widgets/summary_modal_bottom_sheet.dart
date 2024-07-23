import 'package:flutter/material.dart';
import 'package:summarize_it/ui/screens/summary_screen/widgets/summary_text_field.dart';
import 'package:summarize_it/ui/widgets/regular_button.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';

import '../../../../core/utils/device_screen.dart';

class SummaryModalBottomSheet extends StatefulWidget {
  const SummaryModalBottomSheet({super.key});

  @override
  State<SummaryModalBottomSheet> createState() =>
      _SummaryModalBottomSheetState();
}

class _SummaryModalBottomSheetState extends State<SummaryModalBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _searchDataTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: DeviceScreen.h(context) / 2.8,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Enter data to search from book',
            style: AppTextStyles.workSansMain.copyWith(fontSize: 18),
          ),
          Form(
            key: _formKey,
            child: SummaryTextFormField(
              textEditingController: _searchDataTextController,
              validator: (String? value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter something';
                }
                return null;
              },
            ),
          ),
          RegularButton(
            w: double.infinity,
            buttonLabel: 'Send',
            onTap: () {
              if (_formKey.currentState!.validate()) {}
            },
          ),
        ],
      ),
    );
  }
}
