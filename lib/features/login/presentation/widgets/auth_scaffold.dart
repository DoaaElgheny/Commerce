import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qubeCommerce/core/shared_widgets/images.dart';
import 'package:qubeCommerce/core/utils/app_colors.dart';
import 'package:sizer/sizer.dart';

class AuthScaffold extends StatelessWidget implements PreferredSizeWidget {
  String? appBarSubTitle;
  final Widget body;
  double? bodyStart;
  Widget? appBarBottom;
  double? appBarHeight;
  Widget? scaffoldBottom;

  bool? isleadingIcon;
  List<Widget>? actions;
  double? theTop;
  Function()? customBackFunction;

  AuthScaffold(
      {super.key,
      this.appBarSubTitle,
      required this.body,
      this.appBarBottom,
      this.appBarHeight,
      this.scaffoldBottom,
      this.isleadingIcon = true,
      this.actions,
      this.customBackFunction,
      this.theTop});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (customBackFunction != null) {
          customBackFunction!();
        } else {
          EasyLoading.dismiss();
          Navigator.of(context).pop();
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Stack(
            children: [
              Container(
                  height: appBarSubTitle != null ? 50.h : 30.h,
                  width: 130.w,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      Images.authbackGroundPng,
                    ),
                    fit: BoxFit.cover,
                  )),
                  child: Container(
                    margin: EdgeInsets.only(
                        bottom: 15, right: 5.w, left: 5.w, top: 1.h),
                    child: Container(
                      // height: 15.h,
                      child: Text(''), //getAppBar(context, isleadingIcon),
                      padding: const EdgeInsets.only(bottom: 15),
                    ),
                  )),
              Positioned(
                  top: theTop ?? 25.h,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                      height: double.infinity,
                      child: Container(
                          margin: EdgeInsets.only(
                              top: appBarBottom != null ? 8.h : 0),
                          child: body))),
              if (appBarBottom != null) ...[
                Positioned(left: 0, right: 0, top: 13.h, child: appBarBottom!)
              ]
            ],
          ),
        ),
        bottomSheet: scaffoldBottom,
      ),
    );
  }

  getAppBar(BuildContext context, isleadingIcon) {
    // Locale? current = EasyLocalization.of(context)!.currentLocale;
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;

    Widget? leadingIcon = IconButton(
        onPressed: customBackFunction ??
            () {
              EasyLoading.dismiss();
              Navigator.of(context).pop();
            },
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          width: 10.w,
          // height: 10.h,
        ));

    if (canPop) {
      leadingIcon = IconButton(
          onPressed: customBackFunction ??
              () {
                EasyLoading.dismiss();
                Navigator.of(context).pop();
              },
          icon: Transform.scale(
            scale: 1, // current?.languageCode == 'ar' ? -1 : 1,
            child: SvgPicture.asset(
              "assets/svg/back.svg",
              width: 10.w,
              //  height: 10.h,
            ),
          ));
    }
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: appBarHeight != null ? appBarHeight! : 30.h,
      leading: leadingIcon,
      // title: Text(appBarTitle, style: _titleStyle),
      actions: actions,
      centerTitle: true,
      bottom: appBarBottom != null
          ? PreferredSize(
              preferredSize: const Size(0, 0),
              child: appBarBottom!,
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final TextStyle _titleStyle = TextStyle(
      fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25.sp);

  final SizedBox _sizedBox = const SizedBox(
    height: 13,
  );
}
