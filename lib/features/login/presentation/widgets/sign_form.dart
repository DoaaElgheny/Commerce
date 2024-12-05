import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qubeCommerce/core/shared_widgets/app_text_field.dart';
import 'package:qubeCommerce/core/shared_widgets/elevated_button.dart';
import 'package:qubeCommerce/core/shared_widgets/images.dart';
import 'package:qubeCommerce/core/utils/app_colors.dart';
import 'package:qubeCommerce/features/login/domain/entities/login_parameter.dart';
import 'package:qubeCommerce/features/login/presentation/cubit/login_cubit.dart';
import 'package:qubeCommerce/features/login/presentation/cubit/login_state.dart';
import 'package:qubeCommerce/features/login/presentation/cubit/validation_cubit.dart';
import 'package:qubeCommerce/features/login/presentation/cubit/validation_state.dart';
import 'package:sizer/sizer.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  _login() => BlocProvider.of<LoginCubit>(context).loginWithEmail(
      context: context,
      loginParameter: LoginParameter(
          email: context.read<LoginCubit>().emailLogin.text,
          password: context.read<LoginCubit>().passwordLogin.text));

  @override
  void initState() {
    context.read<FormValidationCubit>().clearValidation();
    context.read<LoginCubit>().emailLogin.clear();
    context.read<LoginCubit>().passwordLogin.clear();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await Firebase.initializeApp(
    //       options: DefaultFirebaseOptions.currentPlatform);
    // });
  }

  @override
  Widget build(BuildContext context) {
    final formValidationCubit = BlocProvider.of<FormValidationCubit>(context);
    return Form(
      key: _formKey,
      child: BlocConsumer<FormValidationCubit, FormValidationState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                AppTextField(
                  hasMargin: false,
                  textEditingController: context.read<LoginCubit>().emailLogin,
                  isValidated: context.read<FormValidationCubit>().isValidEmail,
                  validationText: 'required_field',
                  textHint: 'email',
                  label: Text('email'),
                  prefix: Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                  ),
                  onTextChange: (val) {
                    context.read<FormValidationCubit>().validateEmail(val);
                  },
                ),
                AppTextField(
                  hasMargin: false,
                  textEditingController:
                      context.read<LoginCubit>().passwordLogin,
                  isValidated:
                      context.read<FormValidationCubit>().isValidPassword,
                  validationText: 'password_validation',
                  isPassword: _obscureText,
                  textHint: '**********',
                  label: Text('password'),
                  prefix: Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.grey,
                  ),
                  suffix: IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.remove_red_eye_outlined,
                        color: _obscureText
                            ? AppColors.textGrey
                            : AppColors.primaryColor,
                        size: (20),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      }),
                  onTextChange: (val) {
                    context.read<FormValidationCubit>().validatePassword(
                        password:
                            context.read<LoginCubit>().passwordLogin.text);
                  },
                ),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      // onTap: () => Navigator.pushNamed(
                      //     context, ForgotPasswordScreen.routeName),
                      child: Text(
                        "forgot_pass",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppColors.primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: (30)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.transparent, // Border color
                          width: 1.0, // Border width
                        ),
                        borderRadius:
                            BorderRadius.circular(8.0), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.1), // Shadow color
                            blurRadius: 6.0, // Soft blur effect
                            offset: Offset(2, 2), // Slight shadow offset
                          ),
                        ],
                        color: Colors.white, // Button background color
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:15.0,right: 15.0),
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/images/svg/Google_icon.svg",
                          ),
                          label: const Text("Google",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                        ),
                      ),
                    ),
                     Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.transparent, // Border color
                          width: 1.0, // Border width
                        ),
                        borderRadius:
                            BorderRadius.circular(8.0), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.1), // Shadow color
                            blurRadius: 6.0, // Soft blur effect
                            offset: Offset(2, 2), // Slight shadow offset
                          ),
                        ],
                        color: Colors.white, // Button background color
                      ),
                      child: Padding(
                       padding: const EdgeInsets.only(left:15.0,right: 15.0),
                        child: TextButton.icon(
                          onPressed: () {},
                          icon:
                              SvgPicture.asset("assets/images/svg/Phone_icon.svg"),
                          label: const Text(
                            "رقم الجوال",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: (15)),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return elevatedButton(
                      title: "sign_in",
                      onpressed: () {
                        formValidationCubit.validatePassword(
                            password:
                                context.read<LoginCubit>().passwordLogin.text);
                        formValidationCubit.validateEmail(
                            context.read<LoginCubit>().emailLogin.text);

                        bool isValidEmail =
                            context.read<FormValidationCubit>().isValidEmail;
                        bool isValidPassword =
                            context.read<FormValidationCubit>().isValidPassword;
                        if (isValidEmail && isValidPassword) {
                          EasyLoading.show(
                              status: 'loading',
                              maskType: EasyLoadingMaskType.black);
                          _login();
                        }
                      },
                      primaryColor: AppColors.primaryColor,
                      height: 7.h,
                      width: 80.w,
                      loading: false,
                      borderRadius: 20,
                    );
                    // }
                  },
                ),
              ],
            );
          }),
    );
  }
}
