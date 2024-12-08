import 'dart:convert';

import '../../domain/entities/register_credentials.dart';
import '../../domain/enums/field.dart';

final class RegisterCredentialsDTO extends RegisterCredentials {
  const RegisterCredentialsDTO({
    required super.email,
    required super.fullName,
    required super.password,
    super.phone,
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
      phone: json[AuthField.phone.value] as String?,
    );
  }

  factory RegisterCredentialsDTO.fromEntity(
    RegisterCredentials entity,
  ) {
    return RegisterCredentialsDTO(
      fullName: entity.fullName,
      email: entity.email,
      password: entity.password,
      phone: entity.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      AuthField.fullName.value: fullName,
      AuthField.email.value: email,
      AuthField.password.value: password,
      AuthField.phone.value: phone,
    };
  }
}
