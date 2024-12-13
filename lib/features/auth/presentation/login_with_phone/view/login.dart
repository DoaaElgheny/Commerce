import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/features/auth/presentation/login_with_phone/view/widget/forget_password_btn.dart';
import 'package:qubeCommerce/shared/widget/auth.dart';

import '../../../../../config/routes/app_routes.dart';
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
            backgroundColor: Colors.white,
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
                ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const AuthBackground(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 17,
                        vertical: 10,
                      ),
                      child: Form(
                        key: cubit.formKey,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 25.0),
                            const Center(
                              child: Text(
                                "مرحبًا، لنقم بتسجيل الدخول ونبدأ!",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.0,
                                  color: Color(0xFF06A6F1),
                                ),
                              ),
                            ),
                            const SizedBox(height: 50),
                            LoginWithPhoneField(
                              countryCode: cubit.countryCodeController,
                              controller: cubit.phoneController,
                            ),
                            const SizedBox(height: 20.0),
                            PasswordField(
                              controller: cubit.passwordController,
                            ),
                            
                             Container(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: const ForgetPasswordBtn(),
                              ),
                              const SizedBox(height: 10.0),
                            LoginBtn(onPressed: cubit.login),
                            const SizedBox(height: 5),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'التسجيل عن طريق البريد الإلكترونى',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
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
                  ],
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
        Routes.bottomNavigationBarScreen,
        (route) => false,
      );
    case ExceptionState():
      final error = state.error;

      SnackBarUtility.errorSnackBar(
        context,
        (error is ResponseException) ? error.message : 'حاول مجددا',
      );
      return;
  }
}
