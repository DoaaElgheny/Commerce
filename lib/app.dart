import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:qubeCommerce/injection_container.dart' as di;
import 'package:sizer/sizer.dart';
import 'package:uni_links/uni_links.dart';

import 'config/locale/app_localizations_setup.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/netwok/connection_cubit.dart';
import 'core/prefs/my_shared_prefs.dart';
import 'core/remote_config/restart_widget.dart';
import 'core/shared_widgets/disconnected_screen.dart';
import 'core/utils/app_strings.dart';
import 'features/bottomNavigationBar/presentation/cubit/buttomnavigationbar_cubit.dart';
import 'features/home/presentation/cubit/filters_cubit.dart';
import 'features/splash/presentation/cubit/locale_cubit.dart';

class qubeCommerceApp extends StatefulWidget {
  const qubeCommerceApp({super.key});

  @override
  State<qubeCommerceApp> createState() => _qubeCommerceAppState();
}

class _qubeCommerceAppState extends State<qubeCommerceApp> {
  String _latestLink = 'Unknown';
  late StreamSubscription _sub;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    initUniLinks();
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  Future<void> initUniLinks() async {
    try {
      String? initialLink = await getInitialLink();
      if (initialLink != null) {
        handleDeepLink(initialLink);
      }
    } on PlatformException {
      // Handle exception
    }

    // Listen for deep links
    _sub = uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        var path = uri.path;
        handleDeepLink(path);
      }
    }, onError: (err) {
      // Handle errors
    });
  }

  Future<void> handleDeepLink(String link) async {
    print('link $link');
    setState(() {
      _latestLink = link;
    });
    Uri uri = Uri.parse(link);
    String number = uri.pathSegments.last;
    print('number $number');

    await SharedPrefController().setNumberDeepLinkPost(int.parse(number));
    if (Platform.isIOS) RestartWidget.restartApp(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => di.sl<LocaleCubit>()..getSavedLang()),
            BlocProvider<ConnectionCubit>(
              create: (context) => di.sl<ConnectionCubit>(),
            ),
            BlocProvider<ButtomnavigationbarCubit>(
              create: (context) => di.sl<ButtomnavigationbarCubit>(),
            ),
            BlocProvider<FiltersCubit>(
              create: (context) => di.sl<FiltersCubit>(),
            ),
          ],
          child: BlocBuilder<ConnectionCubit, ConnectionStatus>(
            builder: (context, state) {
              if (state == ConnectionStatus.disconnected) {
                return const DisconnectedScreen();
              } else {
                return BlocBuilder<LocaleCubit, LocaleState>(
                  buildWhen: (previousState, currentState) {
                    return previousState != currentState;
                  },
                  builder: (context, state) {
                    return Sizer(builder: (context, orientation, deviceType) {
                      return MaterialApp(
                        navigatorKey: navigatorKey,
                        title: AppStrings.appName,
                        // locale: state.locale,
                        locale: Locale(AppStrings.arabicCode),
                        debugShowCheckedModeBanner: false,
                        theme: appTheme(),
                        builder: EasyLoading.init(),
                        onGenerateRoute: AppRoutes.onGenerateRoute,
                        supportedLocales:
                            AppLocalizationsSetup.supportedLocales,
                        localeResolutionCallback:
                            AppLocalizationsSetup.localeResolutionCallback,
                        localizationsDelegates:
                            AppLocalizationsSetup.localizationsDelegates,
                      );
                    });
                  },
                );
              }
            },
          )),
    );
  }
}
