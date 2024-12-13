import 'package:flutter/material.dart';
import 'package:qubeCommerce/features/auth/presentation/login/view/login.dart';

import '../../../../../../core/utils/app_colors.dart';


class AlreadyHaveAccountBtn extends StatelessWidget {
  const AlreadyHaveAccountBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, LoginView.routeName);
      },
      child: Text(
        'هل لديك حساب؟سجل الدخول',
        textAlign: TextAlign.center,
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
