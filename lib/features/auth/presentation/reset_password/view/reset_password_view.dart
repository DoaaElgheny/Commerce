import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/di/dependency_injector.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/shared_widgets/images.dart';
import '../../../../../network/exception/response.dart';
import '../../../../../shared/widget/loading_btn.dart';
import '../../../../../shared/widget/snack_bar.dart';
import '../../../domain/entities/reset_password_response.dart';
import '../../../domain/validators/auth.dart';
import '../../../domain/validators/enums/confirm_password_valid_state.dart';
import '../../login/view/login.dart';
import '../view_model/cubit.dart';
import '../view_model/state.dart';
import 'widget/confirm_password_field.dart';
import 'widget/password_field.dart';
import 'widget/reset_password_text.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({
    required this.parameters,
    super.key,
  });

  final ResetPasswordResponse parameters;

  static const routeName = '/reset-password';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(
        repository: DependencyInjector.authenticationRepository,
        parameters: parameters,
      ),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: _stateHandler,
        builder: (context, state) {
          final cubit = ResetPasswordCubit.of(context);
          return Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,

            body: Stack(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/images/png/SS_Bottom.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: Stack(
                    children: [
                      Container(
                        height: 30.h,
                        width: 130.w,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              Images.authbackGroundPng,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom: 15, right: 5.w, left: 5.w, top: 1.h),
                          child: Container(
                            // height: 15.h,
                            padding: const EdgeInsets.only(bottom: 15),
                            // height: 15.h,
                            child: const Text(''),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30.h,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                          ),
                          height: double.infinity,
                          child: Container(
                            margin: const EdgeInsets.only(top: 0),
                            child: CustomScrollView(
                              slivers: [
                                SliverPadding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 17,
                                    vertical: 10,
                                  ),
                                  sliver: SliverToBoxAdapter(
                                    child: Form(
                                      key: cubit.formKey,
                                      child: Column(
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 40.0),
                                          const ResetPasswordText(),
                                          PasswordField(
                                            controller:
                                                cubit.passwordController,
                                          ),
                                          const SizedBox(height: 20),
                                          ConfirmPasswordField(
                                            controller:
                                                cubit.confirmPasswordController,
                                            validator: (value) {
                                              final state = AuthValidator
                                                  .validConfirmPassword(
                                                password: cubit
                                                    .passwordController.text,
                                                confirmPassword: value,
                                              );
                                              switch (state) {
                                                case ConfirmPasswordValidState
                                                      .valid:
                                                  return null;
                                                case ConfirmPasswordValidState
                                                      .notMatch:
                                                  return 'Password Not Match';
                                              }
                                            },
                                          ),
                                          const SizedBox(height: 40.0),
                                          LoadingButton(
                                            onTap: cubit.resetPassword,
                                            name: 'Reset Password',
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 13.h,
                        child: Center(
                          child: Image.asset(Images.backGroundPng),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // body: CustomScrollView(
            //   slivers: [
            //     const SliverAppBar(),
            //     SliverPadding(
            //       padding: const EdgeInsets.all(16),
            //       sliver: SliverToBoxAdapter(
            //         child: Form(
            //           key: cubit.formKey,
            //           child: Column(
            //             children: [
            //               const SizedBox(height: 40),
            //               const WelcomeMes(),
            //               const ResetPasswordText(),
            //               PasswordField(
            //                 controller: cubit.passwordController,
            //               ),
            //               const SizedBox(height: 20),
            //               ConfirmPasswordField(
            //                 controller: cubit.confirmPasswordController,
            //                 validator: (value) {
            //                   final state = AuthValidator.validConfirmPassword(
            //                     password: cubit.passwordController.text,
            //                     confirmPassword: value,
            //                   );
            //                   switch (state) {
            //                     case ConfirmPasswordValidState.valid:
            //                       return null;
            //                     case ConfirmPasswordValidState.notMatch:
            //                       return 'Password Not Match';
            //                   }
            //                 },
            //               ),
            //               const SizedBox(height: 20),
            //               ChangePasswordBtn(
            //                 onPressed: cubit.resetPassword,
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          );
        },
      ),
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
    case PasswordHasBeenResetState(message: final message):
      SnackBarUtility.successSnackBar(context, message);
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
