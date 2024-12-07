sealed class VerifyResetPasswordOTPState {}

final class InitState extends VerifyResetPasswordOTPState {}

final class OtpVerifiedState extends VerifyResetPasswordOTPState {
  OtpVerifiedState({
    required this.phone,
    required this.otp,
  });

  final String phone;
  final String otp;
}

final class NotValidOTPState extends VerifyResetPasswordOTPState {
  NotValidOTPState({required this.otp});

  final String otp;
}

final class OtpSentState extends VerifyResetPasswordOTPState {
  OtpSentState({required this.phone});

  final String phone;
}

final class ExceptionState extends VerifyResetPasswordOTPState {
  ExceptionState({required this.error});

  final Object error;
}
