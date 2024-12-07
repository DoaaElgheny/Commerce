import 'package:qubeCommerce/core/api/success_response.dart';

import '../../../../core/error/Failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/register_parameter.dart';

abstract class SignUpRepository {
  Future<Either<Failure, ApiResponse>> register(
      {required RegisterParameter registerParameter});
}
