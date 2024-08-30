import 'package:flutter/material.dart';

class Language {
  final Locale locale;
  final String language;
  final String flag;

  const Language({
    required this.locale,
    required this.language,
    required this.flag,
  });
}

const List<Language> languages = [
  Language(locale: Locale('uz'), language: 'uzbek', flag: '🇺🇿'),
  Language(locale: Locale('en'), language: 'english', flag: '🇺🇸'),
];
