import 'package:flutter/material.dart';

import '../utils/app_strings.dart';

class AppTextMandatory extends StatelessWidget {
  final String? text;
  final FontWeight weight;
  final double fontSize;
  final Color color;

  const AppTextMandatory({
    super.key,
    required this.text,
    required this.weight,
    required this.fontSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontFamily: AppStrings.fontFamilySST,
          fontWeight: weight,
          fontSize: fontSize,
          color: color,
        ),
        children: const <TextSpan>[
          TextSpan(
            text: ' *',
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
