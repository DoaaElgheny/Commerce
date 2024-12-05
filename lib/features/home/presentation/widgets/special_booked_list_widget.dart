import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:qubeCommerce/features/home/presentation/pages/home_screen.dart';
import 'package:qubeCommerce/features/home/presentation/widgets/special_booked_widget.dart';

import '../pages/stay_details_screen.dart';

class SpecialBookedListCard extends StatefulWidget {
  final List<SpecialBookedCard> specialBookedCard;
  final double carouselHeight;

  const SpecialBookedListCard({
    super.key,
    required this.specialBookedCard,
    this.carouselHeight = 320,
  });

  @override
  _SpecialBookedListCardState createState() => _SpecialBookedListCardState();
}

class _SpecialBookedListCardState extends State<SpecialBookedListCard> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: widget.carouselHeight,
        // enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        onPageChanged: (index, reason) {
          setState(() {});
        },
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      itemCount: widget.specialBookedCard.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          child: SpecialBookedCard(
            image: widget.specialBookedCard[itemIndex].image,
            date: widget.specialBookedCard[itemIndex].date,
            productCategory:
                widget.specialBookedCard[itemIndex].productCategory,
            productName: widget.specialBookedCard[itemIndex].productName,
            productNumber: widget.specialBookedCard[itemIndex].productNumber,
            svgPath1: widget.specialBookedCard[itemIndex].svgPath1,
            svgPath2: widget.specialBookedCard[itemIndex].svgPath2,
            box: widget.specialBookedCard[itemIndex].box,
            height: widget.specialBookedCard[itemIndex].height,
            showButton: widget.specialBookedCard[itemIndex].showButton,
            numberOfPeople: widget.specialBookedCard[itemIndex].numberOfPeople,
            showNumberOfPeople: widget.specialBookedCard[itemIndex].showNumberOfPeople,
            linearProgressIndicator: widget.specialBookedCard[itemIndex].linearProgressIndicator,
            showCarouselSliderTwo: widget.specialBookedCard[itemIndex].showCarouselSliderTwo,
          ),
        );
      },
    );
  }
}