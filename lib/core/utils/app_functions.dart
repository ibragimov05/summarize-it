import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:summarize_it/data/models/book.dart';
import 'package:toastification/toastification.dart';
import 'package:easy_localization/easy_localization.dart';

import 'utils.dart';

class AppFunctions {
  static bool isAndroid() {
    if (kIsWeb) {
      return false;
    } else if (Platform.isAndroid) {
      return true;
    } else {
      return false;
    }
  }

  static String? textValidator(String? text, String fieldName) {
    if (text == null || text.trim().isEmpty) {
      return 'Please, enter your $fieldName';
    }
    return null;
  }

  static String? emailValidator(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'Please, enter your email';
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email)) {
      return 'Please, enter a valid email';
    }
    return null;
  }

  static String? passwordValidator(String? password, bool isSignUp) {
    if (password == null || password.trim().isEmpty) {
      return 'Please, enter your password';
    } else if (isSignUp &&
        !RegExp(r'^(?=.*[a-zA-Z]).{8,}$').hasMatch(password)) {
      return 'Password should be strong';
    }
    return null;
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: isLight(context) ? null : AppColors.greyscale100,
          content: Text(
          message,
          style: AppTextStyles.workSansMain.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.error500,
          ),
        ),
      ),
    );
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
        backgroundColor: isLight(context) ? null : AppColors.greyscale100,
        content: Text(
          message,
          style: AppTextStyles.workSansMain.copyWith(
            fontWeight: FontWeight.w500,
            color:
                isLight(context) ? AppColors.greyscale100 : AppColors.green900,
          ),
        ),
      ),
    );
  }

  static String get getGreetingsText {
    final int now = DateTime.now().hour;
    if (now >= 5 && now < 12) {
      return 'goodMorning';
    } else if (now >= 12 && now <= 18) {
      return 'goodAfternoon';
    } else if (now > 18 || now < 4) {
      return 'goodEvening';
    } else {
      return 'greetings';
    }
  }

  static List<Book> getPast7DaysSummaries({required List<Book> books}) {
    final DateTime sevenDaysBackDate = DateTime.now().subtract(
      const Duration(days: 7),
    );

    final List<Book> result = [];

    for (var book in books) {
      if (book.summaryAddedDate.toDate().isAfter(sevenDaysBackDate)) {
        result.add(book);
      }
    }
    return result;
  }

  static showToast({
    required String message,
    required bool isSuccess,
    required BuildContext context,
  }) =>
      toastification.show(
        context: context,
        type: isSuccess ? ToastificationType.success : ToastificationType.error,
      autoCloseDuration: const Duration(seconds: 5),
      description: Text(message, style: AppTextStyles.workSansW500),
      icon: const Icon(Icons.error),
      closeButtonShowType: CloseButtonShowType.onHover,
    );

  static double get randomNumber =>
      -50 + Random().nextInt(50 - -50 + 1).toDouble();

  static double get randomDouble => (Random().nextDouble() * 2) - 1;

  static bool isLight(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light;

  static SummaryLanguage getLanguageEnum(String languageCode) {
    if (languageCode == 'uz') {
      return SummaryLanguage.uzbek;
    } else if (languageCode == 'ru') {
      return SummaryLanguage.russian;
    }
    return SummaryLanguage.english;
  }

  static int get getRandomColorForUserProfile {
    List<Color> colors = [
      const Color(0xFF4B96D7),
      const Color(0xFF54B238),
      const Color(0xFFDB8538),
      const Color(0xFFD2635C),
      const Color(0xFF9F6DDE),
      const Color(0xFFd7458c),
    ];
    return colors[Random().nextInt(6)].value;
  }

  static void shareSummary(Book book) {
    Share.share('''
${'book_name'.tr(args: [book.title])}
${'summary_language'.tr(args: [
          book.summaryLanguage.toUpperCase()
        ])}                  
${'author'.tr(args: [book.author])}
${book.audioUrl != 'null' ? 'listen_summary'.tr(args: [book.audioUrl]) : ''}
${'book_summary'.tr(args: [book.summary])}

${'made_by'.tr()}''');
  }
}
