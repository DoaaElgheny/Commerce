import 'package:flutter/material.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../core/shared_widgets/app_text.dart';
import '../../../../core/utils/app_colors.dart';

class ExpandableText extends StatefulWidget {
  final String title;
  final String text;

  const ExpandableText({super.key, required this.title, required this.text});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    String firstPart = widget.text
        .substring(0, widget.text.length < 100 ? widget.text.length : 100);
    String secondPart =
        widget.text.length > 100 ? widget.text.substring(100) : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: widget.title,
          color: AppColors.loginTitleColor,
          weight: FontWeight.w500,
          fontSize: 18,
          align: TextAlign.start,
        ),
        const SizedBox(height: 10),
        AppText(
          text: _isExpanded ? (firstPart + secondPart) : ('$firstPart...'),
          color: AppColors.gray,
          weight: FontWeight.w400,
          fontSize: 14,
          align: TextAlign.start,
        ),
        secondPart.isNotEmpty
            ? Column(
                children: [
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          _isExpanded ? Icons.expand_less : Icons.expand_more,
                          color: AppColors.loginTitleColor,
                        ),
                        AppText(
                          text: _isExpanded
                              ? AppLocalizations.of(context)!
                                  .translate('show_less')!
                              : AppLocalizations.of(context)!
                                  .translate('show_more')!,
                          color: AppColors.loginTitleColor,
                          weight: FontWeight.w500,
                          fontSize: 14,
                          align: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}
