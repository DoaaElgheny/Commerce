import 'dart:convert';

import '../../../../shared/model/wrapped.dart';
import '../../domain/entities/otp_confirmation_parameters.dart';
import '../../domain/enums/field.dart';

final class OtpConfirmationParametersDTO extends OtpConfirmationParameters {
  const OtpConfirmationParametersDTO({
    required super.otp,
    super.phone,
    super.email,
  });

  OtpConfirmationParametersDTO copyWith({
    Wrapped<String>? email,
    String? otp,
    Wrapped<String>? phone,
  }) {
    return OtpConfirmationParametersDTO(
      email: email?.value ?? this.email,
      otp: otp ?? this.otp,
      phone: phone?.value ?? this.phone,
    );
  }

  factory OtpConfirmationParametersDTO.fromJson(String json) {
    return OtpConfirmationParametersDTO.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory OtpConfirmationParametersDTO.fromMap(Map<String, dynamic> json) {
    return OtpConfirmationParametersDTO(
      email: json[AuthField.email.value] as String?,
      otp: json[AuthField.otp.value] as String,
      phone: json[AuthField.phone.value] as String?,
    );
  }

  factory OtpConfirmationParametersDTO.fromEntity(
    OtpConfirmationParameters entity,
  ) {
    return OtpConfirmationParametersDTO(
      email: entity.email,
      otp: entity.otp,
      phone: entity.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      AuthField.email.value: email,
      AuthField.otp.value: otp,
      AuthField.phone.value: phone,
    };
  }
}
