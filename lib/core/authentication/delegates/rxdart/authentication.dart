import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:qubeCommerce/features/auth/domain/entities/login_with_phone_credentials.dart';
import 'package:qubeCommerce/features/auth/domain/use_cases/login_with_phone.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../features/auth/domain/entities/login_credentials.dart';
import '../../../../features/auth/domain/entities/logout_params.dart';
import '../../../../features/auth/domain/entities/register_credentials.dart';
import '../../../../features/auth/domain/entities/social_media_credentials.dart';
import '../../../../features/auth/domain/repositories/authentication.dart';
import '../../../../features/auth/domain/use_cases/login.dart';
import '../../../../features/auth/domain/use_cases/login_with_social_media.dart';
import '../../../../features/auth/domain/use_cases/logout.dart';
import '../../../../features/auth/domain/use_cases/register.dart';
import '../../../../features/user/domain/entities/parameters/add_fcm_token.dart';
import '../../../../features/user/domain/entities/parameters/user_by_token.dart';
import '../../../../features/user/domain/entities/parameters/verify_account.dart';
import '../../../../features/user/domain/entities/user.dart';
import '../../../../features/user/domain/repositories/user.dart';
import '../../../../features/user/domain/use_cases/add_fcm_token.dart';
import '../../../../features/user/domain/use_cases/fetch_user_by_token.dart';
import '../../../../features/user/domain/use_cases/verify_account.dart';
import '../../cache/base/auth.dart';
import '../base/authentication.dart';

final class AuthenticationDelegateWithRxdart implements AuthenticationDelegate {
  AuthenticationDelegateWithRxdart({
    required AuthenticationBaseRepository authRepository,
    required UserBaseRepository userRepository,
    required AuthenticationCache cache,
  })  : _cache = cache,
        _authRepository = authRepository,
        _userRepository = userRepository;

  final AuthenticationBaseRepository _authRepository;
  final UserBaseRepository _userRepository;
  final AuthenticationCache _cache;

  final _userChangesStreamController = BehaviorSubject<User?>.seeded(null);
  final _authChangesStreamController = BehaviorSubject<User?>();
  late final StreamSubscription _authStreamSubscription;

  @override
  User? get currentUser {
    return _userChangesStreamController.value;
  }

  @override
  Future<void> init() async {
    _authStreamSubscription = authStateChanges().listen((event) async {
      log('Event asd: $event');
      if (event == null) {
        await _cache.destroyToken();
      } else {
        await _cache.cacheToken(token: event.accessToken);
      }
    });

    await verifyToken();
  }

  @override
  void dispose() {
    _userChangesStreamController.close();
    _authChangesStreamController.close();
    _authStreamSubscription.cancel();
  }

  @override
  Future<User> login({required LoginCredentials credentials}) async {
    final useCase = Login(repository: _authRepository);
    final token = await useCase.call(credentials: credentials);

    final details = await FetchUserByToken(repository: _userRepository).call(
      parameters: UserByTokenParameters(token: token),
    );
    final user = User(
      details: details,
      accessToken: token,
    );
    _authChangesStreamController.sink.add(user);
    _userChangesStreamController.sink.add(user);

    return user;
  }

  @override
  Future<User> loginWithPhone({
    required LoginWithPhoneCredentials credentials,
  }) async {
    final useCase = LoginWithPhoneUseCase(repository: _authRepository);
    final token = await useCase.call(credentials: credentials);

    final details = await FetchUserByToken(repository: _userRepository).call(
      parameters: UserByTokenParameters(token: token),
    );
    final user = User(
      details: details,
      accessToken: token,
    );
    _authChangesStreamController.sink.add(user);
    _userChangesStreamController.sink.add(user);

    return user;
  }

  @override
  Future<User> loginWithSocialMedia({
    required SocialMediaCredentials credentials,
  }) async {
    final useCase = LoginWithSocialMedia(repository: _authRepository);
    final user = await useCase.call(credentials: credentials);

    _authChangesStreamController.sink.add(user);
    _userChangesStreamController.sink.add(user);

    return user;
  }

  @override
  Future<void> logout() async {
    if (currentUser != null) {
      await Logout(repository: _authRepository).call(
        parameters: LogoutParameters(token: currentUser!.accessToken),
      );
    }

    _authChangesStreamController.sink.add(null);
    _userChangesStreamController.sink.add(null);
  }

  @override
  Future<User> register({
    required RegisterCredentials credentials,
  }) async {
    final useCase = Register(repository: _authRepository);
    await useCase.call(credentials: credentials);

    return login(
      credentials: LoginCredentials(
        email: credentials.email,
        password: credentials.password,
      ),
    );
  }

  @override
  Future<User> verifyAccount({
    required VerifyAccountParameters parameters,
  }) async {
    final useCase = VerifyAccount(repository: _userRepository);
    final user = await useCase.call(parameters: parameters);

    _authChangesStreamController.sink.add(user);
    _userChangesStreamController.sink.add(user);

    return user;
  }

  @override
  Future<void> addFcmToken({required String token}) async {
    if (currentUser == null) {
      return;
    }
    final useCase = AddFcmToken(repository: _userRepository);
    await useCase.call(
      parameters: AddFcmTokenParameters(
        token: token,
        platform:
            Platform.isAndroid ? TargetPlatform.android : TargetPlatform.iOS,
      ),
    );
  }

  @override
  Stream<User?> authStateChanges() {
    return _authChangesStreamController.stream;
  }

  @override
  Stream<User?> userChanges() {
    return _userChangesStreamController.stream;
  }

  @override
  Future<void> verifyToken() async {
    try {
      log('verifyToken Start');
      final token = await _cache.cachedToken();
      if (token == null) {
        _authChangesStreamController.sink.add(null);
        _userChangesStreamController.sink.add(null);
        return;
      }

      final useCase = FetchUserByToken(repository: _userRepository);
      final details = await useCase.call(
        parameters: UserByTokenParameters(token: token),
      );

      _userChangesStreamController.sink.add(User(
        accessToken: token,
        details: details,
      ));
    } catch (_) {
      try {
        await logout();
      } catch (_) {
        _authChangesStreamController.sink.add(null);
        _userChangesStreamController.sink.add(null);
      }
    }
  }

  @override
  Future<void> refreshUser() async {
    final details = await FetchUserByToken(repository: _userRepository).call(
      parameters: UserByTokenParameters(token: currentUser!.accessToken),
    );
    _userChangesStreamController.sink.add(User(
      details: details,
      accessToken: currentUser!.accessToken,
    ));
  }
}
