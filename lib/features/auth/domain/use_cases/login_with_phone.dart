import '../entities/login_with_phone_credentials.dart';
import '../repositories/authentication.dart';

final class LoginWithPhoneUseCase {
  const LoginWithPhoneUseCase({
    required AuthenticationBaseRepository repository,
  }) : _repository = repository;

  final AuthenticationBaseRepository _repository;

  Future<String> call({
    required LoginWithPhoneCredentials credentials,
  }) async {
    return _repository.loginWithPhone(credentials: credentials);
  }
}
