import 'dart:convert';

import 'package:intl/intl.dart';

import '../../../../shared/enum/gender.dart';
import '../../../../shared/model/wrapped.dart';
import '../../domain/entities/register_credentials.dart';
import '../../domain/enums/field.dart';

final class RegisterCredentialsDTO extends RegisterCredentials {
  const RegisterCredentialsDTO({
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.password,
    required super.passwordConfirmation,
    super.bio,
    super.birthDay,
    super.phone,
  });

  RegisterCredentialsDTO copyWith({
    Wrapped<String>? bio,
    Wrapped<DateTime>? birthDay,
    String? email,
    String? firstName,
    Wrapped<Gender>? gender,
    String? lastName,
    String? password,
    String? passwordConfirmation,
    Wrapped<String>? phone,
  }) {
    return RegisterCredentialsDTO(
      bio: bio?.value ?? this.bio,
      birthDay: birthDay?.value ?? this.birthDay,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      phone: phone?.value ?? this.phone,
    );
  }

  factory RegisterCredentialsDTO.fromJson(String json) {
    return RegisterCredentialsDTO.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  String toJson({
    String dateFormat = 'yyyy-MM-dd',
  }) {
    return jsonEncode(toMap(dateFormat: dateFormat));
  }

  factory RegisterCredentialsDTO.fromMap(Map<String, dynamic> json) {
    return RegisterCredentialsDTO(
      bio: json[AuthField.bio.value] as String?,
      birthDay: DateTime.tryParse(
        json[AuthField.birthDay.value] as String? ?? '',
      ),
      email: json[AuthField.email.value] as String,
      firstName: json[AuthField.firstName.value] as String,
      lastName: json[AuthField.lastName.value] as String,
      password: json[AuthField.password.value] as String,
      passwordConfirmation:
          json[AuthField.passwordConfirmation.value] as String,
      phone: json[AuthField.phone.value] as String?,
    );
  }

  factory RegisterCredentialsDTO.fromEntity(
    RegisterCredentials entity,
  ) {
    return RegisterCredentialsDTO(
      bio: entity.bio,
      birthDay: entity.birthDay,
      email: entity.email,
      firstName: entity.firstName,
      lastName: entity.lastName,
      password: entity.password,
      passwordConfirmation: entity.passwordConfirmation,
      phone: entity.phone,
    );
  }

  Map<String, dynamic> toMap({
    String dateFormat = 'yyyy-MM-dd',
  }) {
    return <String, dynamic>{
      AuthField.bio.value: bio,
      AuthField.birthDay.value: birthDay == null
          ? null
          : DateFormat(dateFormat).format(
              birthDay!,
            ),
      AuthField.email.value: email,
      AuthField.firstName.value: firstName,
      AuthField.lastName.value: lastName,
      AuthField.password.value: password,
      AuthField.passwordConfirmation.value: passwordConfirmation,
      AuthField.phone.value: phone,
    };
  }
}
