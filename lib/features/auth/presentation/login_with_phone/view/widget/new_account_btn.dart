import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../register/view/register_view.dart';

class NewAccountBtn extends StatelessWidget {
  const NewAccountBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, RegisterView.routeName);
      },
      child: Text(
        'إنشاء حساب جديد',
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
