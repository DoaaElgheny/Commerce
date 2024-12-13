import 'package:qubeCommerce/core/prefs/prefs_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/app_strings.dart';

class SharedPrefController {
  // User user = User();
  static SharedPrefController instance = SharedPrefController._();
  late SharedPreferences _sharedPreferences;

  SharedPrefController._();

  factory SharedPrefController() {
    return instance;
  }

  Future<void> initSharePre() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setLoggedIn(bool login) async {
    return await _sharedPreferences.setBool(PrefsConstant.loggedIn, login);
  }

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefsConstant.loggedIn) ?? false;

  // Future<bool> logout() async {
  //   return await _sharedPreferences.clear();
  // }
  //
  Future<bool> setToken(String token) async {
    return await _sharedPreferences.setString(PrefsConstant.userToken, token);
  }

  String get token =>
      _sharedPreferences.getString(PrefsConstant.userToken) ?? '';

  Future<bool> setLanguage(String languageCode) async {
    return await _sharedPreferences.setString(AppStrings.locale, languageCode);
  }

  String get languageCode =>
      _sharedPreferences.getString(AppStrings.locale) ?? 'ar';

  Future<bool> setFirstLoginFlag(bool value) async {
    return await _sharedPreferences.setBool(AppStrings.firstLogin, value);
  }

  bool get firstLoginFlag =>
      _sharedPreferences.getBool(AppStrings.firstLogin) ?? false;

  Future<bool> setNumberDeepLinkPost(int value) async {
    return await _sharedPreferences.setInt(
        AppStrings.numberDeepLinkPost, value);
  }

  int get numberNumberDeepLinkPost =>
      _sharedPreferences.getInt(AppStrings.numberDeepLinkPost) ?? 0;

  clear(String key) {
    _sharedPreferences.remove(key);
  }

  clearAll() async {
    await _sharedPreferences.clear();
  }
}
