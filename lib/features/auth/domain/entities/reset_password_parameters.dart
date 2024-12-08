import 'package:equatable/equatable.dart';

base class ResetPasswordParameters extends Equatable {
  const ResetPasswordParameters({
    required this.otp,
    required this.password,
    required this.email,
  });

  final String email;
  final String otp;
  final String password;

  @override
  List<Object?> get props {
    return <Object?>[
      email,
      otp,
      password,
    ];
  }
}
