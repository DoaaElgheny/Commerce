import 'package:equatable/equatable.dart';

final class ResetPasswordResponse extends Equatable {
  const ResetPasswordResponse({
    required this.message,
    required this.otp,
  });

  final String message;
  final String otp;

  @override
  List<Object?> get props {
    return <Object?>[
      message,
      otp,
    ];
  }
}
