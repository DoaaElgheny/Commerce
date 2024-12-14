import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qubeCommerce/features/setting/presentation/pages/setting_screen.dart';
import 'package:qubeCommerce/features/wallet/presentation/pages/wallet.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../core/notification_firebase/fb_notifications.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/enums.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../cubit/buttomnavigationbar_cubit.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  _BottomNavigationBarScreenState createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen>
    with TickerProviderStateMixin, FbNotifications {
  @override
  void initState() {
    initializeForegroundNotificationForAndroid(context: context);
    manageNotificationAction(context: context);
    if (Platform.isIOS) requestNotificationPermissions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabCubit = context.read<ButtomnavigationbarCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: false,
      body: BlocBuilder<ButtomnavigationbarCubit, SelectedTabNavigationBar>(
        builder: (context, currentIndex) {
          if (currentIndex == SelectedTabNavigationBar.home) {
            return const HomeScreen();
          } else if (currentIndex == SelectedTabNavigationBar.deals) {
            return const HomeScreen();
          } else if (currentIndex == SelectedTabNavigationBar.wallet) {
            return const MyWalletScreen();
          } else if (currentIndex == SelectedTabNavigationBar.profile) {
            return const MyWalletScreen();
          } else {
            return const SettingScreen();
          }
        },
      ),
      bottomNavigationBar:
          BlocBuilder<ButtomnavigationbarCubit, SelectedTabNavigationBar>(
        builder: (context, currentIndex) {
          return Container(
            height: 70,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                ),
              ],
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex.index,
              selectedItemColor: AppColors.selectColorHome,
              unselectedItemColor: AppColors.loginTitleColor,
              onTap: (index) {
                tabCubit.setTabIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    color: currentIndex == SelectedTabNavigationBar.home
                        ? AppColors.selectColorHome
                        : AppColors.loginTitleColor,
                    width: 28,
                    ImageAssets.home,
                  ),
                  label: AppLocalizations.of(context)!.translate('home')!,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    width: 28,
                    color: currentIndex == SelectedTabNavigationBar.deals
                        ? AppColors.selectColorHome
                        : AppColors.loginTitleColor,
                    ImageAssets.deal,
                  ),
                  label: AppLocalizations.of(context)!.translate('deals')!,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    width: 28,
                    color: currentIndex == SelectedTabNavigationBar.wallet
                        ? AppColors.selectColorHome
                        : AppColors.loginTitleColor,
                    ImageAssets.wallet,
                  ),
                  label: AppLocalizations.of(context)!.translate('wallet')!,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    width: 28,
                    color: currentIndex == SelectedTabNavigationBar.profile
                        ? AppColors.selectColorHome
                        : AppColors.loginTitleColor,
                    ImageAssets.profile,
                  ),
                  label: AppLocalizations.of(context)!.translate('my_profile')!,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    width: 28,
                    color: currentIndex == SelectedTabNavigationBar.more
                        ? AppColors.selectColorHome
                        : AppColors.loginTitleColor,
                    ImageAssets.more,
                  ),
                  label: AppLocalizations.of(context)!.translate('more')!,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
