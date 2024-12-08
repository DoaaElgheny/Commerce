// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// import '../../../../config/locale/app_localizations.dart';
// import '../../../../core/shared_widgets/text_filed.dart';
// import '../../../../core/utils/app_colors.dart';
// import '../../../../core/utils/assets_manager.dart';
// import '../widgets/filter_botom_sheet.dart';
// import '../widgets/filter_button.dart';
// import '../widgets/special_booked_widget.dart';

// class ExploreScreen extends StatefulWidget {
//   const ExploreScreen({super.key});

//   @override
//   State<ExploreScreen> createState() => _ExploreScreenState();
// }

// class _ExploreScreenState extends State<ExploreScreen> {
//   TextEditingController searchControllerHome = TextEditingController();
//   final _scrollController = ScrollController();
//   List<SpecialBookedCard> specialBookedCardList = [
//     SpecialBookedCard(
//       type: 'Stays',
//       isFavorite: true,
//       title: 'Visit a traditional Asiri house',
//       subTitle: 'Al Riyadh, Saudi Arabia',
//       currency: 'SR',
//       price: '1,500',
//       date: '24-29 Jul',
//       rate: '5.0',
//       imgList: const [
//         'https://s3-alpha-sig.figma.com/img/2730/5f24/821cb946e3048faa69e740c55b8f5aaf?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=diZUnPz73UJZyy9kCtxSuyKu14P7YdcuiPQhXmFo2fNxZTeQwjOUTaW-dyeyF30RDR8-I34wtC4qb99xFvcfXvmn0pi5vHLfqx2ssMgFPhTUyFF0ljOrFfC2fzu5RQdgz6-fq5ymBNTASHcynaae7-~yB~48KcPcov8SiIxGKGgwUiAMsGM07tddFhD-E-LPQOwkTtKxEbIThu9GD32oIvnPsc5afCo86P1xhF1qSb3f7gCZjxuDc8eb5fc8CrbzB17XfhZSEIwF25PRTYahsuz3QdiAuX6TsyYRkZhfUNlD9zEJARIY36YzVRmbLSF48qr6ZZEhdUTzOdhxMaLCBA__',
//         'https://s3-alpha-sig.figma.com/img/d8e0/374e/81fb202170921f2d52d4d1ef983cac7d?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cqam45brUvgmQbPpnphSil3fjw6dOQyXkoDg53oHL4B-ot5PohU44UuiM8sgPAHarcTuuBp5eSQpgcoIlItr9itYzyd8dC~ifXTe0lP3pupMDEyb7-ig8Qm57FUukYOXX2YBEL6JD7qbrcgJAKY-0~m~HyYC33mvT9pB9S4IYdt1rK8NvrW6jLQR8VfiM6HfwQW5PXtARzca9F2i53IMEuQ8QkvqYgQ-CwLZidVIbGZZm-ZNa96VFKcY9a5Pv~b9MYx5WTOZCCAHlwzeip8d9eswlfaX1TGhV6vzmwnb0N26nfC~zWQv-cit2j8bcSg2Y1RxuexgvTQYYLGi-QlVNA__',
//         'https://s3-alpha-sig.figma.com/img/215b/be31/d48ee9df771168582f050e5ec70c9a8f?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=k17QgKT2f4AXcizTE3Fo2Yxh1F30148ttonS9b0a8PvTdO7BrnZ9-W5pNRnTWyxkcGE9BkiFqBZagW6OAxDtXZYUOqijpIbfa~3B-hpCGr556t4o0~e1DzQ8D7D1GuFweIfRtyMS8ua~wYrXvdCtYH6C8cLi2CLThZHpyxgXeDeul466~bxT8RoyPO0T0yPpEz3c1zye6d16ARUwuLBC6B9ooavlHAmVmCQJwewIzlKsQL4Uov2Jnn6UhrjbWQe2OLbBaGALOX1krCUXrtdA8v2kfrWwNiH0zoZPGuahv70dVRJ5f4u2pbAhPLReaCsIH~DMaz7sN-LoLEJS5~WbVg__'
//       ],
//       typeImage: ImageAssets.home_location,
//       typeColor: AppColors.green,
//     ),
//     SpecialBookedCard(
//       type: 'Experience',
//       isFavorite: false,
//       title: 'Visit a traditional Asiri house',
//       subTitle: 'Al Riyadh, Saudi Arabia',
//       currency: 'SR',
//       price: '1,500',
//       date: '24-29 Jul',
//       rate: '5.0',
//       imgList: const [
//         'https://s3-alpha-sig.figma.com/img/2730/5f24/821cb946e3048faa69e740c55b8f5aaf?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=diZUnPz73UJZyy9kCtxSuyKu14P7YdcuiPQhXmFo2fNxZTeQwjOUTaW-dyeyF30RDR8-I34wtC4qb99xFvcfXvmn0pi5vHLfqx2ssMgFPhTUyFF0ljOrFfC2fzu5RQdgz6-fq5ymBNTASHcynaae7-~yB~48KcPcov8SiIxGKGgwUiAMsGM07tddFhD-E-LPQOwkTtKxEbIThu9GD32oIvnPsc5afCo86P1xhF1qSb3f7gCZjxuDc8eb5fc8CrbzB17XfhZSEIwF25PRTYahsuz3QdiAuX6TsyYRkZhfUNlD9zEJARIY36YzVRmbLSF48qr6ZZEhdUTzOdhxMaLCBA__',
//         'https://s3-alpha-sig.figma.com/img/d8e0/374e/81fb202170921f2d52d4d1ef983cac7d?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cqam45brUvgmQbPpnphSil3fjw6dOQyXkoDg53oHL4B-ot5PohU44UuiM8sgPAHarcTuuBp5eSQpgcoIlItr9itYzyd8dC~ifXTe0lP3pupMDEyb7-ig8Qm57FUukYOXX2YBEL6JD7qbrcgJAKY-0~m~HyYC33mvT9pB9S4IYdt1rK8NvrW6jLQR8VfiM6HfwQW5PXtARzca9F2i53IMEuQ8QkvqYgQ-CwLZidVIbGZZm-ZNa96VFKcY9a5Pv~b9MYx5WTOZCCAHlwzeip8d9eswlfaX1TGhV6vzmwnb0N26nfC~zWQv-cit2j8bcSg2Y1RxuexgvTQYYLGi-QlVNA__',
//         'https://s3-alpha-sig.figma.com/img/215b/be31/d48ee9df771168582f050e5ec70c9a8f?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=k17QgKT2f4AXcizTE3Fo2Yxh1F30148ttonS9b0a8PvTdO7BrnZ9-W5pNRnTWyxkcGE9BkiFqBZagW6OAxDtXZYUOqijpIbfa~3B-hpCGr556t4o0~e1DzQ8D7D1GuFweIfRtyMS8ua~wYrXvdCtYH6C8cLi2CLThZHpyxgXeDeul466~bxT8RoyPO0T0yPpEz3c1zye6d16ARUwuLBC6B9ooavlHAmVmCQJwewIzlKsQL4Uov2Jnn6UhrjbWQe2OLbBaGALOX1krCUXrtdA8v2kfrWwNiH0zoZPGuahv70dVRJ5f4u2pbAhPLReaCsIH~DMaz7sN-LoLEJS5~WbVg__'
//       ],
//       typeImage: ImageAssets.home_location,
//       typeColor: AppColors.loginColoseColor,
//     ),
//     SpecialBookedCard(
//       type: 'Experience',
//       isFavorite: true,
//       title: 'Visit a traditional Asiri house',
//       subTitle: 'Al Riyadh, Saudi Arabia',
//       currency: 'SR',
//       price: '1,500',
//       date: '24-29 Jul',
//       rate: '5.0',
//       imgList: const [
//         'https://s3-alpha-sig.figma.com/img/2730/5f24/821cb946e3048faa69e740c55b8f5aaf?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=diZUnPz73UJZyy9kCtxSuyKu14P7YdcuiPQhXmFo2fNxZTeQwjOUTaW-dyeyF30RDR8-I34wtC4qb99xFvcfXvmn0pi5vHLfqx2ssMgFPhTUyFF0ljOrFfC2fzu5RQdgz6-fq5ymBNTASHcynaae7-~yB~48KcPcov8SiIxGKGgwUiAMsGM07tddFhD-E-LPQOwkTtKxEbIThu9GD32oIvnPsc5afCo86P1xhF1qSb3f7gCZjxuDc8eb5fc8CrbzB17XfhZSEIwF25PRTYahsuz3QdiAuX6TsyYRkZhfUNlD9zEJARIY36YzVRmbLSF48qr6ZZEhdUTzOdhxMaLCBA__',
//         'https://s3-alpha-sig.figma.com/img/d8e0/374e/81fb202170921f2d52d4d1ef983cac7d?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cqam45brUvgmQbPpnphSil3fjw6dOQyXkoDg53oHL4B-ot5PohU44UuiM8sgPAHarcTuuBp5eSQpgcoIlItr9itYzyd8dC~ifXTe0lP3pupMDEyb7-ig8Qm57FUukYOXX2YBEL6JD7qbrcgJAKY-0~m~HyYC33mvT9pB9S4IYdt1rK8NvrW6jLQR8VfiM6HfwQW5PXtARzca9F2i53IMEuQ8QkvqYgQ-CwLZidVIbGZZm-ZNa96VFKcY9a5Pv~b9MYx5WTOZCCAHlwzeip8d9eswlfaX1TGhV6vzmwnb0N26nfC~zWQv-cit2j8bcSg2Y1RxuexgvTQYYLGi-QlVNA__',
//         'https://s3-alpha-sig.figma.com/img/215b/be31/d48ee9df771168582f050e5ec70c9a8f?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=k17QgKT2f4AXcizTE3Fo2Yxh1F30148ttonS9b0a8PvTdO7BrnZ9-W5pNRnTWyxkcGE9BkiFqBZagW6OAxDtXZYUOqijpIbfa~3B-hpCGr556t4o0~e1DzQ8D7D1GuFweIfRtyMS8ua~wYrXvdCtYH6C8cLi2CLThZHpyxgXeDeul466~bxT8RoyPO0T0yPpEz3c1zye6d16ARUwuLBC6B9ooavlHAmVmCQJwewIzlKsQL4Uov2Jnn6UhrjbWQe2OLbBaGALOX1krCUXrtdA8v2kfrWwNiH0zoZPGuahv70dVRJ5f4u2pbAhPLReaCsIH~DMaz7sN-LoLEJS5~WbVg__'
//       ],
//       typeImage: ImageAssets.home_location,
//       typeColor: AppColors.loginColoseColor,
//     ),
//     SpecialBookedCard(
//       type: 'Experience',
//       isFavorite: false,
//       title: 'Visit a traditional Asiri house',
//       subTitle: 'Al Riyadh, Saudi Arabia',
//       currency: 'SR',
//       price: '1,500',
//       date: '24-29 Jul',
//       rate: '5.0',
//       imgList: const [
//         'https://s3-alpha-sig.figma.com/img/2730/5f24/821cb946e3048faa69e740c55b8f5aaf?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=diZUnPz73UJZyy9kCtxSuyKu14P7YdcuiPQhXmFo2fNxZTeQwjOUTaW-dyeyF30RDR8-I34wtC4qb99xFvcfXvmn0pi5vHLfqx2ssMgFPhTUyFF0ljOrFfC2fzu5RQdgz6-fq5ymBNTASHcynaae7-~yB~48KcPcov8SiIxGKGgwUiAMsGM07tddFhD-E-LPQOwkTtKxEbIThu9GD32oIvnPsc5afCo86P1xhF1qSb3f7gCZjxuDc8eb5fc8CrbzB17XfhZSEIwF25PRTYahsuz3QdiAuX6TsyYRkZhfUNlD9zEJARIY36YzVRmbLSF48qr6ZZEhdUTzOdhxMaLCBA__',
//         'https://s3-alpha-sig.figma.com/img/d8e0/374e/81fb202170921f2d52d4d1ef983cac7d?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cqam45brUvgmQbPpnphSil3fjw6dOQyXkoDg53oHL4B-ot5PohU44UuiM8sgPAHarcTuuBp5eSQpgcoIlItr9itYzyd8dC~ifXTe0lP3pupMDEyb7-ig8Qm57FUukYOXX2YBEL6JD7qbrcgJAKY-0~m~HyYC33mvT9pB9S4IYdt1rK8NvrW6jLQR8VfiM6HfwQW5PXtARzca9F2i53IMEuQ8QkvqYgQ-CwLZidVIbGZZm-ZNa96VFKcY9a5Pv~b9MYx5WTOZCCAHlwzeip8d9eswlfaX1TGhV6vzmwnb0N26nfC~zWQv-cit2j8bcSg2Y1RxuexgvTQYYLGi-QlVNA__',
//         'https://s3-alpha-sig.figma.com/img/215b/be31/d48ee9df771168582f050e5ec70c9a8f?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=k17QgKT2f4AXcizTE3Fo2Yxh1F30148ttonS9b0a8PvTdO7BrnZ9-W5pNRnTWyxkcGE9BkiFqBZagW6OAxDtXZYUOqijpIbfa~3B-hpCGr556t4o0~e1DzQ8D7D1GuFweIfRtyMS8ua~wYrXvdCtYH6C8cLi2CLThZHpyxgXeDeul466~bxT8RoyPO0T0yPpEz3c1zye6d16ARUwuLBC6B9ooavlHAmVmCQJwewIzlKsQL4Uov2Jnn6UhrjbWQe2OLbBaGALOX1krCUXrtdA8v2kfrWwNiH0zoZPGuahv70dVRJ5f4u2pbAhPLReaCsIH~DMaz7sN-LoLEJS5~WbVg__'
//       ],
//       typeImage: ImageAssets.home_location,
//       typeColor: AppColors.loginColoseColor,
//     )
//   ];
//   List<Filter> filters = [
//     Filter(icon: Icons.category, label: 'Stays', selected: false),
//     Filter(icon: Icons.filter_list, label: 'Camp', selected: false),
//     Filter(icon: Icons.attach_money, label: 'Price', selected: false),
//     Filter(icon: Icons.star, label: 'Rating', selected: false),
//   ];
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_onScroll);
//   }

