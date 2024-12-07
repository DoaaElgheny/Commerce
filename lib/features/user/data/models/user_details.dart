import 'dart:convert';

import 'package:intl/intl.dart';

import '../../../../shared/enum/gender.dart';
import '../../../../shared/model/wrapped.dart';
import '../../domain/entities/details.dart';
import '../../domain/enums/commission_type.dart';
import '../../domain/enums/employment_status.dart';
import '../../domain/enums/field.dart';
import '../../domain/enums/marital_status.dart';

final class UserDetailsDTO extends UserDetails {
  const UserDetailsDTO({
    required super.chatId,
    required super.commissionType,
    required super.commissionValue,
    required super.createdAt,
    required super.email,
    required super.emailVerified,
    required super.gender,
    required super.id,
    required super.isBusy,
    required super.isOnline,
    required super.notificationEnabled,
    required super.phone,
    required super.phoneVerified,
    required super.updatedAt,
    required super.wallet,
    super.bio,
    super.birthday,
    super.deletedAt,
    super.employmentStatus,
    super.firstName,
    super.fullName,
    super.image,
    super.imageId,
    super.lastName,
    super.maritalStatus,
  });

  UserDetails copyWith({
    Wrapped<String>? bio,
    Wrapped<DateTime>? birthday,
    int? chatId,
    Wrapped<CommissionType>? commissionType,
    Wrapped<num>? commissionValue,
    DateTime? createdAt,
    Wrapped<DateTime>? deletedAt,
    String? email,
    bool? emailVerified,
    Wrapped<EmploymentStatus>? employmentStatus,
    Wrapped<String?>? firstName,
    Wrapped<String?>? fullName,
    Gender? gender,
    int? id,
    Wrapped<String>? image,
    Wrapped<int>? imageId,
    bool? isBusy,
    bool? isOnline,
    Wrapped<String>? lastName,
    Wrapped<MaritalStatus>? maritalStatus,
    bool? notificationEnabled,
    String? phone,
    bool? phoneVerified,
    DateTime? updatedAt,
    num? wallet,
  }) {
    return UserDetails(
      bio: bio?.value ?? this.bio,
      birthday: birthday?.value ?? this.birthday,
      chatId: chatId ?? this.chatId,
      commissionType: commissionType?.value ?? this.commissionType,
      commissionValue: commissionValue?.value ?? this.commissionValue,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt?.value ?? this.deletedAt,
      email: email ?? this.email,
      emailVerified: emailVerified ?? this.emailVerified,
      employmentStatus: employmentStatus?.value ?? this.employmentStatus,
      firstName: firstName?.value ?? this.firstName,
      fullName: fullName?.value ?? this.fullName,
      gender: gender ?? this.gender,
      id: id ?? this.id,
      image: image?.value ?? this.image,
      imageId: imageId?.value ?? this.imageId,
      isBusy: isBusy ?? this.isBusy,
      isOnline: isOnline ?? this.isOnline,
      lastName: lastName?.value ?? this.lastName,
      maritalStatus: maritalStatus?.value ?? this.maritalStatus,
      notificationEnabled: notificationEnabled ?? this.notificationEnabled,
      phone: phone ?? this.phone,
      phoneVerified: phoneVerified ?? this.phoneVerified,
      updatedAt: updatedAt ?? this.updatedAt,
      wallet: wallet ?? this.wallet,
    );
  }

  factory UserDetailsDTO.fromJson(String str) {
    return UserDetailsDTO.fromMap(
      Map<String, dynamic>.from(json.decode(str) as Map),
    );
  }

  String toJson({
    String dateFormat = 'yyyy-MM-dd',
  }) {
    return json.encode(toMap(dateFormat: dateFormat));
  }

