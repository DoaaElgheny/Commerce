import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/reset_password_parameters.dart';
import '../../../domain/entities/reset_password_response.dart';
import '../../../domain/repositories/authentication.dart';
import '../../../domain/use_cases/reset_password_by_otp.dart';
import 'state.dart';

final class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({
    required ResetPasswordResponse parameters,
    required AuthenticationBaseRepository repository,
  })  : _parameters = parameters,
        _repository = repository,
        super(InitState());

  final ResetPasswordResponse _parameters;
  final AuthenticationBaseRepository _repository;
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  factory ResetPasswordCubit.of(BuildContext context) {
    return BlocProvider.of<ResetPasswordCubit>(context);
  }

  Future<void> resetPassword() async {
    try {
      if (formKey.currentState?.validate() != true) {
        emit(NotValidDataState());
        return;
      }

      final useCase = ResetPasswordByOtp(repository: _repository);
      final user = await useCase.call(
        parameters: ResetPasswordParameters(
          otp: _parameters.otp,
          email: _parameters.email,
          password: passwordController.text,
        ),
      );

      emit(PasswordHasBeenResetState(user: user));
    } catch (e) {
      emit(ExceptionState(error: e));
    }
  }
}
