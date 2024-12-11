import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';

class WelcomeMes extends StatelessWidget {
  const WelcomeMes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.75,
          child: const Text(
            "مرحبًا، لنقم بتسجيل الدخول ونبدأ!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 13,
              height: 2,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
