import 'package:qubeCommerce/core/api/success_response.dart';

import '../../../../core/error/Failure.dart';
import '../../../../core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../entities/register_parameter.dart';
import '../repositories/signup_repository.dart';

class Register implements UseCase<ApiResponse, RegisterParameter> {
  final SignUpRepository signUpRepository;
  Register({required this.signUpRepository});

  @override
  Future<Either<Failure, ApiResponse>> call(RegisterParameter params) =>
      signUpRepository.register(registerParameter: params);
}
