import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qubeCommerce/core/shared_widgets/elevated_button_full_width.dart';
import 'package:qubeCommerce/core/utils/app_colors.dart';

class SpecialBookedCard extends StatefulWidget {
  final String image;
  final String productCategory;
  final String productName;
  final int? productNumber;
  final String svgPath1;
  final String? svgPath2;
  final String date;
  final Container? box;
  final double? height;
  final bool showButton;
  final int? numberOfPeople;
  final bool showNumberOfPeople;
  final LinearProgressIndicator? linearProgressIndicator;
  final bool? showCarouselSliderTwo;

  const SpecialBookedCard({
    super.key,
    required this.image,
    required this.productCategory,
    required this.productName,
    required this.svgPath1,
    required this.date,
    this.svgPath2,
    this.box,
    this.height = 312,
    this.showButton = true,
    this.numberOfPeople,
    this.productNumber,
    this.showNumberOfPeople = false,
    this.linearProgressIndicator,
    this.showCarouselSliderTwo = false,
  });

  @override
  _SpecialBookedCardState createState() => _SpecialBookedCardState();
}

class _SpecialBookedCardState extends State<SpecialBookedCard> {
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
            Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: CarouselSlider(
                    items: [
                      Column(
                        children: [
                          if (widget.box != null) widget.box!,
                          Image.asset(
                            widget.image,
                            height: 176,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              left: 8,
                              right: 8,
                              bottom: 1,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.greyColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        widget.productCategory,
                                        style: TextStyle(
                                          color: AppColors.greyTextColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      widget.productName,
                                      style: TextStyle(
                                        color: AppColors.greyTextDarkColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          widget.showNumberOfPeople
                                              ? '${widget.numberOfPeople ?? 0}'
                                              : '${widget.productNumber ?? 0} request',
                                          style: TextStyle(
                                            fontSize:
                                                widget.showCarouselSliderTwo!
                                                    ? 20
                                                    : 14,
                                            fontWeight: FontWeight.bold,
                                            color: widget.showNumberOfPeople
                                                ? AppColors.productTextBlueColor
                                                : AppColors
                                                    .productTextGreenColor,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        SvgPicture.asset(
                                          widget.svgPath1,
                                          width: widget.showCarouselSliderTwo!
                                              ? 19.5
                                              : 14.6,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          widget.date,
                                          style: TextStyle(
                                            color: AppColors.greyTextColor,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(width: 7),
                                        if (widget.svgPath2 != null)
                                          SvgPicture.asset(
                                            widget.svgPath2!,
                                            width: 15,
                                            colorFilter: ColorFilter.mode(
                                              AppColors.productSvg2Color,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          if (widget.linearProgressIndicator != null)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  width: 176,
                                  child: widget.linearProgressIndicator,
                                ),
                              ],
                            ),
                          const SizedBox(height: 16),
                          if (widget.showCarouselSliderTwo!)
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 126,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColors
                                              .backgroundProgressBackgroundLighGreen,
                                          AppColors
                                              .backgroundProgressBackgroundDarkGreen,
                                        ],
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Join Deal!',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Minimum to join:',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.greyTextDarkColor,
                                        ),
                                      ),
                                      Text(
                                        '1000 EGP',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              AppColors.productTextGreenColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          if (widget.showButton)
                            elevatedButtonFullWidth(
                              height: 42,
                              primaryColor: Colors.blue,
                              onpressed: () {},
                              title: 'View details',
                              loading: false,
                            ),
                        ],
                      ),
                    ],
                    options: CarouselOptions(
                      height: widget.height,
                      enlargeCenterPage: true,
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                      aspectRatio: 16 / 9,
                      viewportFraction: 1.0,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
