import 'package:dartz/dartz.dart';
import 'package:qubeCommerce/core/api/success_response.dart';
import '../../../../core/error/Failure.dart';
import '../../../../core/error/exceptions.dart';

import '../../domain/entities/register_parameter.dart';
import '../../domain/repositories/signup_repository.dart';
import '../datasources/signup_remote_data_source.dart';

class signUpRepositoryImpl implements SignUpRepository {
  final SignUpRemoteDataSource signUpRemoteDataSource;

  signUpRepositoryImpl({
    required this.signUpRemoteDataSource,
  });

 

  @override
  Future<Either<Failure, ApiResponse>> register(
      {required RegisterParameter registerParameter}) async {
    try {
      
      final register =
          await signUpRemoteDataSource.register(parameter: registerParameter);
    
      return Right(register);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
