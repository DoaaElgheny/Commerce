import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/config/routes/app_routes.dart';
import 'package:qubeCommerce/features/auth/presentation/login_with_phone/view/widget/phone_field.dart';
import 'package:qubeCommerce/shared/widget/auth.dart';

import '../../../../../network/exception/response.dart';
import '../../../../../shared/widget/snack_bar.dart';
import '../../login/view/widget/email_field.dart';
import '../../login/view/widget/password_field.dart';
import '../view_model/cubit.dart';
import '../view_model/state.dart';
import 'widget/first_name_field.dart';
import 'widget/register_btn.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static const routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: _stateHandler,
        builder: (context, state) {
          final cubit = RegisterCubit.of(context);
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
                            FirstNameField(
                              controller: cubit.fullNameController,
                            ),
                            const SizedBox(height: 24),
                            EmailField(
                              controller: cubit.emailController,
                            ),
                            const SizedBox(height: 24),
                            LoginWithPhoneField(
                              countryCode: cubit.counteryCodeController,
                              controller: cubit.phoneController,
                            ),
                            const SizedBox(height: 14),
                            PasswordField(
                              controller: cubit.passwordController,
                            ),
                            const SizedBox(height: 12),
                            const SizedBox(height: 60),
                            RegisterBtn(
                              onTap: () async {
                                await cubit.register(context);
                              },
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

void _stateHandler(BuildContext context, RegisterState state) {
  switch (state) {
    case InitState():
      return;
    case NotValidDataState():
      SnackBarUtility.errorSnackBar(
        context,
        'معطيات غير صالحة',
      );
      return;
    case RegisteredState():
      SnackBarUtility.successSnackBar(
        context,
        'تم الإنشاء بنجاح',
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
        (error is ResponseException)
            ? error.message
            : (error is String)
                ? error
                : 'حاول مجددا',
      );
    case CompleteState():
      SnackBarUtility.successSnackBar(
        context,
        'تم الإنشاء بنجاح',
      );
  }
}
