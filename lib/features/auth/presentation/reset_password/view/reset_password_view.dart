import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../network/exception/response.dart';
import '../../../../../shared/widget/snack_bar.dart';
import '../../../domain/entities/reset_password_response.dart';
import '../../../domain/validators/auth.dart';
import '../../../domain/validators/enums/confirm_password_valid_state.dart';
import '../../login/view/login.dart';
import '../view_model/cubit.dart';
import '../view_model/state.dart';
import 'widget/change_password_btn.dart';
import 'widget/confirm_password_field.dart';
import 'widget/password_field.dart';
import 'widget/reset_password_text.dart';
import 'widget/welcome_mes.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({
    required this.parameters,
    super.key,
  });

  final ResetPasswordResponse parameters;

  static const routeName = '/reset-password';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: _stateHandler,
      builder: (context, state) {
        final cubit = ResetPasswordCubit.of(context);
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: CustomScrollView(
            slivers: [
              const SliverAppBar(),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        const WelcomeMes(),
                        const ResetPasswordText(),
                        PasswordField(
                          controller: cubit.passwordController,
                        ),
                        const SizedBox(height: 20),
                        ConfirmPasswordField(
                          controller: cubit.confirmPasswordController,
                          validator: (value) {
                            final state = AuthValidator.validConfirmPassword(
                              password: cubit.passwordController.text,
                              confirmPassword: value,
                            );
                            switch (state) {
                              case ConfirmPasswordValidState.valid:
                                return null;
                              case ConfirmPasswordValidState.notMatch:
                                return 'Password Not Match';
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        ChangePasswordBtn(
                          onPressed: cubit.resetPassword,
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
    );
  }
}

void _stateHandler(BuildContext context, ResetPasswordState state) {
  switch (state) {
    case InitState():
      return;
    case NotValidDataState():
      // SnackBarUtility.errorSnackBar(
      //   context,
      //   notValidData,
      // );
      return;
    case PasswordHasBeenResetState():
      SnackBarUtility.successSnackBar(
        context,
        'Password Reset Successfully',
      );
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginView.routeName,
        (route) => false,
      );
    case ExceptionState():
      final error = state.error;
      SnackBarUtility.errorSnackBar(
        context,
        (error is ResponseException) ? error.message : 'Try Again',
      );
  }
}
