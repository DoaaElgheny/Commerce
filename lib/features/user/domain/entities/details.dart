import 'package:equatable/equatable.dart';

base class UserDetails extends Equatable {
  const UserDetails({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.appUserId,
    required this.isActive,
  });

  final int id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String appUserId;
  final bool isActive;

  @override
  List<Object?> get props {
    return <Object?>[
      id,
      fullName,
      email,
      phoneNumber,
      appUserId,
      isActive,
    ];
  }
}
