import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:summarize_it/data/models/language.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:summarize_it/ui/widgets/regular_button.dart';

import 'package:summarize_it/core/utils/utils.dart'
    show
        DeviceScreen,
        AppFunctions,
        AppColors,
        AppTextStyles,
        SizedBoxExtension;

class EditLanguageModal extends StatefulWidget {
  final Locale currentLocale;

  const EditLanguageModal({super.key, required this.currentLocale});

  @override
  State<EditLanguageModal> createState() => _EditLanguageModalState();
}

class _EditLanguageModalState extends State<EditLanguageModal> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = languages.indexWhere(
      (language) => language.locale == widget.currentLocale,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: DeviceScreen.h(context) / 2.5,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppFunctions.isLight(context)
            ? AppColors.summarizeItWhite
            : AppColors.mainBlackColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                tr('appLang'),
                style: AppTextStyles.workSansW600.copyWith(fontSize: 25),
              ),
              ...List.generate(
                languages.length,
                (index) {
                  final language = languages[index];
                  return GestureDetector(
                    onTap: () => setState(() => _selectedIndex = index),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                language.flag,
                                style: const TextStyle(fontSize: 25),
                              ),
                              10.w(),
                              Text(
                                context.tr(language.language),
                                style: AppTextStyles.workSansW600.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            'assets/icons/${_selectedIndex == index ? '' : 'un'}check.svg',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          RegularButton(
            w: double.infinity,
            buttonLabel: tr('save'),
            onTap: () {
              final selectedLocale = languages[_selectedIndex].locale;
              if (selectedLocale != widget.currentLocale) {
                context.setLocale(selectedLocale);
              }
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
