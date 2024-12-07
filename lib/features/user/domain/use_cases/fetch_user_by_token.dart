import 'package:qubeCommerce/features/user/domain/entities/details.dart';

import '../entities/parameters/user_by_token.dart';
import '../repositories/user.dart';

final class FetchUserByToken {
  const FetchUserByToken({
    required UserBaseRepository repository,
  }) : _repository = repository;

  final UserBaseRepository _repository;

  Future<UserDetails> call({
    required UserByTokenParameters parameters,
  }) {
    return _repository.userByToken(parameters: parameters);
  }
}