//   @override
//   void dispose() {
//     _scrollController
//       ..removeListener(_onScroll)
//       ..dispose();
//     super.dispose();
//   }

//   Future<void> _onScroll() async {
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     final currentScroll = _scrollController.offset;
//     if (currentScroll >= (maxScroll * 0.9)) {
//       //await context.read<PostsCubit>().getPostsList();
//     }
//   }

//   void toggleFilter(int index) {
//     setState(() {
//       filters[index].selected = !filters[index].selected;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//               child: Column(children: [
//                 Row(
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(12),
//                           border: Border.all(
//                               color: AppColors.containerNotificationHomeColor,
//                               width: 2),
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 16, horizontal: 12),
//                         child: SvgPicture.asset(
//                           ImageAssets.back,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 7,),
//                     Expanded(child: TextFiledCustom(
//                       isReadOnly: false,
//                       onTab: () {
//                         // Navigator.pushNamed(context, Routes.searchScreen);
//                       },
//                       onChanged: (val) {},
//                       isBorder: true,
//                       isFilled: true,
//                       borderColor:AppColors.containerNotificationHomeColor,
//                       vertical: 5,
//                       prifixIcon: Padding(
//                           padding:
//                           const EdgeInsetsDirectional.only(start: 8.0, end: 8),
//                           child: SvgPicture.asset(ImageAssets.search_explor)),
//                       suffixIcon: InkWell(
//                         onTap: (){
//                           showModalBottomSheet(
//                             isScrollControlled: true,
//                             enableDrag: true,
//                             shape: const RoundedRectangleBorder(
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(10),
//                                 topRight: Radius.circular(10),
//                               ),
//                             ),
//                             context: context,
//                             builder: (BuildContext context) {
//                               return const FilterBottomSheet();
//                             },
//                           );
//                         },
//                         child: Padding(
//                             padding:
//                             const EdgeInsetsDirectional.only(end: 8.0, start: 8),
//                             child: SvgPicture.asset(ImageAssets.filter_icon)),
//                       ),

