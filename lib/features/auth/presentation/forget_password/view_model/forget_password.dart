import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/password_reset_request_params.dart';
import '../../../domain/repositories/authentication.dart';
import '../../../domain/use_cases/send_otp_to_reset_password.dart';
import 'states.dart';

final class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit({
    required AuthenticationBaseRepository repository,
  })  : _repository = repository,
        super(InitState());

  final AuthenticationBaseRepository _repository;
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

  factory ForgetPasswordCubit.of(BuildContext context) {
    return BlocProvider.of<ForgetPasswordCubit>(context);
  }

  Future<void> sendOtpToResetPassword() async {
    try {
      if (formKey.currentState?.validate() != true) {
        emit(NotValidDataState());
        return;
      }

      final phone = phoneController.text;

      final usecase = SendOtpToResetPassword(repository: _repository);
      await usecase.call(
        parameters: PasswordResetRequestParameters(phone: phone),
      );

      emit(OtpSentState(phone: phone));
    } catch (e) {
      emit(ExceptionState(error: e));
    }
  }
}
