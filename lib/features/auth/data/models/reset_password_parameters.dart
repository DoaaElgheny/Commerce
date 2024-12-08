import 'dart:convert';

import '../../domain/entities/reset_password_parameters.dart';
import '../../domain/enums/field.dart';

final class ResetPasswordParametersDTO extends ResetPasswordParameters {
  const ResetPasswordParametersDTO({
    required super.otp,
    required super.password,
    required super.email,
  });

  ResetPasswordParametersDTO copyWith({
    String? email,
    String? otp,
    String? password,
  }) {
    return ResetPasswordParametersDTO(
      email: email ?? this.email,
      otp: otp ?? this.otp,
      password: password ?? this.password,
    );
  }

  factory ResetPasswordParametersDTO.fromJson(String json) {
    return ResetPasswordParametersDTO.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory ResetPasswordParametersDTO.fromMap(Map<String, dynamic> json) {
    return ResetPasswordParametersDTO(
      email: json[AuthField.userName.value] as String,
      otp: json[AuthField.otp.value] as String,
      password: json[AuthField.newPassword.value] as String,
    );
  }

  factory ResetPasswordParametersDTO.fromEntity(
    ResetPasswordParameters entity,
  ) {
    return ResetPasswordParametersDTO(
      email: entity.email,
      otp: entity.otp,
      password: entity.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      AuthField.userName.value: email,
      AuthField.otp.value: otp,
      AuthField.newPassword.value: password,
    };
  }
}
