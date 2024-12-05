import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../utils/app_strings.dart';

class AppText extends StatelessWidget {
  final String? text;
  final FontWeight weight;
  final double fontSize;
  final Color color;
  final TextAlign align;
  final int maxLine;
  final bool isDetails;

  const AppText(
      {super.key,
      required this.text,
      required this.weight,
      required this.fontSize,
      required this.color,
      required this.align,
      this.isDetails = false,
      this.maxLine = 10});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
      style: TextStyle(
        fontFamily: AppStrings.fontFamilyGilroy,
        fontWeight: weight,
        fontSize: fontSize,
        color: color,
        wordSpacing: isDetails ? 4.0 : 1,
        height: isDetails ? 1.5 : null,
      ),
    );
  }
}
