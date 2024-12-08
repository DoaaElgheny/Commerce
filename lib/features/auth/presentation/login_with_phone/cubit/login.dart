import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/authentication/provider.dart';
import '../../../domain/entities/login_with_phone_credentials.dart';
import 'states.dart';

final class LoginWithPhoneCubit extends Cubit<LoginWithPhoneState> {
  LoginWithPhoneCubit() : super(InitState());

  factory LoginWithPhoneCubit.of(BuildContext context) {
    return BlocProvider.of<LoginWithPhoneCubit>(context);
  }

  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    try {
      if (phoneController.text.isEmpty) {
        emit(NotValidDataState());
        return;
      }
      if (formKey.currentState?.validate() != true) {
        emit(NotValidDataState());
        return;
      }
      final user = await AuthenticationProvider.instance.loginWithPhone(
        credentials: LoginWithPhoneCredentials(
          phone: phoneController.text,
          password: passwordController.text,
        ),
      );
      emit(LoggedInState(user: user));
    } catch (e, s) {
      log('Exception: $e $s');
      emit(ExceptionState(error: e));
    }
  }
}
