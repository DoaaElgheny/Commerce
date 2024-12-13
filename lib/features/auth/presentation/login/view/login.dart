import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/features/auth/presentation/login_with_phone/view/login.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../network/exception/response.dart';
import '../../../../../shared/widget/auth.dart';
import '../../../../../shared/widget/snack_bar.dart';
import '../cubit/login.dart';
import '../cubit/states.dart';
import 'widget/auth_btn.dart';
import 'widget/email_field.dart';
import 'widget/forget_password_btn.dart';
import 'widget/login_btn.dart';
import 'widget/new_account_btn.dart';
import 'widget/password_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: _stateHandler,
        builder: (context, state) {
          final cubit = LoginCubit.of(context);
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
                Container(
                  margin: const EdgeInsets.only(top: 0.0),
                  child: Form(
                    key: cubit.formKey,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        const AuthBackground(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 17,
                            vertical: 10,
                          ),
                          child: Column(
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
                              EmailField(
                                controller: cubit.emailController,
                              ),
                              const SizedBox(height: 20.0),
                              PasswordField(
                                controller: cubit.passwordController,
                              ),
                              Container(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: const ForgetPasswordBtn(),
                              ),
                              const SizedBox(height: 20.0),
                              const Text(
                                'أو قم بتسجيل الدخول من خلال',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF06A6F1),
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              AuthButtons(
                                onGoogle: () {},
                                onPhone: () {
                                  Navigator.pushNamed(
                                    context,
                                    LoginWithPhoneView.routeName,
                                  );
                                },
                              ),
                              const SizedBox(height: 30.0),
                              LoginBtn(onPressed: cubit.login),
                              const SizedBox(height: 5),
                              const NewAccountBtn(),
                              const SizedBox(height: 91),
                              const SizedBox(height: 7),
                            ],
                          ),
                        ),
                      ],
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

void _stateHandler(BuildContext context, LoginState state) {
  switch (state) {
    case InitState():
      return;
    case NotValidDataState():
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
