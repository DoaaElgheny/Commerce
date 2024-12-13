final class EndPoints {
  //test
  static const String baseUrl = 'https://api.commerce.qubefyn.com/';

//Auth
  static const String loginWithEmail = '${baseUrl}api/Auth/LoginWithEmail';
  static const String loginWithPhoneNumber =
      '${baseUrl}api/Auth/LoginWithPhoneNumber';
  static const String logout = '${baseUrl}api/Auth/logout';
  static const String sendOtp = '${baseUrl}api/Auth/sendOtp';
  static const String changeCurrentPassword =
      '${baseUrl}api/Auth/ChangeCurrentPassword';
  static const String forgetPassword = '${baseUrl}api/Auth/forgetPassword';
static const String delete_account = '${baseUrl}api/Auth/delete_account';

// user
  static const String myProfile = '${baseUrl}api/Users/me';
  static const String register = '${baseUrl}api/Users/register';

  //deals

  //wallet
}
