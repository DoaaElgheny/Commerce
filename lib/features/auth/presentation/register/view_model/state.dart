import '../../../../user/domain/entities/user.dart';

sealed class RegisterState {}

final class InitState extends RegisterState {}

final class RegisteredState extends RegisterState {
  RegisteredState({required this.user});

  final User user;
}

final class CompleteState extends RegisterState {
  CompleteState({required this.user});

  final User user;
}

final class NotValidDataState extends RegisterState {}

final class ExceptionState extends RegisterState {
  ExceptionState({required this.error});

  final Object error;
}
