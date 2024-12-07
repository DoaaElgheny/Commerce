import 'package:get_it/get_it.dart';
import 'package:qubeCommerce/features/login/data/repositories/auth_repository_impl.dart';
import 'package:qubeCommerce/features/login/domain/repositories/auth_repository.dart';
import 'package:qubeCommerce/features/login/domain/usecases/login_usecase.dart';
import 'package:qubeCommerce/features/login/presentation/cubit/login_cubit.dart';

import 'package:qubeCommerce/features/login/presentation/cubit/terms_and_conditions_cubit.dart';
import 'package:qubeCommerce/features/login/presentation/cubit/validation_cubit.dart';
import 'package:qubeCommerce/features/login/presentation/cubit/verification_cubit.dart';

import 'data/datasources/auth_remote_data_source.dart';

final sl = GetIt.instance;

Future<void> initLoginqubeCommerce() async {
//bloc
  sl.registerFactory<LoginCubit>(() => LoginCubit(loginUseCase: sl()));
  sl.registerFactory<FormValidationCubit>(() => FormValidationCubit());
  sl.registerFactory<VerificationCubit>(() => VerificationCubit());

  sl.registerFactory<TermsAndConditionsCubit>(() => TermsAndConditionsCubit());

  // Use cases
  sl.registerLazySingleton<LoginUsecase>(
      () => LoginUsecase(authRepository: sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(signUpRemoteDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(apiConsumer: sl()));
}
