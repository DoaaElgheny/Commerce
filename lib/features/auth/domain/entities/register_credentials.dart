import 'package:equatable/equatable.dart';

base class RegisterCredentials extends Equatable {
  const RegisterCredentials({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.passwordConfirmation,
    this.bio,
    this.birthDay,
    this.phone,
  }) : assert(password == passwordConfirmation, 'Passwords must match.');

  final String? bio;
  final DateTime? birthDay;
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String passwordConfirmation;
  final String? phone;

  @override
  List<Object?> get props {
    return <Object?>[
      bio,
      birthDay,
      email,
      firstName,
      lastName,
      password,
      passwordConfirmation,
      phone,
    ];
  }
}
