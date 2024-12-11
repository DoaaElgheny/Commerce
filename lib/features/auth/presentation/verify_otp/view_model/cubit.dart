import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/password_reset_request_params.dart';
import '../../../domain/entities/reset_password_response.dart';
import '../../../domain/repositories/authentication.dart';
import '../../../domain/use_cases/send_otp_to_reset_password.dart';
import 'states.dart';

final class VerifyResetPasswordOTPCubit
    extends Cubit<VerifyResetPasswordOTPState> {
  VerifyResetPasswordOTPCubit({
    required this.params,
    required AuthenticationBaseRepository repository,
  })  : _repository = repository,
        super(InitState());

  final AuthenticationBaseRepository _repository;
  final pinCodeController = TextEditingController();
  ResetPasswordResponse params;

  factory VerifyResetPasswordOTPCubit.of(BuildContext context) {
    return BlocProvider.of<VerifyResetPasswordOTPCubit>(context);
  }

  Future<void> resendOTP() async {
    try {
      final useCase = SendOtpToResetPassword(repository: _repository);
      params = await useCase.call(
        parameters: PasswordResetRequestParameters(
          email: params.email,
        ),
      );

      emit(OtpSentState(email: params.email));
    } catch (e) {
      emit(ExceptionState(error: e));
    }
  }

  Future<void> verifyOTP() async {
    try {
      final otp = pinCodeController.text;
      if (otp.length != 5 || params.otp != otp) {
        emit(NotValidOTPState(otp: otp));
        return;
      }

      emit(OtpVerifiedState(response: params));
    } catch (e) {
      emit(ExceptionState(error: e));
    }
  }
}
