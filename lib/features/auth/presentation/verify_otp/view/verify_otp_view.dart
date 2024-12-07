import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../network/exception/response.dart';
import '../../../../../shared/widget/snack_bar.dart';
import '../../../domain/entities/screen_arguments/reset_password.dart';
import '../../../domain/entities/screen_arguments/verify_reset_password_otp.dart';
import '../../reset_password/view/reset_password_view.dart';
import '../view_model/cubit.dart';
import '../view_model/states.dart';
import 'widget/phone_field.dart';
import 'widget/reset_code_btn.dart';
import 'widget/text_verify.dart';
import 'widget/verify_btn.dart';
import 'widget/welcome_mes.dart';

class VerifyResetPasswordOTPView extends StatefulWidget {
  const VerifyResetPasswordOTPView({
    required this.parameters,
    super.key,
  });

  final VerifyResetPasswordOTPViewParameters parameters;

  static const routeName = '/verify-reset-password-otp';

  @override
  State<VerifyResetPasswordOTPView> createState() =>
      _VerifyResetPasswordOTPViewState();
}

class _VerifyResetPasswordOTPViewState
    extends State<VerifyResetPasswordOTPView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyResetPasswordOTPCubit,
        VerifyResetPasswordOTPState>(
      listener: _stateHandler,
      builder: (context, state) {
        final cubit = VerifyResetPasswordOTPCubit.of(context);
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: CustomScrollView(
            slivers: [
              const SliverAppBar(),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      const WelcomeMes(),
                      const TextVerify(),
                      const Text(
                        "Please enter the verification code that was sent to you",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 25),
                      PhoneField(
                        controller: cubit.pinCodeController,
                        onComplete: (v) async {
                          await cubit.verifyOTP();
                        },
                      ),
                      if (state is NotValidOTPState)
                        const Text(
                          'Invalid OTP',
                          style: TextStyle(
                            color: AppColors.appRed,
                          ),
                        ),
                      const SizedBox(height: 30.0),
                      VerifyBtn(
                        onPressed: cubit.verifyOTP,
                      ),
                      const SizedBox(height: 15),
                      ResetCodeBtn(
                        onSend: cubit.resendOTP,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

void _stateHandler(BuildContext context, VerifyResetPasswordOTPState state) {
  switch (state) {
    case InitState():
      return;
    case NotValidOTPState():
      // SnackBarUtility.errorSnackBar(
      //   context,
      //   notValidData,
      // );
      return;
    case OtpVerifiedState():
      SnackBarUtility.successSnackBar(
        context,
        'OTP Verified Successfully',
      );
      Navigator.pushReplacementNamed(
        context,
        ResetPasswordView.routeName,
        arguments: ResetPasswordViewParameters(
          phone: state.phone,
          otp: state.otp,
        ),
      );
    case ExceptionState():
      final error = state.error;
      SnackBarUtility.errorSnackBar(
        context,
        (error is ResponseException) ? error.message : 'Try Again',
      );

    case OtpSentState():
      SnackBarUtility.successSnackBar(
        context,
        'OTP Sent Successfully',
      );
  }
}
