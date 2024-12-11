import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/di/dependency_injector.dart';
import 'package:qubeCommerce/features/auth/presentation/login/view/widget/email_field.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/shared_widgets/images.dart';
import '../../../../../network/exception/response.dart';
import '../../../../../shared/widget/loading_btn.dart';
import '../../../../../shared/widget/snack_bar.dart';
import '../../verify_otp/view/verify_otp_view.dart';
import '../view_model/forget_password.dart';
import '../view_model/states.dart';
import 'widget/forget_password_text.dart';

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
            backgroundColor: Colors.transparent,

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
                        )),
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
                                          const SizedBox(height: 25.0),
                                          const Center(
                                            child: Text(
                                              "مرحبًا، دعنا نسجل الدخول ونبدأ!",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16.0,
                                                color: Color(0xFF06A6F1),
                                              ),
                                            ),
                                          ),
                                          const ForgetPasswordText(),
                                          EmailField(
                                            controller: cubit.emailController,
                                          ),
                                          const SizedBox(height: 30),
                                          LoadingButton(
                                            onTap: cubit.sendOtpToResetPassword,
                                            name: "إرسال رمز التحقق",
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
            // CustomScrollView(
            //   slivers: [
            //     SliverPadding(
            //       padding: const EdgeInsets.all(16),
            //       sliver: SliverToBoxAdapter(
            //         child: Form(
            //           key: cubit.formKey,
            //           child: Column(
            //             children: [
            //               const SizedBox(height: 40),
            //               const WelcomeMes(),
            //               const ForgetPasswordText(),
            //               EmailField(
            //                 controller: cubit.emailController,
            //               ),
            //               const SizedBox(height: 30),
            //               ContinueBtn(
            //                 onTap: cubit.sendOtpToResetPassword,
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

void _stateHandler(BuildContext context, ForgetPasswordStates state) {
  switch (state) {
    case InitState():
      return;
    case NotValidDataState():
      return;
    case OtpSentState(response: final response):
      SnackBarUtility.successSnackBar(context, response.message);

      Navigator.pushNamed(
        context,
        VerifyResetPasswordOTPView.routeName,
        arguments: response,
      );
    case ExceptionState():
      final error = state.error;
      SnackBarUtility.errorSnackBar(
        context,
        (error is ResponseException) ? error.message : 'حاول مجددا',
      );
  }
}
