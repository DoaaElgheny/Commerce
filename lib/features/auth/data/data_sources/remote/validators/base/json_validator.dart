abstract interface class AuthenticationJsonValidator {
  const AuthenticationJsonValidator();

  bool login(Object value);

  bool loginWithSocialMedia(Object value);

  bool register(Object value);

  bool resetPasswordByOtp(Object value);
}
