import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';

abstract class SettingRemoteDataSource {
  Future<int> deleteAccount();
}

class SettingRemoteDataSourceImpl implements SettingRemoteDataSource {
  DioConsumer apiConsumer;

  SettingRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<int> deleteAccount() async {
    final response = await apiConsumer.delete(
        EndPoints.delete_account,
    );
    return response;
  }
}