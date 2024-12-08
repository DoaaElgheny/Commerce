import 'package:equatable/equatable.dart';

final class ResetPasswordResponse extends Equatable {
  const ResetPasswordResponse({
    required this.message,
    required this.otp,
    required this.email,
  });

  final String message;
  final String otp;
  final String email;

  @override
  List<Object?> get props {
    return <Object?>[
      message,
      otp,
      email,
    ];
  }
}
