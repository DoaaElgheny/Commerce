import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../core/shared_widgets/app_text.dart';
import '../../../../core/utils/app_colors.dart';

class ContainerCalinderDetailsWidget extends StatelessWidget {
  String icon;
  String title;
  Function() onTap;

  ContainerCalinderDetailsWidget({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderColor)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(
              width: 10,
            ),
            AppText(
              text: title,
              color: AppColors.subTitleCheckBox,
              weight: FontWeight.w400,
              fontSize: 14,
              align: TextAlign.start,
            ),
            const Spacer(),
            InkWell(
              onTap: onTap,
              child: AppText(
                text: AppLocalizations.of(context)!.translate('edits')!,
                color: AppColors.subTitleCheckBox,
                weight: FontWeight.w400,
                fontSize: 14,
                align: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
