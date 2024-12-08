import 'package:equatable/equatable.dart';

base class LoginWithPhoneCredentials extends Equatable {
  const LoginWithPhoneCredentials({
    required this.phone,
    required this.password,
  });

  final String phone;
  final String password;

  @override
  List<Object> get props {
    return <Object>[
      phone,
      password,
    ];
  }
}
