import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/di/dependency_injector.dart';

import '../../../../../core/authentication/provider.dart';
import '../../../domain/entities/password_reset_request_params.dart';
import '../../../domain/entities/register_credentials.dart';
import '../../../domain/entities/reset_password_response.dart';
import '../../../domain/use_cases/send_otp_to_reset_password.dart';
import '../../verify_otp/view/verify_otp_view.dart';
import 'state.dart';

final class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(InitState());

  factory RegisterCubit.of(BuildContext context) {
    return BlocProvider.of<RegisterCubit>(context);
  }

  final formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final counteryCodeController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> register(BuildContext context) async {
    try {
      if (formKey.currentState?.validate() != true) {
        emit(NotValidDataState());
        return;
      }
      if (phoneController.text.isEmpty) {
        emit(NotValidDataState());
        return;
      }
      final response = await _sendOtp();

      final res = await Navigator.pushNamed(
        context,
        VerifyResetPasswordOTPView.routeName,
        arguments: ResetPasswordResponse(
          otp: response.otp,
          email: response.email,
          message: response.message,
          popAfterVerify: true,
        ),
      ) as ResetPasswordResponse?;

      if (res == null) {
        emit(ExceptionState(error: 'يجب تأكيد البريد الإلكترونى أولا'));
        return;
      }

      final user = await AuthenticationProvider.instance.register(
        credentials: RegisterCredentials(
          fullName: fullNameController.text,
          email: emailController.text,
          countryCode: counteryCodeController.text,
          phone: phoneController.text,
          password: passwordController.text,
          otp: res.otp,
        ),
      );

      emit(RegisteredState(user: user));
    } catch (e) {
      emit(ExceptionState(error: e));
    }
  }

  Future<ResetPasswordResponse> _sendOtp() async {
    final email = emailController.text;

    final useCase = SendOtpToResetPassword(
      repository: DependencyInjector.authenticationRepository,
    );
    return useCase.call(
      parameters: PasswordResetRequestParameters(email: email),
    );
  }
}
