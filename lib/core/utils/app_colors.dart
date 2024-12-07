import 'package:flutter/material.dart';

import 'hex_color.dart';

class AppColors {
  static Color primaryColor = Color(0xFF000080);
  static Color onBordingTitle = HexColor("#242D38");
  static Color onBordingSubTitle = HexColor("#B4AEAE");
  static Color hintColor = HexColor("#808080");
  static Color skipColor = HexColor("#9A9696");
  static Color dotColor = HexColor("#D6D6D6");
  static Color border = HexColor("#929292");
  static Color loginBottomRedColor = HexColor("#ED3024");
  static Color loginColoseColor = HexColor("#122466");
  static Color loginTitleColor = HexColor("#060D24");
  static Color gray = HexColor("#777C84");
  static Color divider = HexColor("#E5E9EF");
  static Color dividerPhoneColor = HexColor("#999CA0");
  static Color borderColor = HexColor("#D1D5DE");
  static Color green = HexColor("#10C477");
  static Color term = HexColor("#3559DD");
  static Color messageAlertColor = HexColor("#25262A");
  static Color containerNotificationHomeColor = HexColor("#EEF0F4");
  static Color discount = HexColor("#53110D");
  static Color nonSelectAdv = HexColor("#DBDEE8");
  static Color selectAdv = HexColor("#B6BBD0");
  static Color linearGradient = HexColor("#B6BBD0");
  static Color dicountYellow = HexColor("#FEBC2E");
  static Color dividrColor = HexColor("#E7E9F0");
  static Color SubTitleHomeColor = HexColor("#959BA5");
  static Color subTitleCheckBox = HexColor("#46484D");
  static Color linkedInMediumGrey = HexColor("#7F7F7F");
  static Color chipColor = HexColor("#F7F8FA");
  static Color BaseShimmerColor = Colors.grey.shade300;
  static Color HighlightShimmerColor = Colors.grey.shade100;
//Doaa
  static const Color borderGrey = Color(0xffACB1C0);
  static const Color blackColor = Color(0xff000000);
  static const Color textGrey = Color(0xff7C7D7E);
  static const Color inputBackgroundColor = Color(0xffF5F6FA);
  static Color carouselSliderContainerColor = HexColor("#FFF5F5");
  static Color redLinearGradientLighter = HexColor("#E53E3E");
  static Color redLinearGradientDarker = HexColor("#7F2222");
  static Color backgroundProgressBarGreyColor = HexColor("#F0F0F0");
  static Color backgroundProgressBackgroundLighGreen = HexColor("#B4F295");
  static Color backgroundProgressBackgroundDarkGreen = HexColor("#38A169");
  static Color greyColor = HexColor("#EFEFEF");
  static Color greyTextColor = HexColor("#718096");
  static Color greyTextDarkColor = HexColor("#221D05");
  static Color productTextGreenColor = HexColor("#38A169");
  static Color productTextBlueColor = HexColor("#06A6F1");
  static Color productSvg2Color = HexColor("#3AC1FF");
  static Color withdrawAddBalanceColorLeft = HexColor("#0D05D2");
}

Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
  return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
}
