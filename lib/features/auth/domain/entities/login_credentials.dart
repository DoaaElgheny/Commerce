import 'package:equatable/equatable.dart';

base class LoginCredentials extends Equatable {
  const LoginCredentials({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props {
    return <Object>[
      email,
      password,
    ];
  }
}
