import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/shared_widgets/images.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../network/exception/response.dart';
import '../../../../../shared/widget/snack_bar.dart';
import '../cubit/login.dart';
import '../cubit/states.dart';
import 'widget/login_btn.dart';
import 'widget/password_field.dart';
import 'widget/phone_field.dart';

class LoginWithPhoneView extends StatelessWidget {
  const LoginWithPhoneView({super.key});

  static const routeName = '/login-with-phone';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginWithPhoneCubit(),
      child: BlocConsumer<LoginWithPhoneCubit, LoginWithPhoneState>(
        listener: _stateHandler,
        builder: (context, state) {
          final cubit = LoginWithPhoneCubit.of(context);
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
                                              "Welcome, let's log in and get started!",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16.0,
                                                color: Color(0xFF06A6F1),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 50),
                                          LoginWithPhoneField(
                                            controller: cubit.phoneController,
                                          ),
                                          const SizedBox(height: 20.0),
                                          PasswordField(
                                            controller:
                                                cubit.passwordController,
                                          ),
                                          const SizedBox(height: 30.0),
                                          LoginBtn(onPressed: cubit.login),
                                          const SizedBox(height: 5),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'Login With E-mail',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: AppColors.primaryColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.normal,
                                              ),
                                            ),
                                          ),
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
          );
        },
      ),
    );
  }
}

void _stateHandler(BuildContext context, LoginWithPhoneState state) {
  switch (state) {
    case InitState():
      return;
    case NotValidDataState():
      SnackBarUtility.errorSnackBar(
        context,
        'Not Valid Fields',
      );
      return;
    case LoggedInState():
      // if (state.user.details.phone == null) {
      //   Navigator.pushNamedAndRemoveUntil(
      //       context, CompleteView.routeName, (route) => false);
      //   return;
      // }

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
      return;
  }
}
