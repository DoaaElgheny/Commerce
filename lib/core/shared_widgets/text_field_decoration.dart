import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';

class TextFieldDecoration {
  static InputDecoration TextFieldDecorationGenerator({
    suffixIcon,
    prifixIcon,
    prifix,
    required hintColor,
    required fillColor,
    required errorColorBorder,
    required hintText,
    errorText,
    isBorder = true,
    isFilled = true,
    vertical = 13.0,
    horizontal = 10.0,
  }) {
    return InputDecoration(
      // isDense: true,
      errorText: errorText,
      counterText: '',
      prefix: prifix,
      suffixIcon: suffixIcon,
      prefixIcon: prifixIcon,
      hintStyle: TextStyle(
          color: hintColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: AppStrings.fontFamilySST),
      contentPadding:
          EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      // fillColor: isBorder ? fillColor : AppColors.HighlightShimmerColor,
      // filled: isFilled,

      //border: InputBorder.none,
      hintText: hintText,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 1,
          color: //Colors.transparent
              isBorder ? Colors.black.withOpacity(0.2) : Colors.transparent,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 1,
          color: //Colors.transparent
              isBorder ? AppColors.border.withOpacity(0.2) : Colors.transparent,
        ),
      ),
      errorStyle: TextStyle(
          fontFamily: AppStrings.fontFamilySST,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: errorColorBorder),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 1,
          color: errorColorBorder,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          width: 1,
          color: errorColorBorder,
        ),
      ),
    );
  }
}
