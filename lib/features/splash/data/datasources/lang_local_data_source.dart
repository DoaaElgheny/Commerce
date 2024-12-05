import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/prefs/my_shared_prefs.dart';
import '../../../../core/utils/app_strings.dart';

abstract class LangLocalDataSource {
  Future<bool> changeLang({required String langCode});

  Future<String> getSavedLang();
}

class LangLocalDataSourceImpl implements LangLocalDataSource {
  final SharedPreferences sharedPreferences;
  ApiConsumer apiConsumer;

  LangLocalDataSourceImpl(
      {required this.sharedPreferences, required this.apiConsumer});

  @override
  Future<bool> changeLang({required String langCode}) async =>
      await SharedPrefController().setLanguage(langCode);

  // await sharedPreferences.setString(AppStrings.locale, langCode);

  @override
  Future<String> getSavedLang() async =>
      sharedPreferences.containsKey(AppStrings.locale)
          ? SharedPrefController().languageCode
          : AppStrings.englishCode;
}
