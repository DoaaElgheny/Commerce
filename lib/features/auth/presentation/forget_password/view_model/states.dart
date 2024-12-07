sealed class ForgetPasswordStates {}

final class InitState extends ForgetPasswordStates {
  InitState() : super();
}

final class OtpSentState extends ForgetPasswordStates {
  OtpSentState({
    required this.phone,
  }) : super();
  final String phone;
}

final class NotValidDataState extends ForgetPasswordStates {
  NotValidDataState() : super();
}

final class ExceptionState extends ForgetPasswordStates {
  ExceptionState({
    required this.error,
  }) : super();
  final Object error;
}
