import 'package:flutter/material.dart';
import 'package:qubeCommerce/core/shared_widgets/images.dart';
import 'package:qubeCommerce/core/utils/app_colors.dart';
import 'package:qubeCommerce/features/login/presentation/widgets/auth_scaffold.dart';
import 'package:qubeCommerce/features/login/presentation/widgets/sign_form.dart';
import 'package:qubeCommerce/features/sign_up/presentation/pages/sign_up_screen.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  final SizedBox _sizedBox = const SizedBox(
    height: 20,
  );

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      appBarBottom: Center(
        child: Image.asset(Images.backGroundPng),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        // child: BlocListener<SignUpExternalCubit, SignUpExternalState>(
        // listener: (context, state) {
        //   if (state is SignUpExternalLoading) {
        //     EasyLoading.show(
        //         status: 'loading', maskType: EasyLoadingMaskType.black);
        //   } else if (state is SignUpExternalSuccess) {
        //     // بعد نجاح تسجيل الدخول الخارجي
        //     // requestExrernalLogin(context: context, value: state.request);
        //   } else if (state is SignUpExternalError) {
        //     EasyLoading.showError(state.message);
        //   }
        // },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              _sizedBox,
              const Text(
                "Welcome, let's log in and get started!",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                  color: Color(0xFF06A6F1),
                ),
              ),
              _sizedBox,
              const SignForm(),
              _sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have Account",
                    style: const TextStyle(
                      color: AppColors.textGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: (15),
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => SignUpScreen()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: (15),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              _sizedBox,
            ],
          ),
        ),
        //),
      ),
    );
  }
}
