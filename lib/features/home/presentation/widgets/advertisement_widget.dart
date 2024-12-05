import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../core/prefs/my_shared_prefs.dart';
import '../../../../core/shared_widgets/app_text.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';

class AdvertisementCard extends StatefulWidget {
  final String discount;
  final String image;
  final String title;
  final String subTitle;
  final bool isDiscount;
  final String date;

  const AdvertisementCard({
    super.key,
    required this.discount,
    required this.image,
    required this.isDiscount,
    required this.title,
    required this.date,
    required this.subTitle,
  });

  @override
  _AdvertisementCardState createState() => _AdvertisementCardState();
}

class _AdvertisementCardState extends State<AdvertisementCard> {
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.loginColoseColor,
                  AppColors.linearGradient,
                ],
              ),
            ),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: widget.image,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: AppColors.BaseShimmerColor,
                    highlightColor: AppColors.HighlightShimmerColor,
                    enabled: true,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                widget.isDiscount
                    ? Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColors.dicountYellow,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(16),
                                topLeft: Radius.circular(6),
                                bottomLeft: Radius.circular(6)),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(ImageAssets.badge_percentage),
                              const SizedBox(
                                width: 2,
                              ),
                              AppText(
                                text:
                                    '${widget.discount}% ${AppLocalizations.of(context)!.translate('discount')!}',
                                color: AppColors.discount,
                                weight: FontWeight.w400,
                                fontSize: 12,
                                align: TextAlign.start,
                                maxLine: 1,
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
                Positioned(
                  left: SharedPrefController().languageCode ==
                          AppStrings.englishCode
                      ? 16
                      : null,
                  right: SharedPrefController().languageCode ==
                          AppStrings.englishCode
                      ? null
                      : 16,
                  bottom: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AppText(
                        text: widget.title,
                        color: Colors.white,
                        weight: FontWeight.w500,
                        fontSize: 16,
                        align: TextAlign.start,
                        maxLine: 1,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      AppText(
                        text: widget.date,
                        color: Colors.white.withOpacity(0.4),
                        weight: FontWeight.w400,
                        fontSize: 10,
                        align: TextAlign.start,
                        maxLine: 1,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      AppText(
                        text: widget.subTitle,
                        color: Colors.white,
                        weight: FontWeight.w400,
                        fontSize: 12,
                        align: TextAlign.start,
                        maxLine: 2,
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
