import '../../../../core/error/Failure.dart';
import 'package:dartz/dartz.dart';

abstract class SettingRepository {
  Future<Either<Failure, int>> deleteAccount();

}