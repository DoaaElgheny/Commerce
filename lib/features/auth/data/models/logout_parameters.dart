import 'dart:convert';

import '../../domain/entities/logout_params.dart';
import '../../domain/enums/field.dart';

final class LogoutParametersDTO extends LogoutParameters {
  const LogoutParametersDTO({
    required super.token,
  });

  LogoutParametersDTO copyWith({
    required String? token,
  }) {
    return LogoutParametersDTO(
      token: token ?? this.token,
    );
  }

  factory LogoutParametersDTO.fromJson(String json) {
    return LogoutParametersDTO.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory LogoutParametersDTO.fromMap(Map<String, dynamic> json) {
    return LogoutParametersDTO(
      token: json[AuthField.token.value] as String,
    );
  }

  factory LogoutParametersDTO.fromEntity(
    LogoutParameters entity,
  ) {
    return LogoutParametersDTO(
      token: entity.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      AuthField.token.value: token,
    };
  }
}
