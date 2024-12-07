import 'dart:convert';

import '../../../../../shared/enum/gender.dart';
import '../../domain/entities/profile_modification_data.dart';
import '../../domain/enums/employment_status.dart';
import '../../domain/enums/field.dart';
import '../../domain/enums/marital_status.dart';

final class ProfileModificationDataDTO extends ProfileModificationData {
  const ProfileModificationDataDTO({
    required super.userId,
    super.birthday,
    super.countryId,
    super.email,
    super.employmentStatus,
    super.firstName,
    super.gender,
    super.image,
    super.isMailVerified,
    super.isPhoneVerified,
    super.lang,
    super.lastName,
    super.maritalStatus,
    super.phone,
    super.roleId,
  });

  factory ProfileModificationDataDTO.fromJson(String json) {
    return ProfileModificationDataDTO.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  factory ProfileModificationDataDTO.fromMap(Map<String, dynamic> map) {
    return ProfileModificationDataDTO(
      userId: map[UserField.id.value] as int,

      firstName: map[UserField.firstName.value] as String,
      lastName: map[UserField.lastName.value] as String,
      phone: map[UserField.phone.value] as String,
      image: map[UserField.image.value] as String,
      email: map[UserField.email.value] as String,
      birthday: map[UserField.birthday.value] as DateTime,
      gender: Gender.fromId(map[UserField.gender.value]),
      employmentStatus: EmploymentStatus.fromId(map[UserField.gender.value]),
      maritalStatus: MaritalStatus.fromId(map[UserField.gender.value]),
      // countryId: map[UserFields.countryId.value] as int,
      roleId: map[UserField.role.value] as int,
      // lang: map[UserFields.lang.value] as String,
      // isMailVerified: map[UserFields.isMailVerified.value] as bool,
      // isPhoneVerified: map[UserFields.isPhoneVerified.value] as bool,
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      UserField.firstName.value: firstName,
      UserField.lastName.value: lastName,
      UserField.phone.value: phone,
      UserField.image.value:
          image != null ? 'data:image/jpeg;base64,$image' : null,
      UserField.email.value: email,
      UserField.birthday.value: birthday?.toIso8601String(),
      UserField.gender.value: gender?.id.toString(),
      // UserFields.employeeStatus.value: employmentStatus?.id.toString(),
      UserField.maritalStatus.value: maritalStatus?.id.toString(),
      // UserFields.countryId.value: countryId,
      UserField.role.value: roleId,
      // UserFields.lang.value: lang,
      // UserFields.isMailVerified.value: isMailVerified,
      // UserFields.isPhoneVerified.value: isPhoneVerified,
    };
  }

  factory ProfileModificationDataDTO.fromEntity(
    ProfileModificationData entity,
  ) {
    return ProfileModificationDataDTO(
      userId: entity.userId,
      firstName: entity.firstName,
      lastName: entity.lastName,
      phone: entity.phone,
      image: entity.image,
      email: entity.email,
      birthday: entity.birthday,
      gender: entity.gender,
      employmentStatus: entity.employmentStatus,
      maritalStatus: entity.maritalStatus,
      lang: entity.lang,
      countryId: entity.countryId,
      roleId: entity.roleId,
      isMailVerified: entity.isMailVerified,
      isPhoneVerified: entity.isPhoneVerified,
    );
  }
}
