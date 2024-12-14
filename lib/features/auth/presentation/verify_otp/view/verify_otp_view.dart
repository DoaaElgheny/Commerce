import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/di/dependency_injector.dart';
import 'package:qubeCommerce/features/auth/presentation/register/view/widget/already_have_account.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/shared_widgets/images.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../network/exception/response.dart';
import '../../../../../shared/widget/loading_btn.dart';
import '../../../../../shared/widget/snack_bar.dart';
import '../../../domain/entities/reset_password_response.dart';
import '../../reset_password/view/reset_password_view.dart';
import '../view_model/cubit.dart';
import '../view_model/states.dart';
import 'widget/phone_field.dart';
import 'widget/reset_code_btn.dart';
import 'widget/text_verify.dart';

class VerifyResetPasswordOTPView extends StatefulWidget {
  const VerifyResetPasswordOTPView({
    required this.parameters,
    super.key,
  });

  final ResetPasswordResponse parameters;

  static const routeName = '/verify-reset-password-otp';

  @override
  State<VerifyResetPasswordOTPView> createState() =>
      _VerifyResetPasswordOTPViewState();
}

class _VerifyResetPasswordOTPViewState
    extends State<VerifyResetPasswordOTPView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyResetPasswordOTPCubit(
        repository: DependencyInjector.authenticationRepository,
        params: widget.parameters,
      ),
      child: BlocConsumer<VerifyResetPasswordOTPCubit,
          VerifyResetPasswordOTPState>(
        listener: _stateHandler,
        builder: (context, state) {
          final cubit = VerifyResetPasswordOTPCubit.of(context);
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
                              physics: const NeverScrollableScrollPhysics(),
                              slivers: [
                                SliverPadding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 17,
                                    vertical: 10,
                                  ),
                                  sliver: SliverToBoxAdapter(
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 40.0),
                                        const TextVerify(),
                                        const Text(
                                          "يرجى إدخال رمز التحقق الذي تم إرساله إليك",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black54,
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
                                            'رمز غير صالح',
                                            style: TextStyle(
                                              color: AppColors.appRed,
                                            ),
                                          ),
                                        if (kDebugMode)
                                          Text(
                                            cubit.params.otp,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        LoadingButton(
                                          onTap: cubit.verifyOTP,
                                          name: 'تأكيد',
                                        ),
                                        const SizedBox(height: 15),
                                        ResetCodeBtn(
                                          onSend: cubit.resendOTP,
                                        ),
                                         const  AlreadyHaveAccountBtn(),
                                      ],
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
            //         child: Column(
            //           children: [
            //             const SizedBox(height: 40),

            //           ],
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
      case OtpVerifiedState(response: final response):
        SnackBarUtility.successSnackBar(
          context,
          'تم التأكيد بنجاح',
        );
        if (widget.parameters.popAfterVerify) {
          Navigator.pop(context, response);
          return;
        }
        Navigator.pushReplacementNamed(
          context,
          ResetPasswordView.routeName,
          arguments: response,
        );
      case ExceptionState():
        final error = state.error;
        SnackBarUtility.errorSnackBar(
          context,
          (error is ResponseException) ? error.message : 'حاول مجددا',
        );

      case OtpSentState():
        SnackBarUtility.successSnackBar(
          context,
          'تم الإرسال بنجاح',
        );
    }
  }
}
