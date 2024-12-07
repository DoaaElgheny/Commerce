import 'package:equatable/equatable.dart';

final class ResetPasswordViewParameters extends Equatable {
  const ResetPasswordViewParameters({
    required this.phone,
    required this.otp,
  });

  final String phone;
  final String otp;

  @override
  List<Object> get props {
    return <Object>[
      phone,
      otp,
    ];
  }
}
