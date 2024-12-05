import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import '../../config/routes/app_routes.dart';
import '../prefs/my_shared_prefs.dart';

class qubeCommerceFirebaseRemoteConfig {
  Future<void> versionCheck({required BuildContext context}) async {
    //Get Current installed version of app
    final PackageInfo info = await PackageInfo.fromPlatform();
    double currentVersion =
        double.parse(info.version.trim().replaceAll(".", ""));

    //Get Latest version info from firebase config
    final remoteConfig = FirebaseRemoteConfig.instance;
    print('currentVersion $currentVersion');

    try {
      // Using default duration to force fetching from remote server.
      // await remoteConfig.setConfigSettings(RemoteConfigSettings(
      //   fetchTimeout: Duration(seconds: 60),
      //   minimumFetchInterval: Duration(seconds: 10),
      // ));
      // await remoteConfig.fetchAndActivate();
      // double newVersion = double.parse(remoteConfig
      //     .getString(AppStrings.requiredMinimumVersion)
      //     .trim()
      //     .replaceAll(".", ""));
      // print('newVersion ' + newVersion.toString());
      // print('currentVersion ' + currentVersion.toString());
      // if (newVersion > currentVersion) {
      //   _showVersionDialog(context);
      // } else {
      _goNext(context: context);
      //}
    } catch (exception) {
      print('Unable to fetch remote config. Cached or default values will be '
          'used');
    }
  }

//Show Dialog to force user to update
//   _showVersionDialog(context) async {
//     await showDialog<String>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         String title =
//             AppLocalizations.of(context)!.translate('new_update_available')!;
//         String message = AppLocalizations.of(context)!
//             .translate('new_update_available_msg')!;
//         String btnLabel =
//             AppLocalizations.of(context)!.translate('update_now')!;
//         String btnLabelCancel = "Later";
//         return Platform.isIOS
//             ? CupertinoAlertDialog(
//                 title: Text(title),
//                 content: Text(message),
//                 actions: <Widget>[
//                   TextButton(
//                     child: Text(
//                       btnLabel,
//                       style: TextStyle(color: AppColors.primaryColor),
//                     ),
//                     onPressed: () => _launchURL(AppStrings.appStoreUrl),
//                   ),
//                 ],
//               )
//             : AlertDialog(
//                 title: Text(title),
//                 content: Text(message),
//                 actions: <Widget>[
//                   TextButton(
//                     child: Text(btnLabel),
//                     onPressed: () => _launchURL(AppStrings.playStoreUrl),
//                   ),
//                 ],
//               );
//       },
//     );
//   }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _goNext({required BuildContext context}) async {
    int number = SharedPrefController().numberNumberDeepLinkPost;

    //if(SharedPrefController().firstLoginFlag){
    // if(number != 0){
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => DetailsDeepLinkPostScreen(
    //           postId: number,
    //         )),
    //   );
    // }else
    //if(SharedPrefController().loggedIn){
    Navigator.pushReplacementNamed(context, Routes.bottomNavigationBarScreen);
    // Navigator.pushReplacementNamed(
    //     context, Routes.loginScreen);
    // }
    // }else{
    //   Navigator.pushReplacementNamed(context, Routes.OnBoardingScreen);
    // }
  }
}
