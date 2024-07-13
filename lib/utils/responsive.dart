import 'package:flutter/material.dart';

class Responsive {
  static double screenW(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenH(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
