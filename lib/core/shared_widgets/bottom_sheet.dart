import 'package:flutter/material.dart';

import 'app_text.dart';

class BottomSheetWidget extends StatelessWidget {
  final VoidCallback? onPress;
  final IconData? iconData;
  final String? title;
  final Color? iconColor;
  final Color? titleColor;
  final Function()? onTap;
  const BottomSheetWidget({
    super.key,
    this.onPress,
    this.title,
    this.iconData,
    this.iconColor,
    this.titleColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // return _bottomNavigationItem({IconData? iconData, String? title}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            iconData,
            size: 25,
            color: iconColor,
          ),
          const SizedBox(
            width: 10,
          ),
          AppText(
            text: title,
            color: titleColor!,
            weight: FontWeight.w600,
            fontSize: 16,
            align: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
