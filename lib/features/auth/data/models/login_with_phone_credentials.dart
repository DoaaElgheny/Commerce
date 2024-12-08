import 'dart:convert';

import '../../domain/entities/login_with_phone_credentials.dart';
import '../../domain/enums/field.dart';

final class LoginWithPhoneCredentialsDTO extends LoginWithPhoneCredentials {
  const LoginWithPhoneCredentialsDTO({
    required super.phone,
    required super.password,
  });

  LoginWithPhoneCredentialsDTO copyWith({
    String? phone,
    String? password,
  }) {
    return LoginWithPhoneCredentialsDTO(
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  factory LoginWithPhoneCredentialsDTO.fromJson(String json) {
    return LoginWithPhoneCredentialsDTO.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory LoginWithPhoneCredentialsDTO.fromMap(Map<String, dynamic> json) {
    return LoginWithPhoneCredentialsDTO(
      phone: json[AuthField.phone.value] as String,
      password: json[AuthField.password.value] as String,
    );
  }

  factory LoginWithPhoneCredentialsDTO.fromEntity(
    LoginWithPhoneCredentials entity,
  ) {
    return LoginWithPhoneCredentialsDTO(
      phone: entity.phone,
      password: entity.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      AuthField.phone.value: phone,
      AuthField.password.value: password,
    };
  }
}