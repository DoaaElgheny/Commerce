

import 'package:qubeCommerce/features/sign_up/presentation/cubit/sign_up_cubit.dart';

import 'package:get_it/get_it.dart';

import 'data/datasources/signup_remote_data_source.dart';
import 'data/repositories/signup_repository_impl.dart';
import 'domain/repositories/signup_repository.dart';

import 'domain/usecases/register.dart';

final sl = GetIt.instance;

Future<void> initSignUp() async {
//bloc

 

  sl.registerFactory<SignUpCubit>(() => SignUpCubit(registerUseCase: sl()));

  // Use cases
  
  sl.registerLazySingleton<Register>(() => Register(signUpRepository: sl()));

  // Repository
  sl.registerLazySingleton<SignUpRepository>(
      () => signUpRepositoryImpl(signUpRemoteDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<SignUpRemoteDataSource>(
      () => SignUpRemoteDataSourceImpl(apiConsumer: sl()));
}
