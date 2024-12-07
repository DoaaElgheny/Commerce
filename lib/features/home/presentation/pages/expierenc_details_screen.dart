// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:qubeCommerce/core/utils/app_colors.dart';
// import 'package:sizer/sizer.dart';
// import '../../../../config/locale/app_localizations.dart';
// import '../../../../config/routes/app_routes.dart';
// import '../../../../core/prefs/my_shared_prefs.dart';
// import '../../../../core/shared_widgets/app_text.dart';
// import '../../../../core/shared_widgets/text_filed.dart';
// import '../../../../core/utils/app_strings.dart';
// import '../../../../core/utils/assets_manager.dart';
// import '../../domain/entities/popurlar_destinations_list.dart';
// import '../widgets/advertisement_list_widget.dart';
// import '../widgets/advertisement_widget.dart';
// import '../widgets/popurla_destinations_widget.dart';
// import '../widgets/special_booked_list_widget.dart';
// import '../widgets/special_booked_widget.dart';
// import '../widgets/special_categories_widget.dart';

// class ExpierencDetailsScreen extends StatefulWidget {
//   const ExpierencDetailsScreen({super.key});

//   @override
//   State<ExpierencDetailsScreen> createState() => _ExpierencDetailsScreenState();
// }

// class _ExpierencDetailsScreenState extends State<ExpierencDetailsScreen> {
//   TextEditingController searchControllerHome = TextEditingController();

