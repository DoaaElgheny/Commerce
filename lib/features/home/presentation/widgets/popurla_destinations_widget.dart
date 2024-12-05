import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/prefs/my_shared_prefs.dart';
import '../../../../core/shared_widgets/app_text.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class PopurlarDestinationsWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final VoidCallback onPress;

  const PopurlarDestinationsWidget({
    super.key,
    required this.imageUrl,
    required this.onPress,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              width: 145,
              height: 145,
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: AppColors.BaseShimmerColor,
                highlightColor: AppColors.HighlightShimmerColor,
                enabled: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Container(
              width: 145,
              height: 145,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.3),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: SharedPrefController().languageCode == AppStrings.arabicCode
                  ? null
                  : 16,
              right:
                  SharedPrefController().languageCode == AppStrings.arabicCode
                      ? 16
                      : null,
              child: Column(
                crossAxisAlignment:
                    SharedPrefController().languageCode == AppStrings.arabicCode
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: title,
                    color: Colors.white,
                    weight: FontWeight.w700,
                    fontSize: 17,
                    align: TextAlign.start,
                    maxLine: 1,
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  AppText(
                    text: subTitle,
                    color: Colors.white,
                    weight: FontWeight.w400,
                    fontSize: 12,
                    align: TextAlign.start,
                    maxLine: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
