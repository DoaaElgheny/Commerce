
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qubeCommerce/core/utils/app_colors.dart';
import '../../../../core/prefs/my_shared_prefs.dart';
import '../../../../core/shared_widgets/app_text.dart';
import '../../../splash/presentation/cubit/locale_cubit.dart';

class LanguageWidget extends StatelessWidget {
  VoidCallback onPress;
  String image;
  String title;
  Color color;
  bool isLang;

  LanguageWidget({
    Key? key,
    required this.onPress,
    required this.title,
    required this.image,
    this.isLang = false,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: BlocConsumer<LocaleCubit, LocaleState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Row(
            children: [
              SvgPicture.asset(
                image,
                width: 30,
                height: 30,
              ),
              const SizedBox(
                width: 12,
              ),
              AppText(
                text: title,
                color: color,
                weight: FontWeight.w400,
                fontSize: 16,
                align: TextAlign.start,
              ),
              Spacer(),
              isLang
                  ? Icon(Icons.check,color: AppColors.primaryColor,):SizedBox()
            ],
          );
        },
      ),
    );
  }
}
