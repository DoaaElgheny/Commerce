import '../base/authentication.dart';

final class AuthenticationEndpointsV1 implements AuthenticationEndpoints {
  const AuthenticationEndpointsV1();

  @override
  Uri get sendOtpToResetPassword {
    return Uri.parse('api/Auth/sendOtp');
  }

  @override
  Uri get login {
    return Uri.parse('api/Auth/LoginWithEmail');
  }

  @override
  Uri get loginWithPhone {
    return Uri.parse('/api/Auth/LoginWithPhoneNumber');
  }

  @override
  Uri get loginWithSocialMedia {
    return Uri.parse('api/v1/social/auth');
  }

  @override
  Uri get logout {
    return Uri.parse('api/Auth/logout');
  }

  @override
  Uri get register {
    return Uri.parse('api/Users/register');
  }

  @override
  Uri get confirmOtpToResetPassword {
    return Uri.parse('api/v1/check-reset-password-otp');
  }

  @override
  Uri get resetPasswordByOtp {
    return Uri.parse('api/v1/reset-password');
  }
}
