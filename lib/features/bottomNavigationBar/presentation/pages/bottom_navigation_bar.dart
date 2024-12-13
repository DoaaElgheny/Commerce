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
          } else {
            return const SettingScreen();
          }
        },
      ),
      bottomNavigationBar:
          BlocBuilder<ButtomnavigationbarCubit, SelectedTabNavigationBar>(
        builder: (context, currentIndex) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                ),
              ],
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              currentIndex: currentIndex.index,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.loginTitleColor,
              onTap: (index) {
                tabCubit.setTabIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    currentIndex == SelectedTabNavigationBar.home
                        ? ImageAssets.select_home
                        : ImageAssets.home,
                  ),
                  label: AppLocalizations.of(context)!.translate('home')!,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    currentIndex == SelectedTabNavigationBar.deals
                        ? ImageAssets.select_explor
                        : ImageAssets.search_explor,
                  ),
                  label: AppLocalizations.of(context)!.translate('deals')!,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    currentIndex == SelectedTabNavigationBar.wallet
                        ? ImageAssets.select_booking
                        : ImageAssets.calendar,
                  ),
                  label: AppLocalizations.of(context)!.translate('wallet')!,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    currentIndex == SelectedTabNavigationBar.more
                        ? ImageAssets.select_moew
                        : ImageAssets.circleEllipsis,
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
