import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isVerifying;
  final bool isValidPhoneNumber;
  final bool isValidEmail;

  const LoginState({
    this.isVerifying = false,
    this.isValidPhoneNumber = false,
    this.isValidEmail = false,
  });

  LoginState copyWith({
    bool? isVerifying,
    bool? isValidPhoneNumber,
    bool? isValidEmail,
  }) {
    return LoginState(
      isVerifying: isVerifying ?? this.isVerifying,
      isValidPhoneNumber: isValidPhoneNumber ?? this.isValidPhoneNumber,
      isValidEmail: isValidEmail ?? this.isValidEmail,
    );
  }

  @override
  List<Object> get props => [isVerifying,isValidPhoneNumber,isValidEmail];
}

