
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qubeCommerce/core/utils/app_colors.dart';
import 'package:qubeCommerce/core/utils/app_strings.dart';
import '../../../../core/prefs/my_shared_prefs.dart';
import '../../../../core/shared_widgets/app_text.dart';
import '../../../splash/presentation/cubit/locale_cubit.dart';

class SettingWidget extends StatelessWidget {
  VoidCallback onPress;
  String image;
  String title;
  Color colorText;
  Color colorIcon;
  bool isLang;

  SettingWidget({
    Key? key,
    required this.onPress,
    required this.title,
    required this.image,
    this.isLang = false,
    required this.colorText,
    required this.colorIcon,
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
                color: AppColors.greyColor,
              ),
              const SizedBox(
                width: 12,
              ),
              AppText(
                text: title,
                color: colorText,
                weight: FontWeight.w400,
                fontSize: 16,
                align: TextAlign.start,
              ),
              Spacer(),
              isLang
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<LocaleCubit>().toEnglish();
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                right: 16, left: 16, top: 8, bottom: 8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: SharedPrefController().languageCode ==
                                          AppStrings.englishCode
                                      ? AppColors.primaryColor
                                      : AppColors.primaryColor),
                              color: SharedPrefController().languageCode ==
                                      AppStrings.englishCode
                                  ? AppColors.primaryColor.withOpacity(0.5)
                                  : AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: AppText(
                              text: 'English',
                              color: SharedPrefController().languageCode ==
                                      AppStrings.englishCode
                                  ? Colors.white
                                  : AppColors.greyColor,
                              weight: FontWeight.w500,
                              fontSize: 10,
                              align: TextAlign.start,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            context.read<LocaleCubit>().toArabic();
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                right: 16, left: 16, top: 8, bottom: 8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: SharedPrefController().languageCode ==
                                          AppStrings.arabicCode
                                      ? AppColors.primaryColor
                                      : AppColors.primaryColor),
                              color: SharedPrefController().languageCode ==
                                      AppStrings.arabicCode
                                  ? AppColors.primaryColor.withOpacity(0.5)
                                  : AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: AppText(
                              text: 'عربي',
                              color: SharedPrefController().languageCode ==
                                      AppStrings.arabicCode
                                  ? Colors.white
                                  : AppColors.grey,
                              weight: FontWeight.w500,
                              fontSize: 10,
                              align: TextAlign.start,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: colorIcon,
                      size: 18,
                    ),
            ],
          );
        },
      ),
    );
  }
}
