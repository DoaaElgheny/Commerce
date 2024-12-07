import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../forget_password/view/forget_password_view.dart';

class ForgetPasswordBtn extends StatelessWidget {
  const ForgetPasswordBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, ForgetPasswordView.routeName);
      },
      child: Text(
        'Forgot Your Password',
        textAlign: TextAlign.start,
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: AppColors.primaryColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }
}
