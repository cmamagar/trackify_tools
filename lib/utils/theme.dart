import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:trackify_tools/utils/colors.dart';


ThemeData basicTheme() {
  const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light);

  return ThemeData.light().copyWith(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backGroundColor,
      textTheme: getBasicTextTheme(),
      colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.primaryColor,
          surface: AppColors.backGroundColor,
          outline: AppColors.lGrey,
          onSurface: AppColors.lGrey,
          shadow: AppColors.shadowColor,
          error: AppColors.errorColor));
}

TextTheme getBasicTextTheme() {
  return ThemeData.light().textTheme.copyWith().apply(
      bodyColor: AppColors.textColor,
      displayColor: AppColors.textColor,
      decorationColor: AppColors.secondaryTextColor);
}

TextTheme getDarkTextTheme() {
  return ThemeData.light().textTheme.copyWith().apply(
      bodyColor: AppColors.backGroundColor,
      displayColor: AppColors.backGroundColor,
      decorationColor: AppColors.secondaryTextColor);
}

ThemeData darkTheme() {
  const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark);

  return ThemeData.light().copyWith(
      textTheme: getDarkTextTheme(),
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backGroundDark,
      colorScheme: const ColorScheme.dark().copyWith(
          primary: AppColors.primaryColor,
          surface: AppColors.backGroundDark,
          onSurface: AppColors.onBackGroundDark,
          outline: AppColors.lGrey,
          shadow: AppColors.shadowDark,
          error: AppColors.errorColor));
}
