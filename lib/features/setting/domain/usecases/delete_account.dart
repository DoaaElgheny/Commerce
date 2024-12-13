import '../../../../core/error/Failure.dart';
import '../../../../core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/setting_repository.dart';

class DeleteAccountUsecase implements UseCase<int, NoParams> {

  final SettingRepository settingRepository;

  DeleteAccountUsecase({required this.settingRepository});

  @override
  Future<Either<Failure,int>> call(NoParams) =>
      settingRepository.deleteAccount();
}