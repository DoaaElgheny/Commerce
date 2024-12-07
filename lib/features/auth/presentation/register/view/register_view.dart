import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/config/routes/app_routes.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../network/exception/response.dart';
import '../../../../../shared/widget/snack_bar.dart';
import '../../../domain/validators/auth.dart';
import '../../../domain/validators/enums/confirm_password_valid_state.dart';
import '../view_model/cubit.dart';
import '../view_model/state.dart';
import 'widget/confi_password.dart';
import 'widget/data_about_you.dart';
import 'widget/email_field.dart';
import 'widget/first_name_field.dart';
import 'widget/last_name_field.dart';
import 'widget/password_field.dart';
import 'widget/register_btn.dart';
import 'widget/welcome_mes.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static const routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: _stateHandler,
      builder: (context, state) {
        final cubit = RegisterCubit.of(context);
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: CustomScrollView(
            slivers: [
              const SliverAppBar(expandedHeight: 70),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        const WelcomeMes(),
                        const DataAboutYou(),
                        const SizedBox(height: 22),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: FirstNameField(
                                controller: cubit.firstNameController,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: LastNameField(
                                controller: cubit.lastNameController,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        EmailField(controller: cubit.emailController),
                        const SizedBox(height: 12),
                        const SizedBox(height: 12),
                        PasswordField(controller: cubit.passwordController),
                        const SizedBox(height: 12),
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
                        const SizedBox(height: 60),
                        RegisterBtn(
                          onTap: cubit.register,
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

void _stateHandler(BuildContext context, RegisterState state) {
  switch (state) {
    case InitState():
      return;
    case NotValidDataState():
      // SnackBarUtility.errorSnackBar(
      //   context,
      //   notValidData,
      // );
      return;
    case RegisteredState():
      SnackBarUtility.successSnackBar(
        context,
        'Registered Successfully',
      );
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.homeScreen,
        (route) => false,
      );
    case ExceptionState():
      final error = state.error;
      SnackBarUtility.errorSnackBar(
        context,
        (error is ResponseException) ? error.message : 'Try Again',
      );
    case CompleteState():
      SnackBarUtility.successSnackBar(
        context,
        'Created Successfully',
      );
  }
}
