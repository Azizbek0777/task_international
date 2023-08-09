import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyle {
  const AppStyle._();

  static TextStyle weekDayName = const TextStyle(
    color: AppColors.grey,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle weekDayNameRed = const TextStyle(
    color: AppColors.red,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle calendarCountBlack = const TextStyle(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static TextStyle calendarCountWhite = const TextStyle(
    color: AppColors.white,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static TextStyle calendarCountRed = const TextStyle(
    color: AppColors.red,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}
