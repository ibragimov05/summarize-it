import 'package:flutter/material.dart';

extension SizedBoxExtension on int {
  Widget h() => SizedBox(height: toDouble());

  Widget w() => SizedBox(width: toDouble());
}

extension StringExtension on String {
  String get clearJson {
    return replaceAll(RegExp(r'^```json|```$'), '').trim();
  }
}
