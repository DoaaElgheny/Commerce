import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/prefs/my_shared_prefs.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/shared_widgets/app_text.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../splash/presentation/cubit/locale_cubit.dart';
import '../widgets/lang_widget.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(5.0.w),
            child: BlocConsumer<LocaleCubit, LocaleState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'back',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    AppText(
                      text: AppLocalizations.of(context)!
                          .translate('change_language')!,
                      color: AppColors.black,
                      weight: FontWeight.w700,
                      fontSize: 24,
                      align: TextAlign.start,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    LanguageWidget(
                      onPress: () async {
                        context.read<LocaleCubit>().toArabic();
                      },
                      title: AppLocalizations.of(context)!.translate('arabic')!,
                      color: AppColors.primaryColor,
                      image: ImageAssets.person,
                      isLang: SharedPrefController().languageCode ==
                              AppStrings.arabicCode
                          ? true
                          : false,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    LanguageWidget(
                      isLang: SharedPrefController().languageCode ==
                              AppStrings.englishCode
                          ? true
                          : false,
                      onPress: () async {
                        
                          context.read<LocaleCubit>().toEnglish();
                        
                      },
                      title:
                          AppLocalizations.of(context)!.translate('english')!,
                      color: AppColors.primaryColor,
                      image: ImageAssets.apple,
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}
