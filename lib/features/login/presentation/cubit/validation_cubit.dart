import 'package:bloc/bloc.dart';
import 'package:qubeCommerce/features/login/presentation/cubit/validation_state.dart';

class FormValidationCubit extends Cubit<FormValidationState> {
  FormValidationCubit() : super(FormValidationValid());
  bool isValidName = true;
  bool isValidPhoneNumber = false;
  bool isValidEmail = true;
  bool isValidPassword = true;
  bool isValidOldPassword = true;
  bool isValidConfirmPassword = true;

  bool validateRegxEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }

  void validateFullName(String value) {
    if (value.isEmpty) {
      isValidName = false;
      emit(FormValidationEmptyFullName());
    } else {
      isValidName = true;
      emit(FormValidationValid());
    }
  }

  bool validateRegxPassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }

  bool validateRegxPhoneNumber(String value) {
    String pattern = r'^\+?0[0-9]{9}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }

  void validateEmail(String value) {
    if (value.isEmpty) {
      emit(FormValidationEmptyEmail());
      isValidEmail = false;
    } else if (validateRegxEmail(value)) {
      emit(FormValidationInvalidEmail());
      isValidEmail = false;
    } else {
      emit(FormValidationValid());
      isValidEmail = true;
    }
  }

  void validatePassword({required String password}) {
    if (password.isEmpty) {
      emit(FormValidationEmptyPassword());
      isValidPassword = false;
    } else if (validateRegxPassword(password)) {
      emit(FormValidationInvalidPassword());
      isValidPassword = false;
    } else {
      emit(FormValidationValid());
      isValidPassword = true;
    }
  }

  void validateOldPassword({required String password}) {
    if (password.isEmpty) {
      emit(FormValidationEmptyPassword());
      isValidOldPassword = false;
    } else if (validateRegxPassword(password)) {
      emit(FormValidationInvalidPassword());
      isValidOldPassword = false;
    } else {
      emit(FormValidationValid());
      isValidOldPassword = true;
    }
  }

  void validatePhoneNumber(String value) {
    if (value.isEmpty) {
      isValidPhoneNumber = false;
      emit(FormValidationEmptyPhoneNumber());
    } else if (value.length < 9) {
      isValidPhoneNumber = false;
      emit(FormValidationInvalidPhoneNumber());
    } else {
      isValidPhoneNumber = true;
      emit(FormValidationValid());
    }
  }

  void validatePasswordConfirmation({String? pass, String? confirmPass}) {
    if (pass == null || pass.isEmpty || pass != confirmPass) {
      isValidConfirmPassword = false;
      emit(FormValidationEmptyPasswordConfirmation());
    } else {
      isValidConfirmPassword = true;
      emit(FormValidationValid());
    }
  }

  void clearValidation() {
    isValidEmail = true;
    isValidPassword = true;
  }
}
