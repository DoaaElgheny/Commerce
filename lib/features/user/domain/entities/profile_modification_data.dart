import 'package:equatable/equatable.dart';

import '../../../../shared/enum/gender.dart';
import '../enums/employment_status.dart';
import '../enums/marital_status.dart';

base class ProfileModificationData extends Equatable {
  const ProfileModificationData({
    required this.userId,
    this.birthday,
    this.countryId,
    this.email,
    this.employmentStatus,
    this.firstName,
    this.gender,
    this.image,
    this.isMailVerified,
    this.isPhoneVerified,
    this.lang,
    this.lastName,
    this.maritalStatus,
    this.phone,
    this.roleId,
  });

  final int userId;
  final int? countryId;
  final DateTime? birthday;
  final String? email;
  final EmploymentStatus? employmentStatus;
  final Gender? gender;
  final String? image;
  final bool? isMailVerified;
  final bool? isPhoneVerified;
  final String? lang;
  final String? firstName;
  final String? lastName;
  final MaritalStatus? maritalStatus;
  final String? phone;
  final int? roleId;

  @override
  List<Object?> get props {
    return <Object?>[
      userId,
      birthday,
      countryId,
      email,
      employmentStatus,
      firstName,
      gender,
      image,
      isMailVerified,
      isPhoneVerified,
      lang,
      lastName,
      maritalStatus,
      phone,
      roleId,
    ];
  }
}
