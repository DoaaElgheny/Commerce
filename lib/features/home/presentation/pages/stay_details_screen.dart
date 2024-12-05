// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:qubeCommerce/core/utils/app_colors.dart';
// import 'package:shimmer/shimmer.dart';
// import '../../../../config/locale/app_localizations.dart';
// import '../../../../core/prefs/my_shared_prefs.dart';
// import '../../../../core/shared_widgets/app_text.dart';
// import '../../../../core/utils/app_strings.dart';
// import '../../../../core/utils/assets_manager.dart';
// import '../widgets/cotainer_calinder_details.dart';
// import '../widgets/expandable_text_widget.dart';
// import '../widgets/special_booked_widget.dart';

// class StayDetailsScreen extends StatefulWidget {
//   const StayDetailsScreen({super.key});

//   @override
//   State<StayDetailsScreen> createState() => _StayDetailsScreenState();
// }

// class _StayDetailsScreenState extends State<StayDetailsScreen> {
//   int _currentIndex = 0;
//   bool showMoreRooms = false;
//   bool showMoreFacilities = false;
//   SpecialBookedCard specialBookedCard = SpecialBookedCard(
//       image: 'assets/images_new/products/bag.jpg',
//                     productCategory: 'Bags & accessories',
//                     productName: 'Travel bag',
//                     productNumber: 31,
//                     svgPath1: 'assets/icons/overview_section/Bag 1.svg',
//                     svgPath2: 'assets/icons/overview_section/Calender 1.svg',
//                     date: '2024-10-10',
//   );
//   final List<Map<String, dynamic>> facilities = [
//     {'icon': Icons.kitchen, 'text': 'Kitchen utensils'},
//     {'icon': Icons.chair, 'text': 'Additional sitting'},
//     {'icon': Icons.house, 'text': 'Outdoor annex'},
//     {'icon': Icons.child_care, 'text': 'Playground'},
//     {'icon': Icons.local_parking, 'text': 'Outdoor sitting area'},
//   ];
//   final List<Map<String, dynamic>> spaceAndRooms = [
//     {
//       'icon': Icons.bed,
//       'text': '1 Bedrooms (1 Master Bed)',
//       'details': ['Master Bed', 'Wardrobe', 'Balcony Access'],
//     },
//     {
//       'icon': Icons.bathtub,
//       'text': 'Bathroom',
//       'details': ['Bathtub', 'Shower', 'Toiletries'],
//     },
//     {
//       'icon': Icons.chair,
//       'text': 'Sitting room',
//       'details': ['Sofa', 'Coffee Table', 'Television'],
//     },
//     {
//       'icon': Icons.chair,
//       'text': 'Sitting room',
//       'details': ['Sofa', 'Coffee Table', 'Television'],
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Column(
//         children: [
//           Stack(
//             children: <Widget>[
//               CarouselSlider.builder(
//                 itemCount: specialBookedCard.imgList.length,
//                 itemBuilder:
//                     (BuildContext context, int itemIndex, int pageViewIndex) {
//                   return CachedNetworkImage(
//                     imageUrl: specialBookedCard.imgList[itemIndex],
//                     height: 200,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                     placeholder: (context, url) => Shimmer.fromColors(
//                       baseColor: AppColors.BaseShimmerColor,
//                       highlightColor: AppColors.HighlightShimmerColor,
//                       enabled: true,
//                       child: Container(
//                         color: Colors.white,
//                       ),
//                     ),
//                     errorWidget: (context, url, error) =>
//                         const Icon(Icons.error),
//                   );
//                 },
//                 options: CarouselOptions(
//                   height: 300,
//                   enlargeCenterPage: true,
//                   autoPlay: true,
//                   aspectRatio: 16 / 9,
//                   onPageChanged: (index, reason) {
//                     setState(() {
//                       _currentIndex = index;
//                     });
//                   },
//                   autoPlayAnimationDuration: const Duration(milliseconds: 800),
//                   viewportFraction: 1.0,
//                 ),
//               ),
//               Positioned(
//                 left: SharedPrefController().languageCode ==
//                         AppStrings.englishCode
//                     ? 16
//                     : null,
//                 right: SharedPrefController().languageCode ==
//                         AppStrings.englishCode
//                     ? null
//                     : 16,
//                 bottom: 10,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(4),
//                     color: Colors.black54,
//                   ),
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
//                     child: AppText(
//                       text:
//                           '${_currentIndex + 1}/${specialBookedCard.imgList.length}',
//                       color: Colors.white,
//                       weight: FontWeight.w400,
//                       fontSize: 14,
//                       align: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 60,
//                 right: 10,
//                 left: 10,
//                 child: Row(
//                   children: [
//                     Container(
//                       height: 40,
//                       width: 40,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: const Padding(
//                         padding: EdgeInsets.all(4.0),
//                         child: Icon(
//                           Icons.keyboard_backspace,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                     const Spacer(),
//                     Container(
//                       height: 40,
//                       width: 40,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: specialBookedCard.isFavorite
//                             ? const Icon(
//                                 Icons.favorite,
//                                 color: Colors.red,
//                               )
//                             : const Icon(
//                                 Icons.favorite_border,
//                                 color: Colors.black,
//                               ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Container(
//                       height: 40,
//                       width: 40,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: const Padding(
//                         padding: EdgeInsets.all(4.0),
//                         child: Icon(
//                           Icons.share,
//                           color: Colors.black,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Positioned(
//                 bottom: 15,
//                 right: 0,
//                 left: 0,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: specialBookedCard.imgList.map((url) {
//                     int index = specialBookedCard.imgList.indexOf(url);
//                     return Container(
//                       width: 6,
//                       height: 6,
//                       margin: const EdgeInsets.symmetric(horizontal: 2.0),
//                       decoration: BoxDecoration(
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(3)),
//                         color: _currentIndex == index
//                             ? Colors.white
//                             : Colors.white.withOpacity(0.4),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ],
//           ),
//           Container(
//             color: AppColors.borderColor.withOpacity(0.2),
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AppText(
//                     text: 'Visit a traditional Asiri house traditional Asiri',
//                     color: AppColors.loginTitleColor,
//                     weight: FontWeight.w500,
//                     fontSize: 16,
//                     align: TextAlign.start,
//                     maxLine: 1,
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                           child: Row(
//                         children: [
//                           SvgPicture.asset(ImageAssets.location),
//                           const SizedBox(
//                             width: 4,
//                           ),
//                           AppText(
//                             text: 'Al Riyadh, Saudi Arabia',
//                             color: AppColors.subTitleCheckBox,
//                             weight: FontWeight.w400,
//                             fontSize: 12,
//                             align: TextAlign.start,
//                             maxLine: 1,
//                           ),
//                         ],
//                       )),
//                       Expanded(
//                           child: Row(
//                         children: [
//                           AppText(
//                             text: '⭐ ' '4.9',
//                             color: AppColors.subTitleCheckBox,
//                             weight: FontWeight.w400,
//                             fontSize: 12,
//                             align: TextAlign.start,
//                             maxLine: 1,
//                           ),
//                           AppText(
//                             text: '. 22 reviews',
//                             color: AppColors.subTitleCheckBox,
//                             weight: FontWeight.w400,
//                             fontSize: 12,
//                             align: TextAlign.start,
//                             maxLine: 1,
//                           ),
//                         ],
//                       ))
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 3,
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                           child: Row(
//                         children: [
//                           SvgPicture.asset(ImageAssets.user_group_simple),
//                           const SizedBox(
//                             width: 4,
//                           ),
//                           AppText(
//                             text: 'the place fits 10 guests',
//                             color: AppColors.subTitleCheckBox,
//                             weight: FontWeight.w400,
//                             fontSize: 12,
//                             align: TextAlign.start,
//                             maxLine: 1,
//                           ),
//                         ],
//                       )),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                         child: Row(
//                       children: [
//                         SvgPicture.asset(ImageAssets.check_in),
//                         const SizedBox(
//                           width: 4,
//                         ),
//                         AppText(
//                           text: AppLocalizations.of(context)!
//                               .translate('check_in')!,
//                           color: AppColors.loginTitleColor,
//                           weight: FontWeight.w500,
//                           fontSize: 14,
//                           align: TextAlign.start,
//                         ),
//                         const SizedBox(
//                           width: 4,
//                         ),
//                         AppText(
//                           text: '03:00 pm',
//                           color: AppColors.gray,
//                           weight: FontWeight.w400,
//                           fontSize: 14,
//                           align: TextAlign.start,
//                         ),
//                       ],
//                     )),
//                     Expanded(
//                         child: Row(
//                       children: [
//                         SvgPicture.asset(ImageAssets.check_out),
//                         const SizedBox(
//                           width: 4,
//                         ),
//                         AppText(
//                           text: AppLocalizations.of(context)!
//                               .translate('check_out')!,
//                           color: AppColors.loginTitleColor,
//                           weight: FontWeight.w500,
//                           fontSize: 14,
//                           align: TextAlign.start,
//                         ),
//                         const SizedBox(
//                           width: 4,
//                         ),
//                         AppText(
//                           text: '03:00 am',
//                           color: AppColors.gray,
//                           weight: FontWeight.w400,
//                           fontSize: 14,
//                           align: TextAlign.start,
//                         ),
//                       ],
//                     )),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 ContainerCalinderDetailsWidget(
//                   onTap: () {},
//                   icon: ImageAssets.calendar_lines_pen,
//                   title: 'Fri, 4/03 - Sun, 4/05',
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 ContainerCalinderDetailsWidget(
//                   onTap: () {},
//                   icon: ImageAssets.person,
//                   title:
//                       '1 ${AppLocalizations.of(context)!.translate('adults')!} 0 ${AppLocalizations.of(context)!.translate('children')!}',
//                 )
//               ],
//             ),
//           ),
//           Container(
//             color: AppColors.borderColor.withOpacity(0.2),
//             height: 10,
//           ),
//           ExpansionTile(
//             title: AppText(
//               text: AppLocalizations.of(context)!.translate('space_rooms')!,
//               color: AppColors.loginTitleColor,
//               weight: FontWeight.w500,
//               fontSize: 18,
//               align: TextAlign.start,
//             ),
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children:
//                     (showMoreRooms ? spaceAndRooms : spaceAndRooms.take(3))
//                         .map((room) {
//                   return ExpansionTile(
//                     leading: Icon(room['icon']),
//                     title: AppText(
//                       text: room['text'],
//                       color: AppColors.loginTitleColor,
//                       weight: FontWeight.w400,
//                       fontSize: 16,
//                       align: TextAlign.start,
//                     ),
//                     children: room['details'].map<Widget>((detail) {
//                       return ListTile(
//                         title: Row(
//                           children: [
//                             SvgPicture.asset(ImageAssets.circle_check),
//                             const SizedBox(
//                               width: 4,
//                             ),
//                             AppText(
//                               text: detail,
//                               color: AppColors.loginTitleColor,
//                               weight: FontWeight.w400,
//                               fontSize: 14,
//                               align: TextAlign.start,
//                             ),
//                           ],
//                         ),
//                       );
//                     }).toList(),
//                   );
//                 }).toList(),
//               ),
//               if (spaceAndRooms.length > 3)
//                 ListTile(
//                   title: AppText(
//                     text: showMoreRooms
//                         ? AppLocalizations.of(context)!.translate('show_less')!
//                         : AppLocalizations.of(context)!.translate('show_more')!,
//                     color: AppColors.loginTitleColor,
//                     weight: FontWeight.w500,
//                     fontSize: 14,
//                     align: TextAlign.start,
//                   ),
//                   leading: Icon(
//                     showMoreRooms ? Icons.expand_less : Icons.expand_more,
//                     color: AppColors.loginTitleColor,
//                   ),
//                   onTap: () {
//                     setState(() {
//                       showMoreRooms = !showMoreRooms;
//                     });
//                   },
//                 ),
//             ],
//           ),
//           Container(
//             color: AppColors.borderColor.withOpacity(0.2),
//             height: 10,
//           ),
//           ExpansionTile(
//             title: AppText(
//               text: AppLocalizations.of(context)!.translate('facilities')!,
//               color: AppColors.loginTitleColor,
//               weight: FontWeight.w500,
//               fontSize: 18,
//               align: TextAlign.start,
//             ),
//             children: [
//               Wrap(
//                 spacing: 8.0,
//                 runSpacing: 4.0,
//                 children: [
//                   for (var i = 0;
//                       i < (showMoreFacilities ? facilities.length : 3);
//                       i++)
//                     Chip(
//                       // color: AppColors.chipColor,
//                       backgroundColor: AppColors.chipColor,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(6),
//                           side: BorderSide(color: AppColors.dividrColor)),
//                       avatar: Icon(facilities[i]['icon']),
//                       label: AppText(
//                         text: facilities[i]['text'],
//                         color: AppColors.loginColoseColor,
//                         weight: FontWeight.w400,
//                         fontSize: 14,
//                         align: TextAlign.start,
//                       ),
//                     ),
//                 ],
//               ),
//               ListTile(
//                 title: AppText(
//                   text: showMoreFacilities
//                       ? AppLocalizations.of(context)!.translate('show_less')!
//                       : AppLocalizations.of(context)!.translate('show_more')!,
//                   color: AppColors.loginTitleColor,
//                   weight: FontWeight.w500,
//                   fontSize: 14,
//                   align: TextAlign.start,
//                 ),
//                 leading: Icon(
//                   showMoreFacilities ? Icons.expand_less : Icons.expand_more,
//                   color: AppColors.loginTitleColor,
//                 ),
//                 onTap: () {
//                   setState(() {
//                     showMoreFacilities = !showMoreFacilities;
//                   });
//                 },
//               ),
//             ],
//           ),
//           Container(
//             color: AppColors.borderColor.withOpacity(0.2),
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: ExpandableText(
//               title: AppLocalizations.of(context)!.translate('description')!,
//               text:
//                   'Blue Nature is a 5 star complemented with residence in a very strategic city center. This location offers amazing amenities and beautiful surroundings...',
//             ),
//           ),
//           Container(
//             color: AppColors.borderColor.withOpacity(0.2),
//             height: 10,
//           ),
//           AppText(
//             text: AppLocalizations.of(context)!.translate('stays_location')!,
//             color: AppColors.loginTitleColor,
//             weight: FontWeight.w500,
//             fontSize: 18,
//             align: TextAlign.start,
//           ),
//           const SizedBox(height: 10),
//           Container(
//             height: 200,
//             color: Colors.grey[300],
//             child: const Center(
//               child: Icon(Icons.map, size: 100, color: Colors.grey),
//             ),
//           ),
//           Container(
//             color: AppColors.borderColor.withOpacity(0.2),
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: ExpansionTile(
//               title: AppText(
//                 text:
//                     AppLocalizations.of(context)!.translate('stays_location')!,
//                 color: AppColors.loginTitleColor,
//                 weight: FontWeight.w500,
//                 fontSize: 18,
//                 align: TextAlign.start,
//               ),
//               children: const [
//                 ExpandableText(
//                   title: 'Booking & Cancellation Policy',
//                   text:
//                       'You can cancel or reschedule your booking free of charge before the date of 2024/9/14. This ensures that you have maximum flexibility in your travel plans...',
//                 ),
//                 ExpandableText(
//                   title: 'Booking Terms',
//                   text:
//                       'You can cancel or reschedule your booking free of charge before the date of 2024/9/14. Please refer to our full terms and conditions for more information...',
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }
