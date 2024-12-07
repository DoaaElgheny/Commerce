import '../entities/parameters/user_toggle_online.dart';
import '../repositories/user.dart';

final class UserToggleOnline {
  const UserToggleOnline({
    required UserBaseRepository repository,
  }) : _repository = repository;

  final UserBaseRepository _repository;

  Future<void> call({
    required UserToggleOnlineParameters parameters,
  }) {
    return _repository.userToggleOnline(parameters: parameters);
  }
}
