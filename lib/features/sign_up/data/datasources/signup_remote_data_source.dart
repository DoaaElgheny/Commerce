import 'package:qubeCommerce/core/api/success_response.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../domain/entities/register_parameter.dart';

abstract class SignUpRemoteDataSource {
  Future<ApiResponse> register({required RegisterParameter parameter});
}

class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  ApiConsumer apiConsumer;
  SignUpRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<ApiResponse> register({required RegisterParameter parameter}) async {
    final response = await apiConsumer.post(
      EndPoints.register,
      body: parameter.toJson()
    );
    return response;
  }
}