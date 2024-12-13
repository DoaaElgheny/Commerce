import 'package:get_it/get_it.dart';
import 'package:qubeCommerce/features/home/domain/repositories/home_repository.dart';
import 'package:qubeCommerce/features/home/domain/usecases/get_avaliable_deals_list.dart';
import 'package:qubeCommerce/features/home/domain/usecases/get_my_deals_list.dart';
import 'package:qubeCommerce/features/home/presentation/cubit/filters_cubit.dart';
import 'package:qubeCommerce/features/home/presentation/cubit/home_cubit.dart';

final sl = GetIt.instance;

Future<void> initHome() async {
//bloc
//
  // sl.registerFactory<HomeCubit>(
  //     () => HomeCubit(getAvaliableDealsListUseCase: sl(), getMyDealsListUseCase: sl(), 
  //     ));//
  // sl.registerFactory<FiltersCubit>(() => FiltersCubit());
//
//   // Use cases
  // sl.registerLazySingleton<GetAvaliableDealsListUseCase>(
  //     () => GetAvaliableDealsListUseCase(homeRepository: sl()));
  // sl.registerLazySingleton<GetMyDealsListUseCase>(
  //     () => GetMyDealsListUseCase(homeRepository: sl()));
//
  // Repository
  // sl.registerLazySingleton<HomeRepository>(
  //     () => HomeRepositoryImpl(homeRemoteDataSource: sl()));

//   // Data Sources
  // sl.registerLazySingleton<HomeRemoteDataSource>(
  //     () => HomeRemoteDataSourceImpl(apiConsumer: sl()));
}
