import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/otp_confirmation_parameters.dart';
import '../../../domain/entities/password_reset_request_params.dart';
import '../../../domain/repositories/authentication.dart';
import '../../../domain/use_cases/confirm_otp_to_reset_password.dart';
import '../../../domain/use_cases/send_otp_to_reset_password.dart';
import 'states.dart';

final class VerifyResetPasswordOTPCubit
    extends Cubit<VerifyResetPasswordOTPState> {
  VerifyResetPasswordOTPCubit({
    required this.phone,
    required AuthenticationBaseRepository repository,
  })  : _repository = repository,
        super(InitState());

  final String phone;
  final AuthenticationBaseRepository _repository;
  final pinCodeController = TextEditingController();

  factory VerifyResetPasswordOTPCubit.of(BuildContext context) {
    return BlocProvider.of<VerifyResetPasswordOTPCubit>(context);
  }

  Future<void> resendOTP() async {
    try {
      final usecase = SendOtpToResetPassword(repository: _repository);
      await usecase.call(
        parameters: PasswordResetRequestParameters(phone: phone),
      );

      emit(OtpSentState(phone: phone));
    } catch (e) {
      emit(ExceptionState(error: e));
    }
  }

  Future<void> verifyOTP() async {
    try {
      final otp = pinCodeController.text;
      if (otp.length != 6) {
        emit(NotValidOTPState(otp: otp));
        return;
      }

      final usecase = ConfirmOtpToResetPassword(repository: _repository);
      await usecase.call(
        parameters: OtpConfirmationParameters(otp: otp, phone: phone),
      );

      emit(OtpVerifiedState(phone: phone, otp: otp));
    } catch (e) {
      emit(ExceptionState(error: e));
    }
  }
}