//   List<PopurlarDestinations> popurlarDestinations = [
//     PopurlarDestinations(
//         image:
//             'https://vid.alarabiya.net/images/2021/07/24/67c8cb2b-20b1-4417-9dbe-888728515ee6/67c8cb2b-20b1-4417-9dbe-888728515ee6.jpeg?width=801&format=jpg',
//         title: 'AL Riyadh',
//         subTitle: '400 Stays'),
//     PopurlarDestinations(
//         image:
//             'https://vid.alarabiya.net/images/2021/07/24/05d6e180-87d2-4fd8-b906-ca66539d5246/05d6e180-87d2-4fd8-b906-ca66539d5246.jpg?width=801&format=jpg',
//         title: 'AL Riyadh',
//         subTitle: '400 Stays'),
//     PopurlarDestinations(
//         image:
//             'https://vid.alarabiya.net/images/2021/07/24/66633996-384c-47c6-b28c-f4e10a28214f/66633996-384c-47c6-b28c-f4e10a28214f_16x9_1200x676.jpg?width=801&format=jpg',
//         title: 'AL Riyadh',
//         subTitle: '400 Stays'),
//     PopurlarDestinations(
//         image:
//             'https://vid.alarabiya.net/images/2021/07/24/66633996-384c-47c6-b28c-f4e10a28214f/66633996-384c-47c6-b28c-f4e10a28214f_16x9_1200x676.jpg?width=801&format=jpg',
//         title: 'AL Riyadh',
//         subTitle: '400 Stays'),
//     PopurlarDestinations(
//         image:
//             'https://vid.alarabiya.net/images/2021/07/24/66633996-384c-47c6-b28c-f4e10a28214f/66633996-384c-47c6-b28c-f4e10a28214f_16x9_1200x676.jpg?width=801&format=jpg',
//         title: 'AL Riyadh',
//         subTitle: '400 Stays')
//   ];
//   List<PopurlarDestinations> specialCategorie = [
//     PopurlarDestinations(
//         image:
//             'https://vid.alarabiya.net/images/2021/07/24/67c8cb2b-20b1-4417-9dbe-888728515ee6/67c8cb2b-20b1-4417-9dbe-888728515ee6.jpeg?width=801&format=jpg',
//         title: 'AL Riyadh',
//         subTitle: '400 Stays'),
//     PopurlarDestinations(
//         image:
//             'https://vid.alarabiya.net/images/2021/07/24/05d6e180-87d2-4fd8-b906-ca66539d5246/05d6e180-87d2-4fd8-b906-ca66539d5246.jpg?width=801&format=jpg',
//         title: 'AL Riyadh',
//         subTitle: '400 Stays'),
//     PopurlarDestinations(
//         image:
//             'https://vid.alarabiya.net/images/2021/07/24/66633996-384c-47c6-b28c-f4e10a28214f/66633996-384c-47c6-b28c-f4e10a28214f_16x9_1200x676.jpg?width=801&format=jpg',
//         title: 'AL Riyadh',
//         subTitle: '400 Stays'),
//     PopurlarDestinations(
//         image:
//             'https://vid.alarabiya.net/images/2021/07/24/66633996-384c-47c6-b28c-f4e10a28214f/66633996-384c-47c6-b28c-f4e10a28214f_16x9_1200x676.jpg?width=801&format=jpg',
//         title: 'AL Riyadh',
//         subTitle: '400 Stays'),
//     PopurlarDestinations(
//         image:
//             'https://vid.alarabiya.net/images/2021/07/24/66633996-384c-47c6-b28c-f4e10a28214f/66633996-384c-47c6-b28c-f4e10a28214f_16x9_1200x676.jpg?width=801&format=jpg',
//         title: 'AL Riyadh',
//         subTitle: '400 Stays')
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//             child: SingleChildScrollView(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SvgPicture.asset(ImageAssets.logo_home),
//                 const SizedBox(
//                   width: 9,
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           AppText(
//                             text: AppLocalizations.of(context)!
//                                 .translate('hello')!,
//                             color: AppColors.loginTitleColor,
//                             weight: FontWeight.w400,
//                             fontSize: 14,
//                             align: TextAlign.start,
//                           ),
//                           const SizedBox(
//                             width: 2,
//                           ),
//                           AppText(
//                             text: 'Ahmed ',
//                             color: AppColors.loginTitleColor,
//                             weight: FontWeight.w700,
//                             fontSize: 14,
//                             align: TextAlign.start,
//                             maxLine: 1,
//                           ),
//                         ],
//                       ),
//                       AppText(
//                         text: AppLocalizations.of(context)!
//                             .translate('let_adventures_begin')!,
//                         color: AppColors.SubTitleHomeColor,
//                         weight: FontWeight.w400,
//                         fontSize: 14,
//                         align: TextAlign.start,
//                       ),
//                     ],
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     // Constants.showHomeDialog(
//                     //     context: context, msg: 'msg');
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(
//                           color: AppColors.containerNotificationHomeColor,
//                           width: 2),
//                       // boxShadow: [
//                       //   BoxShadow(
//                       //     color: AppColors.containerNotificationHomeColor,
//                       //     blurRadius: 10,
//                       //   ),
//                       // ],
//                     ),
//                     padding: const EdgeInsets.all(8),
//                     child: SvgPicture.asset(
//                       ImageAssets.notification,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               SizedBox(
//                 height: 100,
//                 width: double.infinity,
//                 child: Image.network(
//                   'https://vid.alarabiya.net/images/2021/07/24/66633996-384c-47c6-b28c-f4e10a28214f/66633996-384c-47c6-b28c-f4e10a28214f_16x9_1200x676.jpg?width=801&format=jpg',
//                   width: double.infinity,
//                   height: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: TextFiledCustom(
//                   isReadOnly: true,
//                   onTab: () {
//                      Navigator.pushNamed(context, Routes.exploreScreen);
//                   },
//                   onChanged: (val) {},
//                   isBorder: false,
//                   isFilled: true,
//                   vertical: 8,
//                   prifixIcon: Padding(
//                       padding:
//                           const EdgeInsetsDirectional.only(start: 16.0, end: 8),
//                       child: SvgPicture.asset(ImageAssets.search_explor)),
//                   validator: (v) {},
//                   textInputType: TextInputType.text,
//                   hintColor: AppColors.hintColor,
//                   fillColor: Colors.white,
//                   errorColorBorder: Colors.red,
//                   hintText: AppLocalizations.of(context)!
//                       .translate('search_position')!,
//                   controller: searchControllerHome,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//           AdvertisementListCard(advertisementCard: [
//             AdvertisementCard(
//               discount: '50',
//               isDiscount: true,
//               title: 'Visit a traditional Asiri house',
//               subTitle: 'Blue Nature is a 5 star complemented with 80 well',
//               date: '24 Jul 2024',
//               image: 'https://s3-alpha-sig.figma.com/img/a62a/5c82/14b1b9f081ed9b4adec92ccd84d5a64a?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=R~YOWTfydpUYPQqk3QgL5lwHYT2swlH~MOQcMOsfIjJEo0sYZVJ1LLf32G-M9ZufnfGZwUHIrt1D1OXRgOA3QrK2~VZxznVudwKw3-fQFJppGySJsoy3qHbpqSgU1g12aYxbanRJeiAEwq9VbaRoVXP-6GBqWtWloEUZKwzr27TYcBWfDEu4DklMDWoOHNiyPxAymlf2xByyVT8KM3uRMHkidF0ZgcOoejQgzNcK9td~C2d~XfTpRGelnX4tB93gy7x-9bL29wcHuS~LLu5mHx-jAE4BEobPFqit7EgSxx4uOtOZN~-t76Wb6OJl93uOiFtkGlJH9wxyd9ipPnPXaA__'
//             ),
//             AdvertisementCard(
//               discount: '50',
//               isDiscount: true,
//               title: 'Visit a traditional Asiri house',
//               subTitle: 'Blue Nature is a 5 star complemented with 80 well',
//               date: '24 Jul 2024',
//                 image: 'https://s3-alpha-sig.figma.com/img/a62a/5c82/14b1b9f081ed9b4adec92ccd84d5a64a?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=R~YOWTfydpUYPQqk3QgL5lwHYT2swlH~MOQcMOsfIjJEo0sYZVJ1LLf32G-M9ZufnfGZwUHIrt1D1OXRgOA3QrK2~VZxznVudwKw3-fQFJppGySJsoy3qHbpqSgU1g12aYxbanRJeiAEwq9VbaRoVXP-6GBqWtWloEUZKwzr27TYcBWfDEu4DklMDWoOHNiyPxAymlf2xByyVT8KM3uRMHkidF0ZgcOoejQgzNcK9td~C2d~XfTpRGelnX4tB93gy7x-9bL29wcHuS~LLu5mHx-jAE4BEobPFqit7EgSxx4uOtOZN~-t76Wb6OJl93uOiFtkGlJH9wxyd9ipPnPXaA__'
//             ),
//             AdvertisementCard(
//               discount: '50',
//               isDiscount: true,
//               title: 'Visit a traditional Asiri house',
//               subTitle: 'Blue Nature is a 5 star complemented with 80 well',
//               date: '24 Jul 2024',
//                 image: 'https://s3-alpha-sig.figma.com/img/a62a/5c82/14b1b9f081ed9b4adec92ccd84d5a64a?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=R~YOWTfydpUYPQqk3QgL5lwHYT2swlH~MOQcMOsfIjJEo0sYZVJ1LLf32G-M9ZufnfGZwUHIrt1D1OXRgOA3QrK2~VZxznVudwKw3-fQFJppGySJsoy3qHbpqSgU1g12aYxbanRJeiAEwq9VbaRoVXP-6GBqWtWloEUZKwzr27TYcBWfDEu4DklMDWoOHNiyPxAymlf2xByyVT8KM3uRMHkidF0ZgcOoejQgzNcK9td~C2d~XfTpRGelnX4tB93gy7x-9bL29wcHuS~LLu5mHx-jAE4BEobPFqit7EgSxx4uOtOZN~-t76Wb6OJl93uOiFtkGlJH9wxyd9ipPnPXaA__'
//             ),
//             AdvertisementCard(
//               discount: '50',
//               isDiscount: true,
//               title: 'Visit a traditional Asiri house',
//               subTitle: 'Blue Nature is a 5 star complemented with 80 well',
//               date: '24 Jul 2024',
//                 image: 'https://s3-alpha-sig.figma.com/img/a62a/5c82/14b1b9f081ed9b4adec92ccd84d5a64a?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=R~YOWTfydpUYPQqk3QgL5lwHYT2swlH~MOQcMOsfIjJEo0sYZVJ1LLf32G-M9ZufnfGZwUHIrt1D1OXRgOA3QrK2~VZxznVudwKw3-fQFJppGySJsoy3qHbpqSgU1g12aYxbanRJeiAEwq9VbaRoVXP-6GBqWtWloEUZKwzr27TYcBWfDEu4DklMDWoOHNiyPxAymlf2xByyVT8KM3uRMHkidF0ZgcOoejQgzNcK9td~C2d~XfTpRGelnX4tB93gy7x-9bL29wcHuS~LLu5mHx-jAE4BEobPFqit7EgSxx4uOtOZN~-t76Wb6OJl93uOiFtkGlJH9wxyd9ipPnPXaA__'
//             ),
//           ], onTap: () {  },),

//           // SizedBox(
//           //   height: 2.h,
//           // ),
//           Padding(
//             padding: const EdgeInsets.only(
//               right: 16,
//               left: 16,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 AppText(
//                   text: AppLocalizations.of(context)!
//                       .translate('popurlar_destinations')!,
//                   color: AppColors.loginTitleColor,
//                   weight: FontWeight.w500,
//                   fontSize: 16,
//                   align: TextAlign.start,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     // Navigator.pushNamed(context, Routes.searchScreen);
//                   },
//                   child: Row(
//                     children: [
//                       AppText(
//                         text: AppLocalizations.of(context)!
//                             .translate('view_all')!,
//                         color: AppColors.loginTitleColor,
//                         weight: FontWeight.w400,
//                         fontSize: 12,
//                         align: TextAlign.start,
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       SvgPicture.asset(ImageAssets.arrow_right)
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//           Padding(
//               padding: EdgeInsets.only(
//                   right: SharedPrefController().languageCode ==
//                           AppStrings.englishCode
//                       ? 0
//                       : 16,
//                   left: SharedPrefController().languageCode ==
//                           AppStrings.arabicCode
//                       ? 0
//                       : 16),
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.max,
//                     children:
//                         List.generate(popurlarDestinations!.length, (index) {
//                       return Padding(
//                         padding: EdgeInsets.only(
//                             right: SharedPrefController().languageCode ==
//                                     AppStrings.englishCode
//                                 ? 12
//                                 : 0,
//                             left: SharedPrefController().languageCode ==
//                                     AppStrings.arabicCode
//                                 ? 12
//                                 : 0),
//                         child: PopurlarDestinationsWidget(
//                           onPress: () async {},
//                           imageUrl: popurlarDestinations[index].image,
//                           title: popurlarDestinations[index].title,
//                           subTitle: popurlarDestinations[index].subTitle,
//                         ),
//                       );
//                     })),
//               )
//               // BlocConsumer<JobsCubit, JobsState>(
//               //   listener: (context, state) {},
//               //   builder: (context, state) {
//               //     if (state.classificationList!.isEmpty) {
//               //       homeCubit.getClassificationList();
//               //     }
//               //     if (state.classificationList != null &&
//               //         state.classificationList!.isNotEmpty) {
//               //       return SingleChildScrollView(
//               //         scrollDirection: Axis.horizontal,
//               //         child: Row(
//               //             mainAxisAlignment: MainAxisAlignment.start,
//               //             mainAxisSize: MainAxisSize.max,
//               //             children: List.generate(
//               //                 state.classificationList!.length, (index) {
//               //               Color containerColor =
//               //               AppColors.containerSpecializationColors[
//               //               index %
//               //                   AppColors
//               //                       .containerSpecializationColors
//               //                       .length];
//               //               return Padding(
//               //                 padding: EdgeInsets.only(
//               //                     right: SharedPrefController()
//               //                         .languageCode ==
//               //                         AppStrings.englishCode
//               //                         ? 12
//               //                         : 0,
//               //                     left: SharedPrefController()
//               //                         .languageCode ==
//               //                         AppStrings.arabicCode
//               //                         ? 12
//               //                         : 0),
//               //                 child: SpecializationWidget(
//               //                   onPress: () async {
//               //                     await dropListCubit.setSelectedCategory(
//               //                         category: Category(
//               //                             id: state
//               //                                 .classificationList![index]
//               //                                 .id,
//               //                             name: state
//               //                                 .classificationList![index]
//               //                                 .name,
//               //                             attachementFileStorageURL: state
//               //                                 .classificationList![index]
//               //                                 .attachementFileStorageURL,
//               //                             opportunityNo: state
//               //                                 .classificationList![index]
//               //                                 .opportunityNo));
//               //                     Navigator.push(
//               //                       context,
//               //                       MaterialPageRoute(
//               //                           builder: (context) =>
//               //                               SearchScreen(
//               //                                 categoryId: state
//               //                                     .classificationList![
//               //                                 index]
//               //                                     .id ??
//               //                                     -1,
//               //                               )),
//               //                     );
//               //                   },
//               //                   image: state.classificationList![index]
//               //                       .attachementFileStorageURL!,
//               //                   title: state
//               //                       .classificationList![index].name!,
//               //                   colorContainer: containerColor,
//               //                   opportunityNo: state
//               //                       .classificationList![index]
//               //                       .opportunityNo
//               //                       .toString(),
//               //                 ),
//               //               );
//               //             })),
//               //       );
//               //     } else {
//               //       return Shimmer.fromColors(
//               //         baseColor: AppColors.BaseShimmerColor,
//               //         highlightColor: AppColors.HighlightShimmerColor,
//               //         enabled: true,
//               //         child: SingleChildScrollView(
//               //           scrollDirection: Axis.horizontal,
//               //           child: Row(
//               //               mainAxisAlignment: MainAxisAlignment.start,
//               //               mainAxisSize: MainAxisSize.max,
//               //               children: List.generate(4, (index) {
//               //                 Color containerColor = AppColors
//               //                     .containerSpecializationColors[
//               //                 index %
//               //                     AppColors
//               //                         .containerSpecializationColors
//               //                         .length];
//               //                 return Padding(
//               //                   padding: EdgeInsets.only(
//               //                       right: SharedPrefController()
//               //                           .languageCode ==
//               //                           AppStrings.englishCode
//               //                           ? 12
//               //                           : 0,
//               //                       left: SharedPrefController()
//               //                           .languageCode ==
//               //                           AppStrings.arabicCode
//               //                           ? 12
//               //                           : 0),
//               //                   child: Container(
//               //                     width: 27.w,
//               //                     height: 14.h,
//               //                     padding: EdgeInsets.all(8),
//               //                     decoration: BoxDecoration(
//               //                       borderRadius:
//               //                       BorderRadius.circular(10),
//               //                       color: containerColor,
//               //                     ),
//               //                   ),
//               //                 );
//               //               })),
//               //         ),
//               //       );
//               //     }
//               //   },
//               // ),
//               ),
//           const SizedBox(
//             height: 24,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               right: 16,
//               left: 16,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 AppText(
//                   text: AppLocalizations.of(context)!
//                       .translate('special_categories')!,
//                   color: AppColors.loginTitleColor,
//                   weight: FontWeight.w500,
//                   fontSize: 16,
//                   align: TextAlign.start,
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//           Padding(
//               padding: EdgeInsets.only(
//                   right: SharedPrefController().languageCode ==
//                           AppStrings.englishCode
//                       ? 0
//                       : 16,
//                   left: SharedPrefController().languageCode ==
//                           AppStrings.arabicCode
//                       ? 0
//                       : 16),
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.max,
//                     children:
//                         List.generate(popurlarDestinations!.length, (index) {
//                       return Padding(
//                         padding: EdgeInsets.only(
//                             right: SharedPrefController().languageCode ==
//                                     AppStrings.englishCode
//                                 ? 12
//                                 : 0,
//                             left: SharedPrefController().languageCode ==
//                                     AppStrings.arabicCode
//                                 ? 12
//                                 : 0),
//                         child: SpecialCategoriesWidget(
//                           onPress: () async {},
//                           imageUrl: popurlarDestinations[index].image,
//                         ),
//                       );
//                     })),
//               )),
//           const SizedBox(
//             height: 24,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               right: 16,
//               left: 16,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 AppText(
//                   text: AppLocalizations.of(context)!
//                       .translate('special_booked')!,
//                   color: AppColors.loginTitleColor,
//                   weight: FontWeight.w500,
//                   fontSize: 16,
//                   align: TextAlign.start,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     // Navigator.pushNamed(context, Routes.searchScreen);
//                   },
//                   child: Row(
//                     children: [
//                       AppText(
//                         text: AppLocalizations.of(context)!
//                             .translate('view_all')!,
//                         color: AppColors.loginTitleColor,
//                         weight: FontWeight.w400,
//                         fontSize: 12,
//                         align: TextAlign.start,
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       SvgPicture.asset(ImageAssets.arrow_right)
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//           SpecialBookedListCard(specialBookedCard: [
//             SpecialBookedCard(
//               type: 'Experience',
//               isFavorite: true,
//               title: 'Visit a traditional Asiri house',
//               subTitle: 'Al Riyadh, Saudi Arabia',
//               currency: 'SR',
//               price: '1,500',
//               date: '24-29 Jul',
//               rate: '5.0',
//               imgList: const [
//                 'https://s3-alpha-sig.figma.com/img/2730/5f24/821cb946e3048faa69e740c55b8f5aaf?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=diZUnPz73UJZyy9kCtxSuyKu14P7YdcuiPQhXmFo2fNxZTeQwjOUTaW-dyeyF30RDR8-I34wtC4qb99xFvcfXvmn0pi5vHLfqx2ssMgFPhTUyFF0ljOrFfC2fzu5RQdgz6-fq5ymBNTASHcynaae7-~yB~48KcPcov8SiIxGKGgwUiAMsGM07tddFhD-E-LPQOwkTtKxEbIThu9GD32oIvnPsc5afCo86P1xhF1qSb3f7gCZjxuDc8eb5fc8CrbzB17XfhZSEIwF25PRTYahsuz3QdiAuX6TsyYRkZhfUNlD9zEJARIY36YzVRmbLSF48qr6ZZEhdUTzOdhxMaLCBA__',
//                 'https://s3-alpha-sig.figma.com/img/d8e0/374e/81fb202170921f2d52d4d1ef983cac7d?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cqam45brUvgmQbPpnphSil3fjw6dOQyXkoDg53oHL4B-ot5PohU44UuiM8sgPAHarcTuuBp5eSQpgcoIlItr9itYzyd8dC~ifXTe0lP3pupMDEyb7-ig8Qm57FUukYOXX2YBEL6JD7qbrcgJAKY-0~m~HyYC33mvT9pB9S4IYdt1rK8NvrW6jLQR8VfiM6HfwQW5PXtARzca9F2i53IMEuQ8QkvqYgQ-CwLZidVIbGZZm-ZNa96VFKcY9a5Pv~b9MYx5WTOZCCAHlwzeip8d9eswlfaX1TGhV6vzmwnb0N26nfC~zWQv-cit2j8bcSg2Y1RxuexgvTQYYLGi-QlVNA__',
//                 'https://s3-alpha-sig.figma.com/img/215b/be31/d48ee9df771168582f050e5ec70c9a8f?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=k17QgKT2f4AXcizTE3Fo2Yxh1F30148ttonS9b0a8PvTdO7BrnZ9-W5pNRnTWyxkcGE9BkiFqBZagW6OAxDtXZYUOqijpIbfa~3B-hpCGr556t4o0~e1DzQ8D7D1GuFweIfRtyMS8ua~wYrXvdCtYH6C8cLi2CLThZHpyxgXeDeul466~bxT8RoyPO0T0yPpEz3c1zye6d16ARUwuLBC6B9ooavlHAmVmCQJwewIzlKsQL4Uov2Jnn6UhrjbWQe2OLbBaGALOX1krCUXrtdA8v2kfrWwNiH0zoZPGuahv70dVRJ5f4u2pbAhPLReaCsIH~DMaz7sN-LoLEJS5~WbVg__'
//               ], typeImage: ImageAssets.home_location, typeColor: AppColors.loginColoseColor,
//             ),
//             SpecialBookedCard(
//               type: 'Experience',
//               isFavorite: false,
//               title: 'Visit a traditional Asiri house',
//               subTitle: 'Al Riyadh, Saudi Arabia',
//               currency: 'SR',
//               price: '1,500',
//               date: '24-29 Jul',
//               rate: '5.0',
//               imgList: const [
//                 'https://s3-alpha-sig.figma.com/img/2730/5f24/821cb946e3048faa69e740c55b8f5aaf?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=diZUnPz73UJZyy9kCtxSuyKu14P7YdcuiPQhXmFo2fNxZTeQwjOUTaW-dyeyF30RDR8-I34wtC4qb99xFvcfXvmn0pi5vHLfqx2ssMgFPhTUyFF0ljOrFfC2fzu5RQdgz6-fq5ymBNTASHcynaae7-~yB~48KcPcov8SiIxGKGgwUiAMsGM07tddFhD-E-LPQOwkTtKxEbIThu9GD32oIvnPsc5afCo86P1xhF1qSb3f7gCZjxuDc8eb5fc8CrbzB17XfhZSEIwF25PRTYahsuz3QdiAuX6TsyYRkZhfUNlD9zEJARIY36YzVRmbLSF48qr6ZZEhdUTzOdhxMaLCBA__',
//                 'https://s3-alpha-sig.figma.com/img/d8e0/374e/81fb202170921f2d52d4d1ef983cac7d?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cqam45brUvgmQbPpnphSil3fjw6dOQyXkoDg53oHL4B-ot5PohU44UuiM8sgPAHarcTuuBp5eSQpgcoIlItr9itYzyd8dC~ifXTe0lP3pupMDEyb7-ig8Qm57FUukYOXX2YBEL6JD7qbrcgJAKY-0~m~HyYC33mvT9pB9S4IYdt1rK8NvrW6jLQR8VfiM6HfwQW5PXtARzca9F2i53IMEuQ8QkvqYgQ-CwLZidVIbGZZm-ZNa96VFKcY9a5Pv~b9MYx5WTOZCCAHlwzeip8d9eswlfaX1TGhV6vzmwnb0N26nfC~zWQv-cit2j8bcSg2Y1RxuexgvTQYYLGi-QlVNA__',
//                 'https://s3-alpha-sig.figma.com/img/215b/be31/d48ee9df771168582f050e5ec70c9a8f?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=k17QgKT2f4AXcizTE3Fo2Yxh1F30148ttonS9b0a8PvTdO7BrnZ9-W5pNRnTWyxkcGE9BkiFqBZagW6OAxDtXZYUOqijpIbfa~3B-hpCGr556t4o0~e1DzQ8D7D1GuFweIfRtyMS8ua~wYrXvdCtYH6C8cLi2CLThZHpyxgXeDeul466~bxT8RoyPO0T0yPpEz3c1zye6d16ARUwuLBC6B9ooavlHAmVmCQJwewIzlKsQL4Uov2Jnn6UhrjbWQe2OLbBaGALOX1krCUXrtdA8v2kfrWwNiH0zoZPGuahv70dVRJ5f4u2pbAhPLReaCsIH~DMaz7sN-LoLEJS5~WbVg__'
//               ],typeImage: ImageAssets.home_location, typeColor: AppColors.loginColoseColor,
//             ),
//             SpecialBookedCard(
//               type: 'Experience',
//               isFavorite: true,
//               title: 'Visit a traditional Asiri house',
//               subTitle: 'Al Riyadh, Saudi Arabia',
//               currency: 'SR',
//               price: '1,500',
//               date: '24-29 Jul',
//               rate: '5.0',
//               imgList: const [
//                 'https://s3-alpha-sig.figma.com/img/2730/5f24/821cb946e3048faa69e740c55b8f5aaf?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=diZUnPz73UJZyy9kCtxSuyKu14P7YdcuiPQhXmFo2fNxZTeQwjOUTaW-dyeyF30RDR8-I34wtC4qb99xFvcfXvmn0pi5vHLfqx2ssMgFPhTUyFF0ljOrFfC2fzu5RQdgz6-fq5ymBNTASHcynaae7-~yB~48KcPcov8SiIxGKGgwUiAMsGM07tddFhD-E-LPQOwkTtKxEbIThu9GD32oIvnPsc5afCo86P1xhF1qSb3f7gCZjxuDc8eb5fc8CrbzB17XfhZSEIwF25PRTYahsuz3QdiAuX6TsyYRkZhfUNlD9zEJARIY36YzVRmbLSF48qr6ZZEhdUTzOdhxMaLCBA__',
//                 'https://s3-alpha-sig.figma.com/img/d8e0/374e/81fb202170921f2d52d4d1ef983cac7d?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cqam45brUvgmQbPpnphSil3fjw6dOQyXkoDg53oHL4B-ot5PohU44UuiM8sgPAHarcTuuBp5eSQpgcoIlItr9itYzyd8dC~ifXTe0lP3pupMDEyb7-ig8Qm57FUukYOXX2YBEL6JD7qbrcgJAKY-0~m~HyYC33mvT9pB9S4IYdt1rK8NvrW6jLQR8VfiM6HfwQW5PXtARzca9F2i53IMEuQ8QkvqYgQ-CwLZidVIbGZZm-ZNa96VFKcY9a5Pv~b9MYx5WTOZCCAHlwzeip8d9eswlfaX1TGhV6vzmwnb0N26nfC~zWQv-cit2j8bcSg2Y1RxuexgvTQYYLGi-QlVNA__',
//                 'https://s3-alpha-sig.figma.com/img/215b/be31/d48ee9df771168582f050e5ec70c9a8f?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=k17QgKT2f4AXcizTE3Fo2Yxh1F30148ttonS9b0a8PvTdO7BrnZ9-W5pNRnTWyxkcGE9BkiFqBZagW6OAxDtXZYUOqijpIbfa~3B-hpCGr556t4o0~e1DzQ8D7D1GuFweIfRtyMS8ua~wYrXvdCtYH6C8cLi2CLThZHpyxgXeDeul466~bxT8RoyPO0T0yPpEz3c1zye6d16ARUwuLBC6B9ooavlHAmVmCQJwewIzlKsQL4Uov2Jnn6UhrjbWQe2OLbBaGALOX1krCUXrtdA8v2kfrWwNiH0zoZPGuahv70dVRJ5f4u2pbAhPLReaCsIH~DMaz7sN-LoLEJS5~WbVg__'
//               ],typeImage: ImageAssets.home_location, typeColor: AppColors.loginColoseColor,
//             ),
//             SpecialBookedCard(
//               type: 'Experience',
//               isFavorite: false,
//               title: 'Visit a traditional Asiri house',
//               subTitle: 'Al Riyadh, Saudi Arabia',
//               currency: 'SR',
//               price: '1,500',
//               date: '24-29 Jul',
//               rate: '5.0',
//               imgList: const [
//                 'https://s3-alpha-sig.figma.com/img/2730/5f24/821cb946e3048faa69e740c55b8f5aaf?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=diZUnPz73UJZyy9kCtxSuyKu14P7YdcuiPQhXmFo2fNxZTeQwjOUTaW-dyeyF30RDR8-I34wtC4qb99xFvcfXvmn0pi5vHLfqx2ssMgFPhTUyFF0ljOrFfC2fzu5RQdgz6-fq5ymBNTASHcynaae7-~yB~48KcPcov8SiIxGKGgwUiAMsGM07tddFhD-E-LPQOwkTtKxEbIThu9GD32oIvnPsc5afCo86P1xhF1qSb3f7gCZjxuDc8eb5fc8CrbzB17XfhZSEIwF25PRTYahsuz3QdiAuX6TsyYRkZhfUNlD9zEJARIY36YzVRmbLSF48qr6ZZEhdUTzOdhxMaLCBA__',
//                 'https://s3-alpha-sig.figma.com/img/d8e0/374e/81fb202170921f2d52d4d1ef983cac7d?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cqam45brUvgmQbPpnphSil3fjw6dOQyXkoDg53oHL4B-ot5PohU44UuiM8sgPAHarcTuuBp5eSQpgcoIlItr9itYzyd8dC~ifXTe0lP3pupMDEyb7-ig8Qm57FUukYOXX2YBEL6JD7qbrcgJAKY-0~m~HyYC33mvT9pB9S4IYdt1rK8NvrW6jLQR8VfiM6HfwQW5PXtARzca9F2i53IMEuQ8QkvqYgQ-CwLZidVIbGZZm-ZNa96VFKcY9a5Pv~b9MYx5WTOZCCAHlwzeip8d9eswlfaX1TGhV6vzmwnb0N26nfC~zWQv-cit2j8bcSg2Y1RxuexgvTQYYLGi-QlVNA__',
//                 'https://s3-alpha-sig.figma.com/img/215b/be31/d48ee9df771168582f050e5ec70c9a8f?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=k17QgKT2f4AXcizTE3Fo2Yxh1F30148ttonS9b0a8PvTdO7BrnZ9-W5pNRnTWyxkcGE9BkiFqBZagW6OAxDtXZYUOqijpIbfa~3B-hpCGr556t4o0~e1DzQ8D7D1GuFweIfRtyMS8ua~wYrXvdCtYH6C8cLi2CLThZHpyxgXeDeul466~bxT8RoyPO0T0yPpEz3c1zye6d16ARUwuLBC6B9ooavlHAmVmCQJwewIzlKsQL4Uov2Jnn6UhrjbWQe2OLbBaGALOX1krCUXrtdA8v2kfrWwNiH0zoZPGuahv70dVRJ5f4u2pbAhPLReaCsIH~DMaz7sN-LoLEJS5~WbVg__'
//               ],typeImage: ImageAssets.home_location, typeColor: AppColors.loginColoseColor,
//             )
//           ], ),
//           SizedBox(
//             height: 2.5.h,
//           ),
//           Image.asset(
//               SharedPrefController().languageCode == AppStrings.arabicCode
//                   ? ImageAssets.footer_ar_png
//                   : ImageAssets.footer_en_png)
//           // SvgPicture.asset(
//           //     SharedPrefController().languageCode == AppStrings.arabicCode
//           //         ? ImageAssets.footer_ar
//           //         : ImageAssets.footer_en)
//          // SvgPicture.asset(ImageAssets.footer_en)
//         ],
//       ),
//     )));
//   }
// }
