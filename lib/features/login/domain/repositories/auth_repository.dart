import 'package:dartz/dartz.dart';
import 'package:qubeCommerce/core/api/success_response.dart';
import 'package:qubeCommerce/features/login/domain/entities/login_parameter.dart';

import '../../../../core/error/Failure.dart';

abstract interface class AuthRepository {
  const AuthRepository();

  Future<Either<Failure, ApiResponse>> login({
    required LoginParameter loginParameter,
  });
}
