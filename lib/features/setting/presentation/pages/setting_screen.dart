import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/core/authentication/provider.dart';
import 'package:qubeCommerce/core/utils/constants.dart';
import 'package:qubeCommerce/features/auth/presentation/login/view/login.dart';
import 'package:qubeCommerce/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/shared_widgets/app_text.dart';
import '../../../../core/utils/assets_manager.dart';
import '../widgets/setting_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5.0.w),
          child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [

                  // AppBarLogo(
                  //   onPress: () {
                  //     Navigator.pop(context);
                  //   },
                  // ),
                  SizedBox(
                    height: 1.h,
                  ),
                  AppText(
                    text: AppLocalizations.of(context)!
                        .translate('setting')!,
                    color: AppColors.black,
                    weight: FontWeight.w700,
                    fontSize: 24,
                    align: TextAlign.start,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  // SettingWidget(
                  //   onPress: () {
                  //     Navigator.pushNamed(context, Routes.changePasswordScreen);
                  //   },
                  //   title: AppLocalizations.of(context)!.translate('change_email')!,
                  //   color: AppColors.drawerItem,
                  //   image: ImageAssets.chnage_email,
                  // ),
                  // SizedBox(
                  //   height: 3.h,
                  // ),
                  // SettingWidget(
                  //   colorIcon: AppColors.primaryColor,
                  //   onPress: () {
                  //     // Navigator.pushNamed(context, Routes.changePasswordScreen);
                  //   },
                  //   title: AppLocalizations.of(context)!.translate('change_password')!,
                  //   colorText: AppColors.primaryColor,
                  //   image: ImageAssets.person,
                  // ),
                  SizedBox(
                    height: 3.h,
                  ),
                  SettingWidget(
                    colorIcon: AppColors.primaryColor,
                    onPress: () {
                      //Navigator.pushNamed(context, Routes.contactUsScreen);
                    },
                    title: AppLocalizations.of(context)!.translate('contact_us')!,
                    colorText: AppColors.primaryColor,
                    image: ImageAssets.person,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  SettingWidget(
                    colorIcon: AppColors.primaryColor,
                    onPress: () {
                      if (Platform.isAndroid) {
                        Share.share('Download Qube Commerce https://play.google.com/store/apps/details?id=',
                            subject: 'Download Qube Commerce App');

                      } else if (Platform.isIOS) {
                        Share.share('Download Qube Commerce https://apps.apple.com/',
                            subject: 'Download Qube Commerce App');
                      }

                    },
                    title: AppLocalizations.of(context)!.translate('invite_friends')!,
                    colorText: AppColors.primaryColor,
                    image: ImageAssets.person,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  SettingWidget(
                    onPress: () {
                      Constants.showLogoutOrDeleteAccount(
                          context: context,
                          onPress: () async {
                            Navigator.pop(context);
                            await context.read<SettingCubit>().deleteAccount(context: context);
                          }, isLogout: false);
                    },
                    title: AppLocalizations.of(context)!.translate('delete_account')!,
colorText: Colors.red,
colorIcon: Colors.red,
                    image: ImageAssets.person,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  SettingWidget(
                   
                    onPress: () {
                      Navigator.pushNamed(context, Routes.changeLanguageScreen);
                      },
                    title: AppLocalizations.of(context)!.translate('language')!,
                    colorText: AppColors.primaryColor,
                    image: ImageAssets.person, colorIcon: AppColors.primaryColor,
                  ),
                   SizedBox(
                    height: 3.h,
                  ),
                  SettingWidget(
                    onPress: () async{
                        await AuthenticationProvider.instance.logout();
          if (context.mounted) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              LoginView.routeName,
              (r) => false,
            );
          }
                      },
                    title: "تسجيل الخروج",
                    colorText: AppColors.primaryColor,
                    image: ImageAssets.person, colorIcon: AppColors.primaryColor,
                  ),
                ],
              )
            ),
        ),
    );
  }
}
