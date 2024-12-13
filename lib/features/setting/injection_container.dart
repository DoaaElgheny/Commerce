
import 'package:get_it/get_it.dart';
import 'package:qubeCommerce/features/setting/presentation/cubit/setting_cubit.dart';
import 'data/datasources/setting_remote_data_source.dart';
import 'data/repositories/setting_repository_impl.dart';
import 'domain/repositories/setting_repository.dart';
import 'domain/usecases/delete_account.dart';

final sl = GetIt.instance;

Future<void> initSettingCvees() async {
//bloc
  sl.registerFactory<SettingCubit>(
          () => SettingCubit(deleteAccountUsecase:  sl(),));

  // Use cases
  sl.registerLazySingleton<DeleteAccountUsecase>(
          () => DeleteAccountUsecase(settingRepository:  sl()));



  // Repository
  sl.registerLazySingleton<SettingRepository>(
          () => SettingRepositoryImpl( settingRemoteDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<SettingRemoteDataSource>(
          () => SettingRemoteDataSourceImpl(apiConsumer: sl()));


}
