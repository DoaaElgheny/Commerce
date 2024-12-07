import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../config/routes/app_routes.dart';
import '../../features/bottomNavigationBar/presentation/cubit/buttomnavigationbar_cubit.dart';
import '../prefs/my_shared_prefs.dart';
import '../utils/assets_manager.dart';

//typedef BackgroundMessageHandler = Future<void> Function(RemoteMessage message);
Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage remoteMessage) async {
  //BACKGROUND Notifications - iOS & Android
  await Firebase.initializeApp();
  log('Message: ${remoteMessage.messageId}');
}

// late AndroidNotificationChannel channel;
//late FlutterLocalNotificationsPlugin localNotificationsPlugin;

mixin FbNotifications {
  /// CALLED IN main function between ensureInitialized <-> runApp(widget);
  static Future<void> initNotifications() async {
    //var token=await FirebaseMessaging.instance.getToken();
    //log('Message: ${token}');

    //Connect the previous created function with onBackgroundMessage to enable
    //receiving notification when app in Background.
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    //Channel
    // if (!kIsWeb) {
    //   channel = const AndroidNotificationChannel(
    //     'Ceevez_notifications_channel',
    //     'Ceevez Notifications Channel',
    //     importance: Importance.high,
    //     enableLights: true,
    //     enableVibration: true,
    //     ledColor: Colors.orange,
    //     showBadge: true,
    //     playSound: true,
    //   );
    // }

    //Flutter Local Notifications Plugin (FOREGROUND) - ANDROID CHANNEL
    // localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    // await localNotificationsPlugin
    //     .resolvePlatformSpecificImplementation<
    //     AndroidFlutterLocalNotificationsPlugin>()
    //     ?.createNotificationChannel(channel);

    //iOS Notification Setup (FOREGROUND)
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  //iOS Notification Permission
  Future<void> requestNotificationPermissions() async {
    log('requestNotificationPermissions');
    NotificationSettings notificationSettings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      carPlay: false,
      announcement: false,
      provisional: false,
      criticalAlert: false,
    );
    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      log('GRANT PERMISSION');
    } else if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.denied) {
      log('Permission Denied');
    }
  }

  //ANDROID
  void initializeForegroundNotificationForAndroid(
      {required BuildContext context}) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Message Received: ${message.messageId}');
      log('Message:message $message');
      log('Message data: ${message.data}');
      log('SharedPrefController().languageCode: ${SharedPrefController().languageCode}');
      log('Message data: ${message.data['titleEn']}');
      RemoteNotification? notification = message.notification;
      AndroidNotification? androidNotification = notification?.android;
      if (notification != null && androidNotification != null) {
        showSimpleNotification(
            InkWell(
              onTap: () {
                context.read<ButtomnavigationbarCubit>().setTabIndex(3);
                Navigator.pushNamed(context, Routes.bottomNavigationBarScreen);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset(ImageAssets.logoImage,
                        semanticsLabel: ImageAssets.logoImage,
                        fit: BoxFit.fill),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      SharedPrefController().languageCode == 'en'
                          ? message.data['titleEn']
                          : message.data['titleAr'],
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            duration: const Duration(seconds: 10),
            background: Colors.white,
            elevation: 0,
            position: NotificationPosition.top);
        // localNotificationsPlugin.show(
        //   notification.hashCode,
        //   SharedPrefController().languageCode == 'en'
        //       ? message.data['titleEn']
        //       :  message.data['titleAr'],
        //  // notification.title,
        //   notification.body,
        //   NotificationDetails(
        //     android: AndroidNotificationDetails(
        //       channel.id,
        //       channel.name,
        //       importance: Importance.max,
        //       icon:"@mipmap/ic_launcher",
        //     ),
        //   ),
        //);
      }
    });
  }

  //GENERAL (Android & iOS)
  void manageNotificationAction({required BuildContext context}) {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('DataControlmessage: $message');
      _controlNotificationNavigation(message.data, context);
    });
  }

  void _controlNotificationNavigation(
      Map<String, dynamic> data, BuildContext context) {
    log('DataControlNotificationNavigation: $data');
    context.read<ButtomnavigationbarCubit>().setTabIndex(3);
    log(context.read<ButtomnavigationbarCubit>().state.index.toString());
    // if (data['page'] != null) {
    //   switch (data['page']) {
    //     case 'products':
    //       var productId = data['id'];
    //       print('Product Id: $productId');
    //       break;
    //
    //     case 'settings':
    //       print('Navigate to settings');
    //       break;
    //
    //     case 'profile':
    //       print('Navigate to Profile');
    //       break;
    //   }
    // }
  }

  static Future<String?> getFCMTonken() async {
    return await FirebaseMessaging.instance.getToken();
  }
}
