import 'package:dartz/dartz.dart';
import '../../../../core/error/Failure.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/setting_repository.dart';
import '../datasources/setting_remote_data_source.dart';

class SettingRepositoryImpl implements SettingRepository {
  final SettingRemoteDataSource settingRemoteDataSource;

  SettingRepositoryImpl(
      {required this.settingRemoteDataSource,});

  @override
  Future<Either<Failure, int>> deleteAccount() async {
    try {
      final deleteAccount = await settingRemoteDataSource.deleteAccount();
      return Right(deleteAccount);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}