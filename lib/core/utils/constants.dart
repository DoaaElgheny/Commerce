import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../config/locale/app_localizations.dart';
import '../shared_widgets/app_text.dart';
import 'package:intl/intl.dart';

class Constants {
  // Future<void> launchUrlSocialMedia(String url) async {
  //   final Uri _url = Uri.parse(url);
  //   if (!await launchUrl(_url)) {
  //     throw Exception('Could not launch $_url');
  //   }
  // }

  // void launchUrlSocialMedia(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  // Future<File> getImageFileFromAssets({required String assetPath}) async {
  //   final byteData = await rootBundle.load(assetPath);
  //   final tempDir = await getTemporaryDirectory();
  //   final file = File('${tempDir.path}/image.png');
  //   await file.writeAsBytes(byteData.buffer.asUint8List(), flush: true);
  //   return file;
  // }
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQU3h709orFLgoS_6PxQHWXSpMRf7BjEg',
    appId: '1:41724890763:android:555ac7fb61d35d26414e8e',
    messagingSenderId: '41724890763',
    projectId: 'qubeCommerce-3b26d',
    storageBucket: 'qubeCommerce-3b26d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDk2UbqeX8Wf04Da74KOhyie6jDfi6Vu_M',
    appId: '1:41724890763:ios:046932dc7fffad58414e8e',
    messagingSenderId: '41724890763',
    projectId: 'qubeCommerce-3b26d',
    storageBucket: 'qubeCommerce-3b26d.appspot.com',
    iosBundleId: 'com.soforx.qubeCommerce',
  );

  static void showErrorDialog(
      {required BuildContext context, required String msg}) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                msg,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                  child: const Text('Ok'),
                )
              ],
            ));
  }

  static void showRegistrationSuccessErrorDialog(
      {required String title,
      required String message,
      required String buttonText,
      required String image,
      required Color messageColor,
      required Color titleColor,
      required Function onPressed,
      required BuildContext context}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  image,
                ),
                const SizedBox(height: 8),
                AppText(
                  text: title,
                  color: titleColor,
                  weight: FontWeight.bold,
                  fontSize: 17,
                  align: TextAlign.center,
                ),
                const SizedBox(height: 8),
                AppText(
                  text: message,
                  color: messageColor,
                  weight: FontWeight.w400,
                  fontSize: 15,
                  align: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 5),
                InkWell(
                  onTap: () => onPressed(),
                  child: AppText(
                    text: buttonText,
                    color: titleColor,
                    weight: FontWeight.w700,
                    fontSize: 14,
                    align: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        });
  }

  String formatTimeDifference({
    required Duration difference,
    required BuildContext context,
    required DateTime postDate,
  }) {
    print('difference$difference');
    print('difference$difference');
    String formattedDate = DateFormat('dd/MM/yyyy').format(postDate);

    if (difference.inDays >= 7) {
      // If the difference is 7 days or more, return the date in DD/MM/YYYY format
      return formattedDate;
    } else if (difference.inDays > 0) {
      return '${difference.inDays}${AppLocalizations.of(context)!.translate('days_ago')!}';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}${AppLocalizations.of(context)!.translate('hours_ago')!}';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}${AppLocalizations.of(context)!.translate('minutes_ago')!}';
    } else {
      return AppLocalizations.of(context)!.translate('Just_now')!;
    }
  }

  String formatDate(String dateString) {
    // Parse the given date string into a DateTime object
    DateTime dateTime = DateTime.parse(dateString);

    // Format the DateTime object into the desired format
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

    return formattedDate;
  }

  // static void showHomeDialog(
  //     {required BuildContext context, required String msg}) {
  //   showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             contentPadding: EdgeInsets.zero,
  //             content: Container(
  //               width: MediaQuery.of(context).size.width - 120,
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(8),
  //               ),
  //               child: SingleChildScrollView(
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     InkWell(
  //                         onTap: () {
  //                           Navigator.pop(context);
  //                         },
  //                         child: Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: Align(
  //                               alignment:
  //                                   SharedPrefController().languageCode ==
  //                                           AppStrings.englishCode
  //                                       ? Alignment.topLeft
  //                                       : Alignment.topRight,
  //                               child: const Icon(Icons.clear)),
  //                         )),
  //                     SizedBox(height: 1.5.h),
  //                     SvgPicture.asset(
  //                       ImageAssets.dialogLogin,
  //                     ),
  //                     SizedBox(height: 4.h),
  //                     AppText(
  //                       text: AppLocalizations.of(context)!
  //                           .translate('register_now')!,
  //                       color: AppColors.black,
  //                       weight: FontWeight.w700,
  //                       fontSize: 22,
  //                       align: TextAlign.start,
  //                     ),
  //                     SizedBox(height: 1.5.h),
  //                     Padding(
  //                       padding: const EdgeInsets.only(right: 15, left: 15),
  //                       child: AppText(
  //                         text: AppLocalizations.of(context)!
  //                             .translate('you_must_be_logged')!,
  //                         color: AppColors.black.withOpacity(0.5),
  //                         weight: FontWeight.w400,
  //                         fontSize: 13,
  //                         align: TextAlign.start,
  //                       ),
  //                     ),
  //                     SizedBox(height: 2.5.h),
  //                     Padding(
  //                       padding: const EdgeInsets.only(right: 10, left: 10),
  //                       child: elevatedButton(
  //                         title:
  //                             AppLocalizations.of(context)!.translate('login')!,
  //                         onpressed: () {
  //                           //EasyLoading.dismiss();
  //                           Navigator.pushNamed(context, Routes.loginScreen);
  //                         },
  //                         primaryColor: AppColors.primaryColor,
  //                         height: 7.h,
  //                         loading: false,
  //                       ),
  //                     ),
  //                     SizedBox(height: 2.h),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         AppText(
  //                             text: AppLocalizations.of(context)!
  //                                 .translate('login_msg')!,
  //                             weight: FontWeight.w400,
  //                             fontSize: 16,
  //                             color: AppColors.hintColor,
  //                             align: TextAlign.start),
  //                         InkWell(
  //                           onTap: () {
  //                             // EasyLoading.dismiss();
  //                             Navigator.pushNamed(context, Routes.signUpScreen);
  //                           },
  //                           child: AppText(
  //                               text: AppLocalizations.of(context)!
  //                                   .translate('Sign_up')!,
  //                               weight: FontWeight.w500,
  //                               fontSize: 16,
  //                               color: AppColors.primaryColor,
  //                               align: TextAlign.start),
  //                         ),
  //                       ],
  //                     ),
  //                     SizedBox(height: 2.h),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ));
  // }

  // static void showApplyJob(
  //     {required BuildContext context, required String msg}) {
  //   showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             content: Container(
  //               width: MediaQuery.of(context).size.width - 120,
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(15),
  //               ),
  //               child: SingleChildScrollView(
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     InkWell(
  //                         onTap: () {
  //                           Navigator.pop(context);
  //                         },
  //                         child: Align(
  //                             alignment: SharedPrefController().languageCode ==
  //                                     AppStrings.englishCode
  //                                 ? Alignment.topLeft
  //                                 : Alignment.topRight,
  //                             child: const Icon(Icons.clear))),
  //                     SizedBox(height: 1.h),
  //                     SvgPicture.asset(
  //                       ImageAssets.doneJob,
  //                     ),
  //                     AppText(
  //                       text: AppLocalizations.of(context)!
  //                           .translate('successful')!,
  //                       color: AppColors.black,
  //                       weight: FontWeight.w700,
  //                       fontSize: 22,
  //                       align: TextAlign.center,
  //                     ),
  //                     SizedBox(height: 1.h),
  //                     Padding(
  //                       padding: const EdgeInsets.only(right: 15, left: 15),
  //                       child: AppText(
  //                         text: AppLocalizations.of(context)!
  //                                 .translate('successfully_applied')! +
  //                             msg,
  //                         color: AppColors.black.withOpacity(0.5),
  //                         weight: FontWeight.w400,
  //                         fontSize: 13,
  //                         align: TextAlign.center,
  //                       ),
  //                     ),
  //                     SizedBox(height: 2.5.h),
  //                     Padding(
  //                       padding: const EdgeInsets.only(right: 10, left: 10),
  //                       child: elevatedButton(
  //                         title: AppLocalizations.of(context)!
  //                             .translate('browse_jobs')!,
  //                         onpressed: () {
  //                           Navigator.pushReplacementNamed(
  //                               context, Routes.submittedJobScreen);
  //                         },
  //                         primaryColor: AppColors.primaryColor,
  //                         height: 7.h,
  //                         loading: false,
  //                       ),
  //                     ),
  //                     SizedBox(height: 2.h),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ));
  // }

  // static void conguratulationPopUp({required BuildContext context}) {
  //   showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             contentPadding: EdgeInsets.zero,
  //             content: Container(
  //               width: MediaQuery.of(context).size.width - 120,
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(8),
  //               ),
  //               child: SingleChildScrollView(
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     InkWell(
  //                         onTap: () {
  //                           Navigator.pop(context);
  //                         },
  //                         child: Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: Align(
  //                               alignment:
  //                                   SharedPrefController().languageCode ==
  //                                           AppStrings.englishCode
  //                                       ? Alignment.topLeft
  //                                       : Alignment.topRight,
  //                               child: const Icon(Icons.clear)),
  //                         )),
  //                     SizedBox(height: 1.5.h),
  //                     SvgPicture.asset(
  //                       ImageAssets.congratulationImg,
  //                     ),
  //                     SizedBox(height: 4.h),
  //                     AppText(
  //                       text: AppLocalizations.of(context)!
  //                           .translate('congratulations')!,
  //                       color: AppColors.black,
  //                       weight: FontWeight.w700,
  //                       fontSize: 22,
  //                       align: TextAlign.start,
  //                     ),
  //                     SizedBox(height: 1.5.h),
  //                     Padding(
  //                       padding: const EdgeInsets.only(right: 15, left: 15),
  //                       child: AppText(
  //                         text: AppLocalizations.of(context)!
  //                             .translate('congratulations_text')!,
  //                         color: AppColors.black.withOpacity(0.5),
  //                         weight: FontWeight.w400,
  //                         fontSize: 13,
  //                         align: TextAlign.start,
  //                       ),
  //                     ),
  //                     SizedBox(height: 3.h),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ));
  // }

  // static void showRemoveSaveJob(
  //     {required BuildContext context, required Function() onPress}) {
  //   showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             content: Container(
  //               width: MediaQuery.of(context).size.width - 50,
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(15),
  //               ),
  //               child: SingleChildScrollView(
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     InkWell(
  //                         onTap: () {
  //                           Navigator.pop(context);
  //                         },
  //                         child: Align(
  //                             alignment: SharedPrefController().languageCode ==
  //                                     AppStrings.englishCode
  //                                 ? Alignment.topLeft
  //                                 : Alignment.topRight,
  //                             child: const Icon(Icons.clear))),
  //                     SizedBox(height: 1.h),
  //                     SvgPicture.asset(
  //                       ImageAssets.remove,
  //                     ),
  //                     AppText(
  //                       text: AppLocalizations.of(context)!
  //                           .translate('are_you_sure')!,
  //                       color: Colors.red,
  //                       weight: FontWeight.w700,
  //                       fontSize: 22,
  //                       align: TextAlign.center,
  //                     ),
  //                     SizedBox(height: 1.h),
  //                     Padding(
  //                       padding: const EdgeInsets.only(right: 15, left: 15),
  //                       child: AppText(
  //                         text: AppLocalizations.of(context)!
  //                             .translate('are_you_sure_msg')!,
  //                         color: AppColors.black.withOpacity(0.5),
  //                         weight: FontWeight.w400,
  //                         fontSize: 14,
  //                         align: TextAlign.center,
  //                       ),
  //                     ),
  //                     SizedBox(height: 2.5.h),
  //                     Row(
  //                       children: [
  //                         Container(
  //                           clipBehavior: Clip.antiAlias,
  //                           decoration: BoxDecoration(
  //                             boxShadow: [
  //                               BoxShadow(
  //                                 color: AppColors.chipsFont.withOpacity(0.1),
  //                                 blurRadius: 6,
  //                               ),
  //                             ],
  //                           ),
  //                           child: elevatedButton(
  //                             title: AppLocalizations.of(context)!
  //                                 .translate('back_to_save')!,
  //                             onpressed: () {
  //                               Navigator.pop(context);
  //                             },
  //                             primaryColor: Colors.white,
  //                             height: 7.h,
  //                             fontSizeChange: 15,
  //                             fontWeight: FontWeight.w400,
  //                             loading: false,
  //                             width: MediaQuery.of(context).size.width * 0.26,
  //                             textColor: AppColors.primaryColor,
  //                           ),
  //                         ),
  //                         const SizedBox(
  //                           width: 10,
  //                         ),
  //                         Expanded(
  //                           child: elevatedButton(
  //                             title: AppLocalizations.of(context)!
  //                                 .translate('remove')!,
  //                             onpressed: onPress,
  //                             fontSizeChange: 14,
  //                             primaryColor: Colors.red,
  //                             height: 7.h,
  //                             loading: false,
  //                             //width: MediaQuery.of(context).size.width * 0.60,
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                     SizedBox(height: 2.h),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ));
  // }

  // static void showPopReusable({
  //   required BuildContext context,
  //   required Function() onPressApprov,
  //   required Function() onPressCancel,
  //   required String image,
  //   required String title,
  //   required String subTitle,
  //   required Color titleColor,
  //   required Color subTitleColor,
  //   required String titleCancelButton,
  //   required String titleApprovButton,
  //   required Color cancelButtonColor,
  //   required Color approvButtonColor,
  //   required Color cancelButtonBackColor,
  //   required Color approvButtonBackColor,
  // }) {
  //   showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             content: Container(
  //               width: MediaQuery.of(context).size.width - 50,
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(30),
  //               ),
  //               child: SingleChildScrollView(
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     InkWell(
  //                         onTap: () {
  //                           Navigator.pop(context);
  //                         },
  //                         child: Align(
  //                             alignment: SharedPrefController().languageCode ==
  //                                     AppStrings.englishCode
  //                                 ? Alignment.topLeft
  //                                 : Alignment.topRight,
  //                             child: const Icon(Icons.clear))),
  //                     SizedBox(height: 1.h),
  //                     SvgPicture.asset(
  //                       image,
  //                     ),
  //                     AppText(
  //                       text: title,
  //                       color: titleColor,
  //                       weight: FontWeight.w700,
  //                       fontSize: 22,
  //                       align: TextAlign.center,
  //                     ),
  //                     SizedBox(height: 1.h),
  //                     Padding(
  //                       padding: const EdgeInsets.only(right: 15, left: 15),
  //                       child: AppText(
  //                         text: subTitle,
  //                         color: subTitleColor,
  //                         weight: FontWeight.w400,
  //                         fontSize: 14,
  //                         align: TextAlign.center,
  //                       ),
  //                     ),
  //                     SizedBox(height: 2.5.h),
  //                     Row(
  //                       children: [
  //                         Container(
  //                           clipBehavior: Clip.antiAlias,
  //                           decoration: BoxDecoration(
  //                             boxShadow: [
  //                               BoxShadow(
  //                                 color: AppColors.chipsFont.withOpacity(0.1),
  //                                 blurRadius: 6,
  //                               ),
  //                             ],
  //                           ),
  //                           child: elevatedButton(
  //                             borderRadius: 10,
  //                             title: titleCancelButton,
  //                             onpressed: onPressCancel,
  //                             primaryColor: cancelButtonBackColor,
  //                             height: 7.h,
  //                             fontSizeChange: 15,
  //                             fontWeight: FontWeight.w400,
  //                             loading: false,
  //                             width: MediaQuery.of(context).size.width * 0.26,
  //                             textColor: cancelButtonColor,
  //                           ),
  //                         ),
  //                         const SizedBox(
  //                           width: 10,
  //                         ),
  //                         Expanded(
  //                           child: elevatedButton(
  //                             borderRadius: 10,
  //                             textColor: approvButtonColor,
  //                             title: titleApprovButton,
  //                             onpressed: onPressApprov,
  //                             fontSizeChange: 14,
  //                             primaryColor: approvButtonBackColor,
  //                             height: 7.h,
  //                             loading: false,
  //                             //width: MediaQuery.of(context).size.width * 0.60,
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                     SizedBox(height: 2.h),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ));
  // }
}
