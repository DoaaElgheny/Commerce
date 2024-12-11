import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';

class ResetPasswordText extends StatelessWidget {
  const ResetPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'إعادة تعيين كلمة المرور',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
