import 'dart:convert';

import '../../domain/entities/login_credentials.dart';
import '../../domain/enums/field.dart';

final class LoginCredentialsDTO extends LoginCredentials {
  const LoginCredentialsDTO({
    required super.email,
    required super.password,
  });

  LoginCredentialsDTO copyWith({
    String? email,
    String? password,
  }) {
    return LoginCredentialsDTO(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  factory LoginCredentialsDTO.fromJson(String json) {
    return LoginCredentialsDTO.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory LoginCredentialsDTO.fromMap(Map<String, dynamic> json) {
    return LoginCredentialsDTO(
      email: json[AuthField.email.value] as String,
      password: json[AuthField.password.value] as String,
    );
  }

  factory LoginCredentialsDTO.fromEntity(LoginCredentials entity) {
    return LoginCredentialsDTO(
      email: entity.email,
      password: entity.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      AuthField.email.value: email,
      AuthField.password.value: password,
    };
  }
}
