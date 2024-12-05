import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:qubeCommerce/core/utils/app_colors.dart';
import 'advertisement_widget.dart';

class AdvertisementListCard extends StatefulWidget {
  final List<AdvertisementCard> advertisementCard;
  final Function() onTap;

  const AdvertisementListCard({
    super.key,
    required this.advertisementCard,
    required this.onTap,
  });

  @override
  _AdvertisementListCardState createState() => _AdvertisementListCardState();
}

class _AdvertisementListCardState extends State<AdvertisementListCard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 300,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.85,
      ),
      itemCount: widget.advertisementCard.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: widget.onTap,
                child: AdvertisementCard(
                  discount: widget.advertisementCard[itemIndex].discount,
                  isDiscount: widget.advertisementCard[itemIndex].isDiscount,
                  title: widget.advertisementCard[itemIndex].title,
                  subTitle: widget.advertisementCard[itemIndex].subTitle,
                  image: widget.advertisementCard[itemIndex].image,
                  date: widget.advertisementCard[itemIndex].date,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.advertisementCard.map((url) {
                  int index = widget.advertisementCard.indexOf(url);
                  return Container(
                    width: 6,
                    height: 6,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(3)),
                      color: _currentIndex == index
                          ? AppColors.selectAdv
                          : AppColors.nonSelectAdv,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
