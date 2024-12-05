import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../config/locale/app_localizations_setup.dart';
import '../../config/themes/app_theme.dart';
import '../netwok/connection_cubit.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import 'app_text.dart';
import 'elevated_button_full_width.dart';

class DisconnectedScreen extends StatelessWidget {
  const DisconnectedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppStrings.appName,
        locale: const Locale('en'),
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        builder: EasyLoading.init(),
        supportedLocales: AppLocalizationsSetup.supportedLocales,
        localeResolutionCallback:
            AppLocalizationsSetup.localeResolutionCallback,
        localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
        home: Scaffold(
          appBar: AppBar(
              // title: AppText(
              //   text: 'Disconnected',
              //   color: AppColors.black,
              //   weight: FontWeight.w700,
              //   fontSize: 24,
              //   align: TextAlign.start,
              // ),
              // centerTitle: true,
              ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.signal_wifi_off,
                    size: 200,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(height: 20),
                  const AppText(
                    text: 'Internet Disconnected',
                    color: Colors.black,
                    weight: FontWeight.w700,
                    fontSize: 24,
                    align: TextAlign.start,
                  ),
                  const SizedBox(height: 10),
                  AppText(
                    text:
                        'Please check your internet connection and try again.',
                    color: Colors.black.withOpacity(0.6),
                    weight: FontWeight.w400,
                    fontSize: 16,
                    align: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  elevatedButtonFullWidth(
                    title: 'retry',
                    onpressed: () {
                      context.read<ConnectionCubit>().checkConnection();
                    },
                    primaryColor: AppColors.primaryColor,
                    height: 60,
                    loading: false,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
