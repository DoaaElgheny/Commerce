import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/config/routes/app_routes.dart';
import 'package:qubeCommerce/features/auth/presentation/login_with_phone/view/widget/phone_field.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/shared_widgets/images.dart';
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
            backgroundColor: Colors.transparent,
            body: SizedBox(
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
                        color: Colors.white,
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
                                      FirstNameField(
                                        controller: cubit.fullNameController,
                                      ),
                                      const SizedBox(height: 24),
                                      EmailField(
                                        controller: cubit.emailController,
                                      ),
                                      const SizedBox(height: 24),
                                      LoginWithPhoneField(
                                        controller: cubit.phoneController,
                                      ),
                                      const SizedBox(height: 14),
                                      PasswordField(
                                        controller: cubit.passwordController,
                                      ),
                                      const SizedBox(height: 12),
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
        'Not Valid Fields',
      );
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