  factory UserDetailsDTO.fromMap(Map<String, dynamic> json) {
    return UserDetailsDTO(
      bio: json[UserField.bio.value] as String?,
      birthday: DateTime.tryParse(
        '${json[UserField.birthday.value]}' as String? ?? '',
      ),
      chatId: json[UserField.chatId.value] as int,
      commissionType: CommissionType.tryParseFromValue(
        json[UserField.commissionType.value] as String?,
      ),
      commissionValue: json[UserField.commissionValue.value] as num?,
      createdAt: DateTime.parse(json[UserField.createdAt.value] as String),
      deletedAt: DateTime.tryParse(
        json[UserField.deletedAt.value] as String? ?? '',
      ),
      email: json[UserField.email.value] as String,
      emailVerified: json[UserField.emailVerified.value] as bool,
      employmentStatus: json[UserField.employmentStatus.value] == null
          ? null
          : EmploymentStatus.fromId(
              json[UserField.employmentStatus.value] as int,
            ),
      firstName: json[UserField.firstName.value] as String?,
      fullName: json[UserField.fullName.value] as String?,
      gender: Gender.fromId(json[UserField.gender.value] as int),
      id: json[UserField.id.value] as int,
      image: json[UserField.image.value] as String?,
      imageId: json[UserField.imageId.value] as int?,
      isBusy: json[UserField.isBusy.value] as bool,
      isOnline: json[UserField.isOnline.value] as bool,
      lastName: json[UserField.lastName.value] as String?,
      maritalStatus: json[UserField.maritalStatus.value] == null
          ? null
          : MaritalStatus.fromId(json[UserField.maritalStatus.value] as int),
      notificationEnabled: json[UserField.notificationEnabled.value] as bool,
      phone: json[UserField.phone.value] as String,
      phoneVerified: json[UserField.phoneVerified.value] as bool,
      updatedAt: DateTime.parse(json[UserField.updatedAt.value] as String),
      wallet: json[UserField.wallet.value] as num,
    );
  }

  factory UserDetailsDTO.fromEntity(UserDetails entity) {
    return UserDetailsDTO(
      bio: entity.bio,
      birthday: entity.birthday,
      chatId: entity.chatId,
      commissionType: entity.commissionType,
      commissionValue: entity.commissionValue,
      createdAt: entity.createdAt,
      deletedAt: entity.deletedAt,
      email: entity.email,
      emailVerified: entity.emailVerified,
      employmentStatus: entity.employmentStatus,
      firstName: entity.firstName,
      fullName: entity.fullName,
      gender: entity.gender,
      id: entity.id,
      image: entity.image,
      imageId: entity.imageId,
      isBusy: entity.isBusy,
      isOnline: entity.isOnline,
      lastName: entity.lastName,
      maritalStatus: entity.maritalStatus,
      notificationEnabled: entity.notificationEnabled,
      phone: entity.phone,
      phoneVerified: entity.phoneVerified,
      updatedAt: entity.updatedAt,
      wallet: entity.wallet,
    );
  }

  Map<String, dynamic> toMap({
    String dateFormat = 'yyyy-MM-dd',
  }) {
    return <String, dynamic>{
      UserField.bio.value: bio,
      UserField.birthday.value: birthday == null
          ? null
          : DateFormat(dateFormat).format(
              birthday!,
            ),
      UserField.chatId.value: chatId,
      UserField.commissionType.value: commissionType?.value,
      UserField.commissionValue.value: commissionValue,
      UserField.createdAt.value: DateFormat(dateFormat).format(createdAt),
      UserField.deletedAt.value: deletedAt == null
          ? null
          : DateFormat(dateFormat).format(
              deletedAt!,
            ),
      UserField.email.value: email,
      UserField.emailVerified.value: emailVerified,
      UserField.employmentStatus.value: employmentStatus?.id,
      UserField.firstName.value: firstName,
      UserField.fullName.value: fullName,
      UserField.gender.value: gender.id,
      UserField.id.value: id,
      UserField.image.value: image,
      UserField.imageId.value: imageId,
      UserField.isBusy.value: isBusy,
      UserField.isOnline.value: isOnline,
      UserField.lastName.value: lastName,
      UserField.maritalStatus.value: maritalStatus?.id,
      UserField.notificationEnabled.value: notificationEnabled,
      UserField.phone.value: phone,
      UserField.phoneVerified.value: phoneVerified,
      UserField.updatedAt.value: DateFormat(dateFormat).format(updatedAt),
      UserField.wallet.value: wallet,
    };
  }
}
