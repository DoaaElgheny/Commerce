import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/prefs/my_shared_prefs.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/usecases/change_lang.dart';
import '../../domain/usecases/get_saved_lang.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetSavedLangUseCase getSavedLangUseCase;
  final ChangeLangUseCase changeLangUseCase;

  LocaleCubit(
      {required this.getSavedLangUseCase, required this.changeLangUseCase})
      : super(const ChangeLocaleState(Locale(AppStrings.englishCode)));

  String currentLangCode = AppStrings.englishCode;

  Future<void> getSavedLang() async {
    final response = await getSavedLangUseCase.call(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheFailure),
        (value) async {
      print('value$value');
      print('Platform.localeName${Platform.localeName}');
      print('value$value');
      print('Platform.localeName${Platform.localeName}');
      if (Platform.localeName == 'en' ||
          Platform.localeName.contains('en') ||
          Platform.localeName == 'en_US' ||
          Platform.localeName == 'en_EG') {
        currentLangCode = AppStrings.englishCode;
        emit(ChangeLocaleState(Locale(currentLangCode)));
        SharedPrefController().setLanguage(AppStrings.englishCode);
      } else {
        currentLangCode = AppStrings.arabicCode;
        emit(ChangeLocaleState(Locale(currentLangCode)));
        SharedPrefController().setLanguage(AppStrings.arabicCode);
      }
    });
  }

  Future<void> _changeLang(String langCode) async {
    final response = await changeLangUseCase.call(langCode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = langCode;
      emit(ChangeLocaleState(Locale(currentLangCode)));
    });
  }

  void toEnglish() => _changeLang(AppStrings.englishCode);

  void toArabic() => _changeLang(AppStrings.arabicCode);
}
