import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qubeCommerce/core/utils/app_colors.dart';

import 'package:sizer/sizer.dart';

// import 'package:taharak_app/utilty/size_utility.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isEnabled;
  final bool isNumber;
  final bool isValidated;
  final String validationText;
  final Widget? prefix;
  final Color activeBorderColor;
  final Color textColor;
  final String textHint;
  final bool isMultiLine;
  final bool isPassword;
  final bool isDecorated;
  final Text? label;
  final bool? hasMargin;
  final Function(String val)? onTextChange;
  final int? maxLength;
  final Widget? suffix;
  final FocusNode? firstFocusNode;
  final bool isFocus;

  const AppTextField(
      {required this.textEditingController,
      this.isEnabled = true,
      this.isNumber = false,
      this.isFocus = false,
      required this.isValidated,
      required this.validationText,
      required this.textHint,
      this.prefix,
      this.activeBorderColor = AppColors.inputBackgroundColor,
      this.textColor = AppColors.blackColor,
      this.isMultiLine = false,
      this.isPassword = false,
      this.label,
      this.isDecorated = true,
      this.firstFocusNode,
      this.onTextChange,
      this.maxLength,
      this.hasMargin = true,
      this.suffix,

      ///isDecorated to show or hide the decoration of textField
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMultiLine ? 15.5.h : 11.h,
      margin: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Center(
              child: TextFormField(
                focusNode: firstFocusNode,
                obscureText: isPassword ? true : false,
                onChanged: onTextChange,
                controller: textEditingController,
                maxLines: isMultiLine ? 4 : 1,
                maxLength: maxLength,
                keyboardType:
                    isNumber ? TextInputType.number : TextInputType.text,
                enabled: isEnabled,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  label: label ?? Container(),
                  labelStyle: TextStyle(
                      color: AppColors.borderGrey,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      height: 1),
                  isCollapsed: true,
                  floatingLabelStyle: TextStyle(
                      color: hexToColor('#6D8EF0'),
                      fontWeight: FontWeight.w500),
                  fillColor: hexToColor('#F5F6FA'),
                  hintText: textHint,
                  suffixIcon: suffix,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                  hintStyle: TextStyle(
                      color: AppColors.borderGrey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      height: 1),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 0,
                    minHeight: 0,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  prefixStyle: const TextStyle(
                    color: AppColors.borderGrey,
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 10, top: 10, bottom: 10),
                    child: prefix,
                  ),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: isFocus
                            ? hexToColor('#6D8EF0')
                            : hexToColor('#F5F6FA'),
                      )),
                  //     errorText: errorText,
                  border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: hexToColor('#6D8EF0'),
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      )),
                  errorMaxLines: 2,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: hexToColor('#F5F6FA'),
                      )),
                  // errorStyle: TextStyle(fontSize: 8.sp),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: hexToColor('#6D8EF0'),
                      )),
                ),
              ),
            ),
          ),
          isValidated == false
              ? Expanded(
                  child: Text(
                    validationText,
                    style: TextStyle(color: Colors.red, fontSize: 9.sp),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
