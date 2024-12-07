import 'dart:convert';

import '../../domain/entities/details.dart';
import '../../domain/enums/field.dart';

final class UserDetailsDTO extends UserDetails {
  const UserDetailsDTO({
    required super.id,
    required super.fullName,
    required super.email,
    required super.phoneNumber,
    required super.appUserId,
    required super.isActive,
  });

  /// Creates a new instance of [UserDetails] with updated fields
  UserDetailsDTO copyWith({
    int? id,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? appUserId,
    bool? isActive,
  }) {
    return UserDetailsDTO(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      appUserId: appUserId ?? this.appUserId,
      isActive: isActive ?? this.isActive,
    );
  }

  /// Converts a JSON string to a [UserDetailsDTO] instance
  factory UserDetailsDTO.fromJson(String str) {
    return UserDetailsDTO.fromMap(
      Map<String, dynamic>.from(json.decode(str) as Map),
    );
  }

  /// Converts this [UserDetailsDTO] instance to a JSON string
  String toJson() {
    return json.encode(toMap());
  }

  /// Maps JSON data to a [UserDetailsDTO] instance
  factory UserDetailsDTO.fromMap(Map<String, dynamic> json) {
    return UserDetailsDTO(
      id: json[UserField.id.value] as int,
      fullName: json[UserField.fullName.value] as String,
      email: json[UserField.email.value] as String,
      phoneNumber: json[UserField.phoneNumber.value] as String,
      appUserId: json[UserField.appUserId.value] as String,
      isActive: json[UserField.isActive.value] as bool,
    );
  }

  /// Converts a [UserDetails] entity to a [UserDetailsDTO] instance
  factory UserDetailsDTO.fromEntity(UserDetails entity) {
    return UserDetailsDTO(
      id: entity.id,
      fullName: entity.fullName,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      appUserId: entity.appUserId,
      isActive: entity.isActive,
    );
  }

  /// Maps this [UserDetailsDTO] instance to a JSON object
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      UserField.id.value: id,
      UserField.fullName.value: fullName,
      UserField.email.value: email,
      UserField.phoneNumber.value: phoneNumber,
      UserField.appUserId.value: appUserId,
      UserField.isActive.value: isActive,
    };
  }
}
