import 'dart:convert';

import '../../domain/entities/register_credentials.dart';
import '../../domain/enums/field.dart';

final class RegisterCredentialsDTO extends RegisterCredentials {
  const RegisterCredentialsDTO({
    required super.email,
    required super.fullName,
    required super.password,
    required super.countryCode,
    required super.phone,
    required super.otp,
  });

  factory RegisterCredentialsDTO.fromJson(String json) {
    return RegisterCredentialsDTO.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory RegisterCredentialsDTO.fromMap(Map<String, dynamic> json) {
    return RegisterCredentialsDTO(
      fullName: json[AuthField.fullName.value] as String,
      email: json[AuthField.email.value] as String,
      password: json[AuthField.password.value] as String,
      countryCode: json[AuthField.countryCode.value] as String,
      phone: json[AuthField.phone.value] as String,
      otp: json[AuthField.otp.value] as String,
    );
  }

  factory RegisterCredentialsDTO.fromEntity(
    RegisterCredentials entity,
  ) {
    return RegisterCredentialsDTO(
      fullName: entity.fullName,
      email: entity.email,
      password: entity.password,
      countryCode: entity.countryCode,
      phone: entity.phone,
      otp: entity.otp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      AuthField.fullName.value: fullName,
      AuthField.email.value: email,
      AuthField.password.value: password,
      AuthField.countryCode.value: countryCode,
      AuthField.phone.value: phone,
      AuthField.otp.value: otp,
    };
  }
}
