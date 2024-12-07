import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qubeCommerce/core/shared_widgets/app_text_field.dart';
import 'package:qubeCommerce/core/shared_widgets/elevated_button.dart';
import 'package:qubeCommerce/core/shared_widgets/images.dart';
import 'package:qubeCommerce/core/utils/app_colors.dart';
import 'package:qubeCommerce/features/login/presentation/cubit/validation_cubit.dart';
import 'package:qubeCommerce/features/login/presentation/cubit/validation_state.dart';
import 'package:qubeCommerce/features/login/presentation/widgets/auth_scaffold.dart';
import 'package:qubeCommerce/features/sign_up/domain/entities/register_parameter.dart';
import 'package:qubeCommerce/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:qubeCommerce/features/sign_up/presentation/widgets/already_have_account.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "/sign_up_mail_screen";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscureText = true;
  final SizedBox _sizedBox = const SizedBox(
    height: (0),
  );

  @override
  void initState() {
    // TODO: implement initState
    context.read<FormValidationCubit>().clearValidation();

    context.read<SignUpCubit>().clearData(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();
    return AuthScaffold(
      isleadingIcon: true,
      customBackFunction: () {
        signUpCubit.clearData(context: context);
        EasyLoading.dismiss();
        Navigator.pop(context);
      },
      appBarBottom: Center(
        child: Image.asset(Images.backGroundPng),
      ),
      appBarHeight: (230),
      body: Padding(
        padding: EdgeInsets.all(5.0.w),
        child: SingleChildScrollView(
          child: (BlocConsumer<FormValidationCubit, FormValidationState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextField(
                      hasMargin: false,
                      textEditingController:
                          context.read<SignUpCubit>().fullNameSignUp,
                      isValidated:
                          context.read<FormValidationCubit>().isValidName,
                      validationText: 'required_field',
                      textHint: 'full_name',
                      label: const Text('full_name'),
                      prefix: SvgPicture.asset(Images.getIconSvg('user')),
                      onTextChange: (val) {
                        context
                            .read<FormValidationCubit>()
                            .validateFullName(val);
                      },
                    ),
                    _sizedBox,
                    AppTextField(
                      hasMargin: false,
                      textEditingController:
                          context.read<SignUpCubit>().emailSignUp,
                      isValidated:
                          context.read<FormValidationCubit>().isValidEmail,
                      validationText: 'required_field',
                      textHint: 'email',
                      label: const Text('email'),
                      prefix: SvgPicture.asset(Images.getIconSvg('email')),
                      onTextChange: (val) {
                        context.read<FormValidationCubit>().validateEmail(val);
                      },
                    ),
                    _sizedBox,
                    AppTextField(
                      hasMargin: false,
                      textEditingController:
                          context.read<SignUpCubit>().passwordSignUp,
                      isValidated:
                          context.read<FormValidationCubit>().isValidPassword,
                      validationText: 'password_validation',
                      textHint: '**********',
                      label: const Text('password'),
                      prefix: SvgPicture.asset(Images.getIconSvg('lock')),
                      isPassword: _obscureText,
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
                            password: context
                                .read<SignUpCubit>()
                                .passwordSignUp
                                .text);
                      },
                    ),
                    _sizedBox,
                    AppTextField(
                      hasMargin: false,
                      textEditingController:
                          context.read<SignUpCubit>().phoneSignUp,
                      isValidated: context
                          .read<FormValidationCubit>()
                          .isValidPhoneNumber,
                      validationText:
                          'this field is required or Enter valid age',
                      textHint: 'Phone',
                      label: const Text('Phone'),
                      prefix: SvgPicture.asset(Images.getIconSvg('age')),
                      onTextChange: (val) {
                        context
                            .read<FormValidationCubit>()
                            .validateRegxPhoneNumber(val);
                      },
                    ),
                    const SizedBox(
                      height: (10),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    BlocBuilder<SignUpCubit, SignUpState>(
                      builder: (context, state) {
                        return elevatedButton(
                          title: "sign_up",
                          onpressed: () {
                            context
                                .read<FormValidationCubit>()
                                .validateFullName(
                                    signUpCubit.fullNameSignUp.text);

                            BlocProvider.of<FormValidationCubit>(context)
                                .validatePassword(
                                    password: signUpCubit.passwordSignUp.text);

                            final formValidationCubit =
                                context.read<FormValidationCubit>();

                            BlocProvider.of<FormValidationCubit>(context)
                                .validateEmail(signUpCubit.emailSignUp.text);
                            BlocProvider.of<FormValidationCubit>(context)
                                .validatePhoneNumber(
                                    signUpCubit.phoneSignUp.text);
                            // BlocProvider.of<FormValidationCubit>(context)
                            //     .validateFullName(
                            //         signUpCubit.fullNameSignUp.text);

                            bool isValidName =
                                context.read<FormValidationCubit>().isValidName;

                            bool isValidPhoneNumber = context
                                .read<FormValidationCubit>()
                                .isValidPhoneNumber;
                            bool isValidEmail = context
                                .read<FormValidationCubit>()
                                .isValidEmail;
                            bool isValidPassword = context
                                .read<FormValidationCubit>()
                                .isValidPassword;

                            if (isValidName &&
                                isValidPhoneNumber &&
                                isValidPassword &&
                                isValidEmail) {
                              signUpCubit.register(
                                  registerParameter: RegisterParameter(
                                    fullName: signUpCubit.fullNameSignUp.text,
                                    email: signUpCubit.emailSignUp.text,
                                    password: signUpCubit.passwordSignUp.text,
                                    phoneNumber: signUpCubit.phoneSignUp.text,
                                  ),
                                  context: context);
                            }

                            // }
                          },
                          primaryColor: AppColors.primaryColor,
                          height: 7.h,
                          loading: false,
                        );
                      },
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    const AlreadyHaveAccountWidget(),
                  ]);
            },
          )),
        ),
      ),
    );
  }
}
