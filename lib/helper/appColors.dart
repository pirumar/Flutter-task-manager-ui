import 'package:flutter/material.dart';

class AppColors {
  static final AppColors _singleton = AppColors._internal();

  factory AppColors() {
    return _singleton;
  }

  AppColors._internal();

  Color bgColor = Color(0xFFfefefe);
  Color blackColor = Color(0xFF000000);
  Color yellowColor = Color(0xFFfabb18);
  Color textColorDark = Color(0xFF525252);
  Color textColorLight = Color(0xFFb7b7b7);
  Color searchBgColor = Color(0xFFececec);
  Color profileBg= Color(0xFFf1f1f1);
}
