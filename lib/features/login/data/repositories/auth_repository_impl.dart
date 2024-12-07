import 'package:dartz/dartz.dart';
import 'package:qubeCommerce/core/api/success_response.dart';
import 'package:qubeCommerce/features/login/data/datasources/auth_remote_data_source.dart';
import 'package:qubeCommerce/features/login/domain/repositories/auth_repository.dart';

import '../../../../core/error/Failure.dart';
import '../../../../core/error/exceptions.dart';

final class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource signUpRemoteDataSource;

  AuthRepositoryImpl({
    required this.signUpRemoteDataSource,
  });

  @override
  Future<Either<Failure, ApiResponse>> login({required loginParameter}) async {
    try {
      final login =
          await signUpRemoteDataSource.login(parameter: loginParameter);
      return Right(login);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
