import 'package:flutter/material.dart';

extension SizedBoxExtension on int {
  Widget h() => SizedBox(height: toDouble());

  Widget w() => SizedBox(width: toDouble());
}

extension StringExtensions on String {
  String get clearJson {
    if (startsWith("```")) {
      return split("```")[1].substring(4);
    }
    return this;
  }
}