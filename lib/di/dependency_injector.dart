import 'package:get_it/get_it.dart';

import '../core/authentication/cache/disk/hive.dart';
import '../core/authentication/delegates/rxdart/authentication.dart';
import '../features/auth/data/data_sources/remote/data_source.dart';
import '../features/auth/data/data_sources/remote/endpoints/v1/authentication.dart';
import '../features/auth/data/data_sources/remote/validators/remote/json_validator.dart';
import '../features/auth/data/repositories/authentication.dart';
import '../features/user/data/data_sources/remote/data_source.dart';
import '../features/user/data/data_sources/remote/endpoints/v1/user.dart';
import '../features/user/data/data_sources/remote/validators/remote/json_validator.dart';
import '../features/user/data/repositories/user.dart';
import '../network/client/dio/dio.dart';
import '../network/response_handler/almanam/response_handler.dart';

final class DependencyInjector {
  const DependencyInjector();

  static final GetIt _sl = GetIt.instance;

  static void reset() => _sl.reset();

  static void setup() {
    /// Configs
    _sl
      ..registerLazySingleton<DioNetworkClient>(DioNetworkClient.new)
      ..registerLazySingleton<AlmanamResponseHandler>(() {
        return const AlmanamResponseHandler();
      })

      /// DataSources
      ..registerLazySingleton<AuthenticationRemoteDataSource>(() {
        return AuthenticationRemoteDataSource(
          client: DependencyInjector._dioNetworkClient,
          responseHandler: DependencyInjector._almanamResponseHandler,
          endpoints: DependencyInjector._authenticationAlmanamEndpoints,
          jsonValidator:
              DependencyInjector._authenticationRemoteJsonResponseValidator,
        );
      })
      ..registerLazySingleton<UserRemoteDataSource>(() {
        return UserRemoteDataSource(
          client: DependencyInjector._dioNetworkClient,
          responseHandler: DependencyInjector._almanamResponseHandler,
          endpoints: DependencyInjector._userAlmanamEndpoints,
          jsonValidator: DependencyInjector._userRemoteJsonResponseValid,
        );
      })

      /// Endpoints
      ..registerLazySingleton<AuthenticationEndpointsV1>(() {
        return const AuthenticationEndpointsV1();
      })
      ..registerLazySingleton<UserEndpointsV1>(() {
        return const UserEndpointsV1();
      })

      /// Json Validators
      ..registerLazySingleton<AuthenticationPatternJsonValidator>(() {
        return const AuthenticationPatternJsonValidator();
      })
      ..registerLazySingleton<UserPatternJsonValidator>(() {
        return const UserPatternJsonValidator();
      })

      /// Repositories
      ..registerLazySingleton<AuthenticationRepository>(() {
        return AuthenticationRepository(
          dataSource: DependencyInjector._authenticationRemoteDataSource,
        );
      })
      ..registerLazySingleton<UserRepository>(() {
        return UserRepository(
          dataSource: DependencyInjector._userRemoteDataSource,
        );
      })

      /// Delegates
      ..registerLazySingleton<AuthenticationDelegateWithRxdart>(() {
        return AuthenticationDelegateWithRxdart(
          authRepository: DependencyInjector.authenticationRepository,
          userRepository: DependencyInjector.userRepository,
          cache: DependencyInjector._hiveAuthenticationCache,
        );
      })

      /// Cache
      ..registerLazySingleton<HiveAuthenticationCache>(
          HiveAuthenticationCache.new);
  }

  /// Configs
  static DioNetworkClient get _dioNetworkClient => _sl<DioNetworkClient>();
  static AlmanamResponseHandler get _almanamResponseHandler =>
      _sl<AlmanamResponseHandler>();

  /// Endpoints
  static AuthenticationEndpointsV1 get _authenticationAlmanamEndpoints =>
      _sl<AuthenticationEndpointsV1>();
  static UserEndpointsV1 get _userAlmanamEndpoints => _sl<UserEndpointsV1>();

  /// Json Validators
  static AuthenticationPatternJsonValidator
      get _authenticationRemoteJsonResponseValidator =>
          _sl<AuthenticationPatternJsonValidator>();
  static UserPatternJsonValidator get _userRemoteJsonResponseValid =>
      _sl<UserPatternJsonValidator>();

  /// Repositories
  static AuthenticationRepository get authenticationRepository =>
      _sl<AuthenticationRepository>();
  static UserRepository get userRepository => _sl<UserRepository>();

  /// DataSources
  static AuthenticationRemoteDataSource get _authenticationRemoteDataSource =>
      _sl<AuthenticationRemoteDataSource>();
  static UserRemoteDataSource get _userRemoteDataSource =>
      _sl<UserRemoteDataSource>();

  /// Delegates
  static AuthenticationDelegateWithRxdart
      get authenticationDelegateWithRxdart =>
          _sl<AuthenticationDelegateWithRxdart>();

  /// Cache
  static HiveAuthenticationCache get _hiveAuthenticationCache =>
      _sl<HiveAuthenticationCache>();
}
