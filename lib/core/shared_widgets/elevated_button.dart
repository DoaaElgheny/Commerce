import 'package:flutter/material.dart';

import 'app_text.dart';

class elevatedButton extends StatelessWidget {
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
  FontWeight fontWeight;

  elevatedButton(
      {required this.height,
      required this.primaryColor,
      required this.onpressed,
      required this.title,
      this.width = double.infinity,
      this.jobDetalis = false,
      this.fontWeight = FontWeight.w600,
      this.fontSizeChange = 17,
      this.borderRadius = 12,
      this.textColor = Colors.white,
      required this.loading});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton.icon(
        icon: loading
            ? jobDetalis
                ? const SizedBox.shrink()
                : SizedBox(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
            : SizedBox.shrink(),
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: primaryColor,
            //foregroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            padding:
                const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16)),
        onPressed: loading ? null : onpressed,
        label: AppText(
          text: title,
          color: textColor,
          weight: fontWeight,
          fontSize: fontSizeChange,
          align: TextAlign.start,
        ),
      ),
    );
  }
}
