import '../../../../features/auth/domain/entities/login_credentials.dart';
import '../../../../features/auth/domain/entities/register_credentials.dart';
import '../../../../features/auth/domain/entities/social_media_credentials.dart';
import '../../../../features/user/domain/entities/parameters/verify_account.dart';
import '../../../../features/user/domain/entities/user.dart';

abstract interface class AuthenticationDelegate {
  const AuthenticationDelegate();

  User? get currentUser;

  Future<void> init();

  void dispose();

  Future<User> login({
    required LoginCredentials credentials,
  });

  Future<User> loginWithSocialMedia({
    required SocialMediaCredentials credentials,
  });

  Future<User> register({
    required RegisterCredentials credentials,
  });

  Future<void> logout();

  Future<User> verifyAccount({
    required VerifyAccountParameters parameters,
  });

  Stream<User?> authStateChanges();

  Stream<User?> userChanges();

  Future<void> verifyToken();

  Future<void> refreshUser();

  Future<void> addFcmToken({
    required String token,
  });
}
