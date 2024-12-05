import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qubeCommerce/core/utils/app_colors.dart';

import 'app_text.dart';

class elevatedButtonWithoutWidth extends StatelessWidget {
  double height;
  double width;
  Color primaryColor;
  Color textColor;
  Function() onpressed;
  String title;
  bool loading;
  bool jobDetalis;
  double fontSizeChange;
  double borderRadius;
  Widget icon;
  FontWeight fontWeight;

  elevatedButtonWithoutWidth(
      {super.key,
      required this.height,
      required this.width,
      required this.primaryColor,
      required this.onpressed,
      required this.title,
      required this.icon,
      this.jobDetalis = false,
      this.fontWeight = FontWeight.normal,
      this.fontSizeChange = 16,
      this.borderRadius = 10,
      this.textColor = Colors.white,
      required this.loading});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            AppColors.withdrawAddBalanceColorLeft,
            AppColors.primaryColor,
          ],
        ),
      ),
      height: height,
      width: width,
      child: ElevatedButton.icon(
        // icon: const SizedBox
        //     .shrink(),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.all(0),
        ),
        onPressed: loading ? null : onpressed,
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: title,
              color: textColor,
              weight: fontWeight,
              fontSize: fontSizeChange,
              align: TextAlign.start,
            ),
            const SizedBox(width: 4),
            icon,
          ],
        ),
      ),
    );
  }
}