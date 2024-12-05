
import 'package:qubeCommerce/core/api/success_response.dart';
import 'package:qubeCommerce/features/login/domain/entities/login_parameter.dart';
import 'package:qubeCommerce/features/login/domain/repositories/auth_repository.dart';
import '../../../../core/error/Failure.dart';
import '../../../../core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase implements UseCase<ApiResponse, LoginParameter> {
  final AuthRepository authRepository;

  LoginUsecase({required this.authRepository});

  @override
  Future<Either<Failure, ApiResponse>> call(LoginParameter params) =>
      authRepository.login(loginParameter: params);
}
