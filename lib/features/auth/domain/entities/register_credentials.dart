import 'package:equatable/equatable.dart';

base class RegisterCredentials extends Equatable {
  const RegisterCredentials({
    required this.email,
    required this.fullName,
    required this.password,
    required this.countryCode,
    required this.phone,
    required this.otp,
  });

  final String email;
  final String password;
  final String fullName;
  final String countryCode;
  final String phone;
  final String otp;

  @override
  List<Object?> get props {
    return <Object?>[
      fullName,
      email,
      password,
      countryCode,
      phone,
      otp,
    ];
  }
}
