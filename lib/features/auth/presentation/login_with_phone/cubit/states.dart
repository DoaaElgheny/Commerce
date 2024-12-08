import '../../../../user/domain/entities/user.dart';

sealed class LoginWithPhoneState {}

final class InitState extends LoginWithPhoneState {}

final class LoggedInState extends LoginWithPhoneState {
  LoggedInState({required this.user});

  final User user;
}

final class NotValidDataState extends LoginWithPhoneState {}

final class ExceptionState extends LoginWithPhoneState {
  ExceptionState({required this.error});

  final Object error;
}
