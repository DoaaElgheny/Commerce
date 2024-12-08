import '../../../domain/entities/reset_password_response.dart';

sealed class VerifyResetPasswordOTPState {}

final class InitState extends VerifyResetPasswordOTPState {}

final class OtpVerifiedState extends VerifyResetPasswordOTPState {
  OtpVerifiedState({
    required this.response,
  });

  final ResetPasswordResponse response;
}

final class NotValidOTPState extends VerifyResetPasswordOTPState {
  NotValidOTPState({required this.otp});

  final String otp;
}

final class OtpSentState extends VerifyResetPasswordOTPState {
  OtpSentState({required this.email});

  final String email;
}

final class ExceptionState extends VerifyResetPasswordOTPState {
  ExceptionState({required this.error});

  final Object error;
}
