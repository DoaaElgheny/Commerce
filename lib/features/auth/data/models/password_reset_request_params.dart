import 'dart:convert';

import '../../../../shared/model/wrapped.dart';
import '../../domain/entities/password_reset_request_params.dart';
import '../../domain/enums/field.dart';

final class PasswordResetRequestParametersDTO
    extends PasswordResetRequestParameters {
  const PasswordResetRequestParametersDTO({
    required super.email,
  });

  PasswordResetRequestParametersDTO copyWith({
    Wrapped<String>? email,
  }) {
    return PasswordResetRequestParametersDTO(
      email: email?.value ?? this.email,
    );
  }

  factory PasswordResetRequestParametersDTO.fromJson(String json) {
    return PasswordResetRequestParametersDTO.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory PasswordResetRequestParametersDTO.fromMap(Map<String, dynamic> json) {
    return PasswordResetRequestParametersDTO(
      email: json[AuthField.email.value] as String,
    );
  }

  factory PasswordResetRequestParametersDTO.fromEntity(
    PasswordResetRequestParameters entity,
  ) {
    return PasswordResetRequestParametersDTO(
      email: entity.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      AuthField.email.value: email,
    };
  }
}