//                       validator: (v) {},
//                       textInputType: TextInputType.text,
//                       hintColor: AppColors.hintColor,
//                       fillColor: Colors.white,
//                       errorColorBorder: Colors.red,
//                       hintText: AppLocalizations.of(context)!
//                           .translate('search_position')!,
//                       controller: searchControllerHome,
//                     ),),
//                     const SizedBox(width: 7,),
//                     InkWell(
//                       onTap: () {
//                         // Constants.showHomeDialog(
//                         //     context: context, msg: 'msg');
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(12),
//                           border: Border.all(
//                               color: AppColors.containerNotificationHomeColor,
//                               width: 2),
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 10, vertical: 10),
//                         child: SvgPicture.asset(
//                           ImageAssets.maps_location_icon,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20,),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: filters
//                         .asMap()
//                         .entries
//                         .map((entry) => FilterButton(
//                       icon: entry.value.icon,
//                       label: entry.value.label,
//                       selected: entry.value.selected,
//                       onTap: () => toggleFilter(entry.key),
//                     ))
//                         .toList(),
//                   ),
//                 ),
//                 const SizedBox(height: 26,),
//                 Expanded(
//                   child: RefreshIndicator(
//                     onRefresh: () {
//                       // return context.read<PostsCubit>().refreshPost();
//                       return Future(() => null);
//                     },
//                     color: AppColors.primaryColor,
//                     child: ListView.separated(
//                         separatorBuilder:
//                             (BuildContext context, int index) {
//                           return const SizedBox(
//                             height: 10,
//                           );
//                         },
//                         controller: _scrollController,
//                         shrinkWrap: true,
//                         scrollDirection: Axis.vertical,
//                         itemCount: specialBookedCardList.length,
//                         // state.hasReachedMax
//                         //     ? state.item.length
//                         //     : state.item.length + 1,
//                         itemBuilder: (_, index) {
//                           // int indexPost = index >= state.item.length
//                           //     ? index - 1
//                           //     : index;
//                           return
//                             // index >= state.item.length
//                             //   ? Center(
//                             //   child: CircularProgressIndicator(
//                             //     color: AppColors.primaryColor,
//                             //   ))
//                             //   :
//                             SpecialBookedCard(
//                               type: specialBookedCardList[index].type,
//                               isFavorite: specialBookedCardList[index].isFavorite,
//                               title: specialBookedCardList[index].title,
//                               subTitle
//                               : specialBookedCardList[index].subTitle,
//                               currency: specialBookedCardList[index].currency,
//                               price:specialBookedCardList[index].price,
//                               date: specialBookedCardList[index].date,
//                               rate: specialBookedCardList[index].rate,
//                               imgList:specialBookedCardList[index].imgList,
//                               typeImage: specialBookedCardList[index].typeImage,
//                               typeColor: specialBookedCardList[index].typeColor,
//                             );
//                         }),
//                   ),
//                 )
//               ]),
//             )));
//   }
// }