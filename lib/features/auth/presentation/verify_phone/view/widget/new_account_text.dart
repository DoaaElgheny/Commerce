import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';

class NewAccountText extends StatelessWidget {
  const NewAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Phone Number',
      style: TextStyle(
        color: AppColors.white,
        fontSize: 20,
      ),
    );
  }
}
