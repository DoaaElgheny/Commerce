import 'package:qubeCommerce/features/auth/domain/entities/login_with_phone_credentials.dart';

import '../../../domain/entities/login_credentials.dart';
import '../../../domain/entities/logout_params.dart';
import '../../../domain/entities/otp_confirmation_parameters.dart';
import '../../../domain/entities/password_reset_request_params.dart';
import '../../../domain/entities/register_credentials.dart';
import '../../../domain/entities/reset_password_parameters.dart';
import '../../../domain/entities/reset_password_response.dart';
import '../../../domain/entities/social_media_credentials.dart';

abstract interface class AuthenticationDataSource {
  const AuthenticationDataSource();

  Future<void> confirmOtpToResetPassword({
    required OtpConfirmationParameters parameters,
  });

  Future<String> login({
    required LoginCredentials credentials,
  });

  Future<String> loginWithPhone({
    required LoginWithPhoneCredentials credentials,
  });

  Future<Map<String, dynamic>> loginWithSocialMedia({
    required SocialMediaCredentials credentials,
  });

  Future<void> logout({
    required LogoutParameters parameters,
  });

  Future<String> register({
    required RegisterCredentials credentials,
  });

  Future<ResetPasswordResponse> sendOtpToResetPassword({
    required PasswordResetRequestParameters parameters,
  });

  Future<String> resetPasswordByOtp({
    required ResetPasswordParameters parameters,
  });
}
