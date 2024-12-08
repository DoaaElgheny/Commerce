import 'package:equatable/equatable.dart';

base class RegisterCredentials extends Equatable {
  const RegisterCredentials({
    required this.email,
    required this.fullName,
    required this.password,
    this.phone,
  });

  final String email;
  final String password;
  final String fullName;
  final String? phone;

  @override
  List<Object?> get props {
    return <Object?>[
      fullName,
      email,
      password,
      phone,
    ];
  }
}
