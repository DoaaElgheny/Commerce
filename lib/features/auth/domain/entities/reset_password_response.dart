import 'package:equatable/equatable.dart';

final class ResetPasswordResponse extends Equatable {
  const ResetPasswordResponse({
    required this.message,
    required this.otp,
    required this.email,
    required this.popAfterVerify,
  });

  final String message;
  final String otp;
  final String email;
  final bool popAfterVerify;

  @override
  List<Object?> get props {
    return <Object?>[
      message,
      otp,
      email,
      popAfterVerify,
    ];
  }
}
