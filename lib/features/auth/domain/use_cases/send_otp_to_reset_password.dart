import '../entities/password_reset_request_params.dart';
import '../entities/reset_password_response.dart';
import '../repositories/authentication.dart';

final class SendOtpToResetPassword {
  const SendOtpToResetPassword({
    required AuthenticationBaseRepository repository,
  }) : _repository = repository;

  final AuthenticationBaseRepository _repository;

  Future<ResetPasswordResponse> call({
    required PasswordResetRequestParameters parameters,
  }) async {
    return _repository.sendOtpToResetPassword(parameters: parameters);
  }
}
