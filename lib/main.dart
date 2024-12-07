import 'dart:async';
import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/core/utils/constants.dart';

import 'app.dart';
import 'bloc_observer.dart';
import 'core/authentication/provider.dart';
import 'core/notification_firebase/fb_notifications.dart';
import 'core/prefs/my_shared_prefs.dart';
import 'core/utils/configLoading.dart';
import 'di/dependency_injector.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initSharePre();

  DependencyInjector.setup();

  AuthenticationProvider.injectDelegate(
    delegate: DependencyInjector.authenticationDelegateWithRxdart,
  );

  await Firebase.initializeApp(
    options: Platform.isAndroid ? Constants.android : Constants.ios,
  );
  await FbNotifications.initNotifications();
  await di.init();
  //Stripe.publishableKey=EndPoints.publishableKey;
  Bloc.observer = AppBlocObserver();
  ConfigLoading.configLoading();
  runApp(const qubeCommerceApp());
}
