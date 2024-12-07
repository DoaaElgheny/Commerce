import 'package:email_validator/email_validator.dart';

import 'enums/confirm_password_valid_state.dart';
import 'enums/email_valid_state.dart';
import 'enums/name_valid_state.dart';
import 'enums/password_valid_state.dart';
import 'enums/phone_valid_state.dart';

abstract final class AuthValidator {
  const AuthValidator();

  static EmailValidState validEmail(String? email) {
    if (email == null || email.isEmpty) {
      return EmailValidState.cannotBeEmpty;
    }

    return EmailValidator.validate(email)
        ? EmailValidState.valid
        : EmailValidState.notValid;
  }

  static NameValidState validName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return NameValidState.cannotBeEmpty;
    } else if (name.trim().length < 3) {
      return NameValidState.notValid;
    } else {
      return NameValidState.valid;
    }
  }

  static PasswordValidState validPassword(String? password) {
    if (password == null || password.isEmpty) {
      return PasswordValidState.cannotBeEmpty;
    } else if (password.length < 8) {
      return PasswordValidState.lessThan8Char;
    } else {
      return PasswordValidState.valid;
    }
  }

  static ConfirmPasswordValidState validConfirmPassword({
    String? password,
    String? confirmPassword,
  }) {
    if (password == confirmPassword) {
      return ConfirmPasswordValidState.valid;
    } else {
      return ConfirmPasswordValidState.notMatch;
    }
  }

  static PhoneValidState validPhone(String? phone) {
    final temp = phone?.trim();

    const pattern = r'(^[0-9]*$)';
    final regExp = RegExp(pattern);

    if (temp == null || temp.isEmpty) {
      return PhoneValidState.cannotBeEmpty;
    } else if (temp.length < 8) {
      return PhoneValidState.lessThan8Char;
    } else if (!regExp.hasMatch(temp)) {
      return PhoneValidState.notValid;
    } else {
      return PhoneValidState.valid;
    }
  }
}
