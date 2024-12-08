import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';

class TextVerify extends StatelessWidget {
  const TextVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Phone Verification',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
