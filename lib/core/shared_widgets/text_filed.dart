import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';

class TextFiledCustom extends StatelessWidget {
  late Function(String val) onChanged;
  late Function()? onTab;
  late String? Function(dynamic t) validator;
  late TextEditingController controller;
  late TextInputType textInputType;
  late Color hintColor;
  late Color fillColor;
  late Color errorColorBorder;
  late String hintText;
  late String? labelText;
  late String? errorText;
  late bool isBorder;
  late bool isReadOnly;
  late bool isObscureText;
  late bool isFilled;
  late double vertical;
  late double horizontal;
  late double minHeightPrefixIcon;
  late double minWidthPrefixIcon;
  late double minHeightSuffixIcon;
  late double minWidthSuffixIcon;
  late Widget? suffixIcon;
  late Widget? prifixIcon;
  late Widget? prifix;
  late int? maxLength;
  late int? maxLines;
  late int? minLines;
  late double corner;
  late Color borderColor;

  TextFiledCustom({
    super.key,
    required this.onChanged,
    this.suffixIcon,
    this.prifixIcon,
    this.prifix,
    required this.validator,
    required this.controller,
    required this.textInputType,
    required this.hintColor,
    required this.fillColor,
    required this.errorColorBorder,
    required this.hintText,
    this.labelText,
    this.errorText,
    this.onTab,
    this.borderColor = Colors.black,
    this.isReadOnly = false,
    this.isObscureText = false,
    this.isBorder = true,
    this.isFilled = false,
    this.vertical = 15.0,
    this.horizontal = 10.0,
    this.minHeightPrefixIcon = 0.0,
    this.minWidthPrefixIcon = 0.0,
    this.minHeightSuffixIcon = 0.0,
    this.minWidthSuffixIcon = 0.0,
    this.maxLength = 225,
    this.maxLines = 1,
    this.minLines = 1,
    this.corner = 10,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: isObscureText,
        onChanged: onChanged,
        maxLines: maxLines,
        minLines: minLines,
        readOnly: isReadOnly,
        onTap: onTab,
        autofocus: false,
        controller: controller,
        keyboardType: textInputType,
        maxLength: maxLength,
        decoration: InputDecoration(
          // isDense: true,
          prefixIconConstraints: BoxConstraints(
            minHeight: minHeightPrefixIcon,
            minWidth: minWidthPrefixIcon,
          ),
          suffixIconConstraints: BoxConstraints(
            minHeight: minHeightSuffixIcon,
            minWidth: minWidthSuffixIcon,
          ),
          errorMaxLines: 2,
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
          fillColor: isFilled ? fillColor : null,
          filled: isFilled,

          //border: InputBorder.none,
          hintText: hintText,
          labelText: labelText,
          labelStyle: TextStyle(
              color: AppColors.gray,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: AppStrings.fontFamilySST),

          floatingLabelBehavior: FloatingLabelBehavior.auto, // Add this line
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(corner),
            borderSide: BorderSide(
              width: 1,
              color: //Colors.transparent
                  isBorder
                      ? AppColors.border.withOpacity(0.2)
                      : Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(corner),
            borderSide: BorderSide(
              width: 1,
              color: //Colors.transparent
                  isBorder ? borderColor : Colors.transparent,
            ),
          ),
          errorStyle: TextStyle(
              fontFamily: AppStrings.fontFamilySST,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: errorColorBorder),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(corner),
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
        ),
        validator: validator);
  }
}
