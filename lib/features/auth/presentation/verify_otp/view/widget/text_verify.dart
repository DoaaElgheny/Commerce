import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';

class TextVerify extends StatelessWidget {
  const TextVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Phone Verification',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
