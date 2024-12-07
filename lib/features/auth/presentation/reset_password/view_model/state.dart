import '../../../../user/domain/entities/user.dart';

sealed class ResetPasswordState {}

final class InitState extends ResetPasswordState {}

final class PasswordHasBeenResetState extends ResetPasswordState {
  PasswordHasBeenResetState({required this.user});

  final User user;
}

final class NotValidDataState extends ResetPasswordState {}

final class ExceptionState extends ResetPasswordState {
  ExceptionState({required this.error});

  final Object error;
}
