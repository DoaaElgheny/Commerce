import 'package:flutter/material.dart' as td;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../../core/utils/app_colors.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    required this.controller,
    required this.onComplete,
    super.key,
  });

  final TextEditingController controller;
  final ValueChanged<String> onComplete;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: td.TextDirection.ltr,
      child: PinCodeTextField(
        appContext: context,
        autoFocus: true,
        cursorColor: AppColors.black,
        textStyle: TextStyle(color: AppColors.primaryColor),
        keyboardType: TextInputType.number,
        length: 5,
        animationType: AnimationType.scale,
        controller: controller,
        inputFormatters: [
          // ignore spaces.
          FilteringTextInputFormatter.deny(RegExp(r'\s')),
          FilteringTextInputFormatter.digitsOnly,
        ],
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 52,
          borderWidth: 1.9,
          activeColor: AppColors.color14,
          inactiveColor: Colors.black12,
          inactiveFillColor: AppColors.white,
          activeFillColor: AppColors.white,
          selectedColor: AppColors.white,
          selectedFillColor: AppColors.spotColor.withOpacity(0.2),
        ),
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        onCompleted: onComplete,
        onChanged: (value) {},
      ),
    );
  }
}
