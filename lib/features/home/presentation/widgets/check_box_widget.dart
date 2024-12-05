import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/app_text.dart';
import '../../../../core/utils/app_colors.dart';
import '../../domain/entities/filter_option.dart';

class CheckBoxWidget extends StatefulWidget {
  final BuildContext context;
  final String title;
  final List<FilterOption> options;
  final Function(int, bool) onOptionChanged;

  const CheckBoxWidget(
      {super.key,
      required this.context,
      required this.title,
      required this.options,
      required this.onOptionChanged});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
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
        const SizedBox(
          height: 16,
        ),
        ...widget.options.asMap().entries.map((entry) {
          int index = entry.key;
          FilterOption option = entry.value;
          return buildCheckbox(option, (value) {
            widget.onOptionChanged(index, value!);
          });
        }),
      ],
    );
  }
}

Widget buildCheckbox(FilterOption option, Function(bool?) onChanged) {
  return Row(
    children: [
      Checkbox(
        value: option.value,
        onChanged: onChanged,
        activeColor: AppColors.loginColoseColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        side: BorderSide(color: AppColors.loginColoseColor.withOpacity(0.3)),
      ),
      AppText(
        text: option.label,
        color: AppColors.subTitleCheckBox,
        weight: FontWeight.w400,
        fontSize: 14,
        align: TextAlign.start,
      ),
    ],
  );
}
