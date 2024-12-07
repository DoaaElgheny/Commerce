import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'app_colors.dart';

class ConfigLoading {
  static void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 3000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..maskType = EasyLoadingMaskType.black
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.white
      ..indicatorColor = AppColors.primaryColor
      ..textColor = Colors.yellow
      ..maskColor = AppColors.primaryColor
      ..userInteractions = false
      ..dismissOnTap = false;
  }
}
