import 'package:qubeCommerce/core/api/success_response.dart';
import 'package:qubeCommerce/features/login/domain/entities/login_parameter.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResponse> login({required LoginParameter parameter});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiConsumer apiConsumer;

  AuthRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<ApiResponse> login({required LoginParameter parameter}) async {
    ApiResponse response = await apiConsumer.post(
      EndPoints.loginWithEmail,
      body: parameter.toJson(),
    );
    return response;
  }
}
