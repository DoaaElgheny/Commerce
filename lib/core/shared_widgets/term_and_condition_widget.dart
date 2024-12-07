import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../config/locale/app_localizations.dart';
import '../api/end_points.dart';
import '../utils/app_colors.dart';
import 'app_text.dart';

class TermAndConditionWidget extends StatelessWidget {
  const TermAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
            text: AppLocalizations.of(context)!.translate('I_agree')!,
            weight: FontWeight.w400,
            fontSize: 14,
            color: Colors.black,
            align: TextAlign.start),
        InkWell(
          onTap: () {
            termAndCondition(context, 'EndPoints.termAndCondition');
          },
          child: AppText(
              text:
                  AppLocalizations.of(context)!.translate('terms_conditions')!,
              weight: FontWeight.w500,
              fontSize: 14,
              color: AppColors.loginColoseColor,
              align: TextAlign.start),
        ),
      ],
    );
  }

  termAndCondition(context, url) {
    if (Platform.isAndroid) {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => AcceptOfferWebPage(url, isTerm: true)));
      _launchUrl(url);
    } else {
      _launchUrl(url);
    }
  }

  Future<void> _launchUrl(url) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
