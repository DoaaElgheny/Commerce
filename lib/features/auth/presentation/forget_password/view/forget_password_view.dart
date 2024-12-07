import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/di/dependency_injector.dart';

import '../../../../../network/exception/response.dart';
import '../../../../../shared/widget/snack_bar.dart';
import '../../../domain/entities/screen_arguments/verify_reset_password_otp.dart';
import '../../login/view/widget/welcome_mes.dart';
import '../../verify_otp/view/verify_otp_view.dart';
import '../view_model/forget_password.dart';
import '../view_model/states.dart';
import 'widget/continue_btn.dart';
import 'widget/forget_password_text.dart';
import 'widget/phone_field.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  static const routeName = '/forget-password';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(
        repository: DependencyInjector.authenticationRepository,
      ),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
        listener: _stateHandler,
        builder: (context, state) {
          final cubit = ForgetPasswordCubit.of(context);
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverToBoxAdapter(
                    child: Form(
                      key: cubit.formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 40),
                          const WelcomeMes(),
                          const ForgetPasswordText(),
                          PhoneField(
                            controller: cubit.phoneController,
                          ),
                          const SizedBox(height: 30),
                          ContinueBtn(
                            onTap: cubit.sendOtpToResetPassword,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

void _stateHandler(BuildContext context, ForgetPasswordStates state) {
  switch (state) {
    case InitState():
      return;
    case NotValidDataState():
      // SnackBarUtility.errorSnackBar(
      //   context,
      //   notValidData,
      // );
      return;
    case OtpSentState():
      SnackBarUtility.successSnackBar(
        context,
        'OTP Sent Successfully',
      );
      Navigator.pushNamed(
        context,
        VerifyResetPasswordOTPView.routeName,
        arguments: VerifyResetPasswordOTPViewParameters(phone: state.phone),
      );
    case ExceptionState():
      final error = state.error;
      SnackBarUtility.errorSnackBar(
        context,
        (error is ResponseException) ? error.message : 'Try Again',
      );
  }
}
