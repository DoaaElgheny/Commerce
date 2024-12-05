import 'package:get_it/get_it.dart';
import 'package:qubeCommerce/features/home/presentation/cubit/filters_cubit.dart';

final sl = GetIt.instance;

Future<void> initHomeCvees() async {
//bloc
//
//   sl.registerFactory<HomeCubit>(
//       () => HomeCubit(getClassificationListUseCase: sl(), getRecentJobsListUseCase: sl(), getUserDataUseCase: sl()));//
  sl.registerFactory<FiltersCubit>(() => FiltersCubit());
//
//   // Use cases
//   sl.registerLazySingleton<GetClassificationList>(
//       () => GetClassificationList(homeRepository: sl()));
//   sl.registerLazySingleton<GetRecentJobsList>(
//       () => GetRecentJobsList(homeRepository: sl()));
//
//   // Repository
//   sl.registerLazySingleton<HomeRepository>(
//       () => HomeRepositoryImpl(homeRemoteDataSource: sl()));
//
//   // Data Sources
//   sl.registerLazySingleton<HomeRemoteDataSource>(
//       () => HomeRemoteDataSourceImpl(apiConsumer: sl()));
}
