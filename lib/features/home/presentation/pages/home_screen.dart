import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qubeCommerce/config/locale/app_localizations.dart';
import 'package:qubeCommerce/core/authentication/provider.dart';
import 'package:qubeCommerce/core/prefs/my_shared_prefs.dart';
import 'package:qubeCommerce/core/shared_widgets/elevated_btn.dart';
import 'package:qubeCommerce/core/utils/app_colors.dart';
import 'package:qubeCommerce/features/auth/presentation/login/view/login.dart';
import 'package:qubeCommerce/features/home/domain/entities/deal_parameter.dart';
import 'package:qubeCommerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:qubeCommerce/features/home/presentation/cubit/home_state.dart';
import 'package:qubeCommerce/features/home/presentation/widgets/container_box.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/shared_widgets/app_text.dart';
import '../../domain/entities/popurlar_destinations_list.dart';
import '../widgets/special_booked_list_widget.dart';
import '../widgets/special_booked_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchControllerHome = TextEditingController();

  List<PopurlarDestinations> popurlarDestinations = [
    PopurlarDestinations(
        image:
            'https://vid.alarabiya.net/images/2021/07/24/67c8cb2b-20b1-4417-9dbe-888728515ee6/67c8cb2b-20b1-4417-9dbe-888728515ee6.jpeg?width=801&format=jpg',
        title: 'AL Riyadh',
        subTitle: '400 Stays'),
    PopurlarDestinations(
        image:
            'https://vid.alarabiya.net/images/2021/07/24/05d6e180-87d2-4fd8-b906-ca66539d5246/05d6e180-87d2-4fd8-b906-ca66539d5246.jpg?width=801&format=jpg',
        title: 'AL Riyadh',
        subTitle: '400 Stays'),
    PopurlarDestinations(
        image:
            'https://vid.alarabiya.net/images/2021/07/24/66633996-384c-47c6-b28c-f4e10a28214f/66633996-384c-47c6-b28c-f4e10a28214f_16x9_1200x676.jpg?width=801&format=jpg',
        title: 'AL Riyadh',
        subTitle: '400 Stays'),
    PopurlarDestinations(
        image:
            'https://vid.alarabiya.net/images/2021/07/24/66633996-384c-47c6-b28c-f4e10a28214f/66633996-384c-47c6-b28c-f4e10a28214f_16x9_1200x676.jpg?width=801&format=jpg',
        title: 'AL Riyadh',
        subTitle: '400 Stays'),
    PopurlarDestinations(
        image:
            'https://vid.alarabiya.net/images/2021/07/24/66633996-384c-47c6-b28c-f4e10a28214f/66633996-384c-47c6-b28c-f4e10a28214f_16x9_1200x676.jpg?width=801&format=jpg',
        title: 'AL Riyadh',
        subTitle: '400 Stays')
  ];
  List<PopurlarDestinations> specialCategorie = [
    PopurlarDestinations(
        image:
            'https://vid.alarabiya.net/images/2021/07/24/67c8cb2b-20b1-4417-9dbe-888728515ee6/67c8cb2b-20b1-4417-9dbe-888728515ee6.jpeg?width=801&format=jpg',
        title: 'AL Riyadh',
        subTitle: '400 Stays'),
    PopurlarDestinations(
        image:
            'https://vid.alarabiya.net/images/2021/07/24/05d6e180-87d2-4fd8-b906-ca66539d5246/05d6e180-87d2-4fd8-b906-ca66539d5246.jpg?width=801&format=jpg',
        title: 'AL Riyadh',
        subTitle: '400 Stays'),
    PopurlarDestinations(
        image:
            'https://vid.alarabiya.net/images/2021/07/24/66633996-384c-47c6-b28c-f4e10a28214f/66633996-384c-47c6-b28c-f4e10a28214f_16x9_1200x676.jpg?width=801&format=jpg',
        title: 'AL Riyadh',
        subTitle: '400 Stays'),
    PopurlarDestinations(
        image:
            'https://vid.alarabiya.net/images/2021/07/24/66633996-384c-47c6-b28c-f4e10a28214f/66633996-384c-47c6-b28c-f4e10a28214f_16x9_1200x676.jpg?width=801&format=jpg',
        title: 'AL Riyadh',
        subTitle: '400 Stays'),
    PopurlarDestinations(
        image:
            'https://vid.alarabiya.net/images/2021/07/24/66633996-384c-47c6-b28c-f4e10a28214f/66633996-384c-47c6-b28c-f4e10a28214f_16x9_1200x676.jpg?width=801&format=jpg',
        title: 'AL Riyadh',
        subTitle: '400 Stays')
  ];

  // @override
  // void initState() {
  //   super.initState();
   
  //   context.read<HomeCubit>().getAvaliabledeals(DealParameter(PageNumber: 0,PageSize: 10));
  //   context.read<HomeCubit>().getMyDeals(DealParameter(PageNumber: 0,PageSize: 10));
    
  // }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
    
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset('assets/images_new/header_back.png'),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                       Image.asset(
                          'assets/images_new/user_image.png',
                          width: 48,
                        ),
                         const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AppText(
                              text: AuthenticationProvider
                                      .instance.currentUser?.details.fullName ??
                                  '',
                              color: AppColors.primaryColor,
                              weight: FontWeight.bold,
                              fontSize: 16,
                              align: TextAlign.start,
                            ),
                           
                          ],
                        ),
                       
                       const Spacer(),
                        
                       InkWell(
                          onTap: () {},
                          child: Container(
                            width: 40,
                            height: 40,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(80),
                              border: Border.all(
                                color: AppColors.containerNotificationHomeColor,
                                width: 1,
                              ),
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/home_icons/vector.svg',
                                    width: 18,
                                  ),
                                ),
                                
                                Positioned(
                                  top: -2,
                                  right: 0,
                                  child: Container(
                                    width: 9,
                                    height: 9,
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              10, // Adjust font size as needed
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 88.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: ContainerBox(
                        text:AppLocalizations.of(context)!.translate('Expected_profits')!,
                        
                        number: '30.000',
                        onTap: () {},
                        boxColor: AppColors.productTextBlueColor,
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 168.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: ContainerBox(
                        text: AppLocalizations.of(context)!.translate('my_balance')!,
                        number: '20.000',
                        onTap: () {},
                        boxColor: Colors.white,
                        textColor: AppColors.productTextBlueColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 240),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        elevatedButtonWithoutWidth(
                          height: 48,
                          width: 175,
                          primaryColor: Colors.blue.shade900,
                          onpressed: () {},
                          title: AppLocalizations.of(context)!.translate('Withdraw_balance')!,
                          borderRadius: 10,
                          icon: SvgPicture.asset(
                            'assets/icons/home_icons/withdraw_balance.svg',
                            width: 25,
                          ),
                          loading: false,
                        ),
                        const SizedBox(width: 17),
                        elevatedButtonWithoutWidth(
                          height: 48,
                          width: 163,
                          primaryColor: Colors.blue.shade900,
                          borderRadius: 10,
                          onpressed: () {},
                          title: AppLocalizations.of(context)!.translate('Add_balance')!,
                          icon: SvgPicture.asset(
                            'assets/icons/home_icons/withdraw_balance.svg',
                            width: 25,
                          ),
                          loading: false,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              //SizedBox(height: 1.h),
             Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    
                        Row(
                          children: [
                            
                            
                             Padding(
                              padding: EdgeInsets.only(right: 16.0),
                              child: Text(
                                AppLocalizations.of(context)!.translate('My_deals')!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '12'+AppLocalizations.of(context)!.translate('deal')!,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        )
                         ,TextButton(
                          onPressed: () {},
                          child: Text(
                            AppLocalizations.of(context)!.translate('View_all')!,
                            style: TextStyle(
                              fontSize: 14,
                               decoration: TextDecoration.underline,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      
                      ],
                    ),
                  ),
              
              const SpecialBookedListCard(
                specialBookedCard: [
                
                  SpecialBookedCard(
                    image: 'assets/images_new/products/bag.jpg',
                    productCategory: 'Bags & accessories',
                    productName: 'Travel bag',
                    productNumber: 31,
                    svgPath1: 'assets/icons/overview_section/Bag 1.svg',
                    svgPath2: 'assets/icons/overview_section/Calender 1.svg',
                    date: '2024-10-10',
                  ),
                  SpecialBookedCard(
                    image:
                        'assets/images_new/products/rafly-alfaridzy-mSupi19KDC4-unsplash.jpg',
                    productCategory: 'Home & items',
                    productName: 'Kitchen utensils',
                    productNumber: 10,
                    svgPath1: 'assets/icons/overview_section/Bag 1.svg',
                    svgPath2: 'assets/icons/overview_section/Calender 1.svg',
                    date: '2024-9-12',
                  ),
                  SpecialBookedCard(
                    image:
                        'assets/images_new/products/Grey Mesh Folding Arm Computer Chair - Graphite.jpeg',
                    productCategory: 'Home & items',
                    productName: 'Mesh computer chair',
                    productNumber: 29,
                    svgPath1: 'assets/icons/overview_section/Bag 1.svg',
                    svgPath2: 'assets/icons/overview_section/Calender 1.svg',
                    date: '2024-9-12',
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  
                    Row(
                      children: [
                        Text(
                           AppLocalizations.of(context)!.translate('Available_deals')!,

                          style: TextStyle(
                            color: AppColors.greyTextDarkColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                         const SizedBox(width: 8),
                        Text(
                           '938'+ AppLocalizations.of(context)!.translate('deals')!,
                          
                          style: TextStyle(
                            color: AppColors.greyTextColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                   TextButton(
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context)!.translate('View_all')!,
                        
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                             // Underline thickness
         
                          fontSize: 14,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                   
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SpecialBookedListCard(
                carouselHeight: 405,
                specialBookedCard: [
                  SpecialBookedCard(
                    height: 395,
                    box: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: AppColors.carouselSliderContainerColor,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 55,
                            height: 45,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColors.redLinearGradientLighter,
                                  AppColors.redLinearGradientDarker,
                                ],
                              ),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '4',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'hour',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 2),
                          Container(
                            width: 55,
                            height: 45,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColors.redLinearGradientLighter,
                                  AppColors.redLinearGradientDarker,
                                ],
                              ),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '31',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'minutes',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 2),
                          Container(
                            width: 55,
                            height: 45,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColors.redLinearGradientLighter,
                                  AppColors.redLinearGradientDarker,
                                ],
                              ),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '44',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'seconds',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 48),
                          Container(
                            width: 55,
                            height: 45,
                            decoration: BoxDecoration(
                              color: AppColors.carouselSliderContainerColor,
                            ),
                            child: Center(
                              child: Text(
                                'Join in:',
                                style: TextStyle(
                                  color: AppColors.redLinearGradientLighter,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    image:
                        'assets/images_new/products/ANIMAL KING _ pet food_ packaging.jpeg',
                    productCategory: 'Animal king',
                    productName: 'Turkey Rice',
                    svgPath1: 'assets/icons/overview_section/Team 1.svg',
                    svgPath2: null,
                    date: 'How profitable deal:',
                    showButton: false,
                    numberOfPeople: 6,
                    showNumberOfPeople: true,
                    linearProgressIndicator: LinearProgressIndicator(
                      backgroundColor: AppColors.backgroundProgressBarGreyColor,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.green),
                      color: Colors.transparent,
                      minHeight: 12,
                      value: 0.5,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    showCarouselSliderTwo: true,
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
