import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/prefs/my_shared_prefs.dart';
import '../../../../core/shared_widgets/app_text.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class SpecialBookedCardDetails extends StatefulWidget {
  final String type;
  final String typeImage;
  final Color typeColor;
  final List<String> imgList;
  final String title;
  final String subTitle;
  final String currency;
  final String price;
  final String date;
  final String rate;
  final bool isFavorite;

  const SpecialBookedCardDetails({
    super.key,
    required this.type,
    required this.typeImage,
    required this.typeColor,
    required this.imgList,
    required this.isFavorite,
    required this.title,
    required this.currency,
    required this.price,
    required this.date,
    required this.rate,
    required this.subTitle,
  });

  @override
  _SpecialBookedCardDetailsState createState() => _SpecialBookedCardDetailsState();
}

class _SpecialBookedCardDetailsState extends State<SpecialBookedCardDetails> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 1,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: CarouselSlider.builder(
                    itemCount: widget.imgList.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return CachedNetworkImage(
                        imageUrl: widget.imgList[itemIndex],
                        height: 200,
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
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      );
                    },
                    options: CarouselOptions(
                      height: 200,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 1.0,
                    ),
                  ),
                ),
                Positioned(
                  left: SharedPrefController().languageCode ==
                          AppStrings.englishCode
                      ? null
                      : 16,
                  right: SharedPrefController().languageCode ==
                          AppStrings.englishCode
                      ? 16
                      : null,
                  bottom: 10,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: widget.isFavorite
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                            ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      // color: AppColors.loginColoseColor,
                      color: widget.typeColor,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          topLeft: Radius.circular(6),
                          bottomLeft: Radius.circular(6)),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(widget.typeImage),
                        const SizedBox(
                          width: 2,
                        ),
                        AppText(
                          text: widget.type,
                          color: Colors.white,
                          weight: FontWeight.w400,
                          fontSize: 11,
                          align: TextAlign.start,
                          maxLine: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 0,
                  left: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.imgList.map((url) {
                      int index = widget.imgList.indexOf(url);
                      return Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(3)),
                          color: _currentIndex == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.4),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppText(
                    text: widget.title,
                    color: AppColors.loginTitleColor,
                    weight: FontWeight.w500,
                    fontSize: 14,
                    align: TextAlign.start,
                    maxLine: 1,
                  ),
                  const SizedBox(height: 10),
                  AppText(
                    text: widget.subTitle,
                    color: AppColors.gray,
                    weight: FontWeight.w400,
                    fontSize: 14,
                    align: TextAlign.start,
                    maxLine: 1,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          AppText(
                            text: widget.currency,
                            color: AppColors.loginTitleColor,
                            weight: FontWeight.w500,
                            fontSize: 14,
                            align: TextAlign.start,
                            maxLine: 1,
                          ),
                          AppText(
                            text: ' ${widget.price}',
                            color: AppColors.loginTitleColor,
                            weight: FontWeight.w500,
                            fontSize: 14,
                            align: TextAlign.start,
                            maxLine: 1,
                          ),
                          AppText(
                            text: ' . ${widget.date}',
                            color: AppColors.SubTitleHomeColor,
                            weight: FontWeight.w400,
                            fontSize: 12,
                            align: TextAlign.start,
                            maxLine: 1,
                          ),
                        ],
                      ),
                      AppText(
                        text: '⭐ ${widget.rate}',
                        color: AppColors.loginTitleColor,
                        weight: FontWeight.w700,
                        fontSize: 14,
                        align: TextAlign.start,
                        maxLine: 1,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
