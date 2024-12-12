import 'package:equatable/equatable.dart';

base class LoginWithPhoneCredentials extends Equatable {
  const LoginWithPhoneCredentials({
    required this.countryCode,
    required this.phone,
    required this.password,
  });

  final String countryCode;
  final String phone;
  final String password;

  @override
  List<Object> get props {
    return <Object>[
      countryCode,
      phone,
      password,
    ];
  }
}
