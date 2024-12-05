
import 'package:qubeCommerce/core/api/success_response.dart';
import 'package:qubeCommerce/features/login/domain/entities/login_parameter.dart';
import '../../../../core/error/Failure.dart';
import 'package:dartz/dartz.dart';


abstract class AuthRepository {  
  Future<Either<Failure, ApiResponse>> login({required LoginParameter loginParameter});
}