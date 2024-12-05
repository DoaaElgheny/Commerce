import 'package:get_it/get_it.dart';
import 'package:qubeCommerce/features/bottomNavigationBar/presentation/cubit/buttomnavigationbar_cubit.dart';

final sl = GetIt.instance;

Future<void> initButtomnavigationbarGotGame() async {
//bloc
  sl.registerFactory<ButtomnavigationbarCubit>(
          () => ButtomnavigationbarCubit());

  // Use cases
  // sl.registerLazySingleton<LoginUsecase>(
  //         () => LoginUsecase(loginRepository:  sl()));
  //
  //
  // // Repository
  // sl.registerLazySingleton<LoginRepository>(
  //         () => LoginRepositoryImpl( loginRemoteDataSource: sl()));
  //
  // // Data Sources
  // sl.registerLazySingleton<LoginRemoteDataSource>(
  //         () => LoginRemoteDataSourceImpl(apiConsumer: sl()));


}
