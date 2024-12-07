import '../../../../user/domain/entities/user.dart';

sealed class LoginState {}

final class InitState extends LoginState {}

final class LoggedInState extends LoginState {
  LoggedInState({required this.user});

  final User user;
}

final class NotValidDataState extends LoginState {}

final class ExceptionState extends LoginState {
  ExceptionState({required this.error});

  final Object error;
}
