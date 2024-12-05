import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
     useMaterial3: false,
      primaryColor: AppColors.primaryColor,
      primaryColorLight: AppColors.primaryColor,
      hintColor: AppColors.hintColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: AppStrings.fontFamilySST,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.black, fontSize: 20)),
      textTheme: const TextTheme(
        titleSmall: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w400
        ),
        bodyMedium: TextStyle(
            height: 1.3,
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w300
        ),
      )
  );
}
