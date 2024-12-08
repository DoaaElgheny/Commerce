import 'package:equatable/equatable.dart';

base class PasswordResetRequestParameters extends Equatable {
  const PasswordResetRequestParameters({
    required this.email,
  });

  final String email;

  @override
  List<Object?> get props {
    return <Object?>[
      email,
    ];
  }
}
