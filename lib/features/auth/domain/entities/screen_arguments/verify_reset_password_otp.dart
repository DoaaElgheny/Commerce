import 'package:equatable/equatable.dart';

final class VerifyResetPasswordOTPViewParameters extends Equatable {
  const VerifyResetPasswordOTPViewParameters({
    required this.phone,
  });

  final String phone;

  @override
  List<Object> get props {
    return <Object>[
      phone,
    ];
  }
}
