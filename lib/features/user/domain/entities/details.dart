import 'package:equatable/equatable.dart';

import '../../../../shared/enum/gender.dart';
import '../enums/commission_type.dart';
import '../enums/employment_status.dart';
import '../enums/marital_status.dart';

// TODO(Shehab): Create UserDetails Types Depending on [UserDetails.role]
base class UserDetails extends Equatable {
  const UserDetails({
    required this.chatId,
    required this.commissionType,
    required this.commissionValue,
    required this.createdAt,
    required this.email,
    required this.emailVerified,
    required this.gender,
    required this.id,
    required this.isBusy,
    required this.isOnline,
    required this.notificationEnabled,
    required this.phone,
    required this.phoneVerified,
    required this.updatedAt,
    required this.wallet,
    this.bio,
    this.birthday,
    this.deletedAt,
    this.employmentStatus,
    this.firstName,
    this.fullName,
    this.image,
    this.imageId,
    this.lastName,
    this.maritalStatus,
  });

  final String? bio;
  final DateTime? birthday;
  final int chatId;
  final CommissionType? commissionType;
  final num? commissionValue;
  final DateTime createdAt;
  final DateTime? deletedAt;
  final String email;
  final bool emailVerified;
  final EmploymentStatus? employmentStatus;
  final String? firstName;
  final String? fullName;
  final Gender gender;
  final int id;
  final String? image;
  final int? imageId;
  final bool isBusy;
  final bool isOnline;
  final String? lastName;
  final MaritalStatus? maritalStatus;
  final bool notificationEnabled;
  final String phone;
  final bool phoneVerified;
  final DateTime updatedAt;
  final num wallet;

  @override
  List<Object?> get props {
    return <Object?>[
      bio,
      birthday,
      chatId,
      commissionType,
      commissionValue,
      createdAt,
      deletedAt,
      email,
      emailVerified,
      employmentStatus,
      firstName,
      fullName,
      gender,
      id,
      image,
      imageId,
      isBusy,
      isOnline,
      lastName,
      maritalStatus,
      notificationEnabled,
      phone,
      phoneVerified,
      updatedAt,
      wallet,
    ];
  }
}
