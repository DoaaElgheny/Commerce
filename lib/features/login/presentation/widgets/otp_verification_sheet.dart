import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../core/shared_widgets/app_text.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../cubit/verification_cubit.dart';
import '../cubit/verification_state.dart';

class OtpVerificationSheet extends StatefulWidget {
  String phoneOrEmail;
  bool isFromPhone;

  OtpVerificationSheet({
    super.key,
    required this.phoneOrEmail,
    required this.isFromPhone,
  });

  @override
  State<OtpVerificationSheet> createState() => _OtpVerificationSheetState();
}

class _OtpVerificationSheetState extends State<OtpVerificationSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: BlocBuilder<VerificationCubit, VerificationState>(
            builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: AppLocalizations.of(context)!
                        .translate('OTP_verification')!,
                    color: AppColors.loginTitleColor,
                    weight: FontWeight.w700,
                    fontSize: 24,
                    align: TextAlign.start,
                  ),
                  InkWell(
                    onTap: () {
                      context.read<VerificationCubit>().clearTextiled();
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.loginColoseColor.withOpacity(0.1)),
                      child: const Center(
                        child: Icon(
                          Icons.close,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                direction: Axis.horizontal,
                children: [
                  AppText(
                      text: AppLocalizations.of(context)!
                          .translate('OTP_verification_msg')!,
                      weight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.gray,
                      align: TextAlign.start),
                  const SizedBox(
                    width: 2,
                  ),
                  AppText(
                      text: widget.phoneOrEmail,
                      weight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.loginColoseColor,
                      align: TextAlign.start),
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: PinCodeTextField(
                  errorTextDirection: TextDirection.ltr,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  textStyle: TextStyle(
                    color: state.errorMessage.isNotEmpty
                        ? Colors.black
                        : AppColors.green,
                    fontFamily: AppStrings.fontFamilyGilroy,
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    height: 1.2,
                  ),
                  pinTheme: PinTheme(
                    fieldWidth: 16.w,
                    fieldHeight: 6.5.h,
                    borderRadius: BorderRadius.circular(8),
                    selectedColor: AppColors.green,
                    inactiveColor: AppColors.borderColor,
                    shape: PinCodeFieldShape.box,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    borderWidth: 1.2,
                    inactiveBorderWidth: 1.2,
                    errorBorderColor: state.errorMessage.isNotEmpty
                        ? Colors.red
                        : AppColors.borderColor,
                    activeColor: state.errorMessage.isNotEmpty
                        ? Colors.red
                        : AppColors.green,
                    activeFillColor: Colors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  keyboardType: TextInputType.number,
                  controller: context.read<VerificationCubit>().codeController,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  autoDisposeControllers: false,
                  autovalidateMode: AutovalidateMode.disabled,
                  validator: (value) {
                    if (state.errorMessage.isNotEmpty) {
                      return state.errorMessage;
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (state.errorMessage.isNotEmpty) {
                      context
                          .read<VerificationCubit>()
                          .emit(state.copyWith(errorMessage: ''));
                    }
                  },
                  beforeTextPaste: (text) {
                    return true;
                  },
                  appContext: context,
                ),
              ),
              if (state.errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              SizedBox(
                height: 3.h,
              ),
              // BlocBuilder<VerificationCubit, VerificationState>(
              //   builder: (context, state) {
              //     return
              InkWell(
                onTap: () {
                  context.read<VerificationCubit>().verifyCode(
                      context: context,
                      code:
                          context.read<VerificationCubit>().codeController.text,
                      isFromPhone: widget.isFromPhone);
                },
                child: Container(
                  height: 55,
                  // padding: const EdgeInsets.all(13),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.loginColoseColor),
                  child: Center(
                    child: state.isVerifying
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : AppText(
                            text: AppLocalizations.of(context)!
                                .translate('verify')!,
                            color: Colors.white,
                            weight: FontWeight.w600,
                            fontSize: 15,
                            align: TextAlign.center,
                          ),
                  ),
                ),
              ),
              //;
              //   },
              // ),
              SizedBox(
                height: 4.h,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                        text: AppLocalizations.of(context)!
                            .translate('Didnt_received_code')!,
                        weight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.gray,
                        align: TextAlign.start),
                    const SizedBox(
                      width: 7,
                    ),
                    state.time > 0
                        ? AppText(
                            text: formatTime(state.time),
                            color: AppColors.loginColoseColor,
                            weight: FontWeight.w400,
                            fontSize: 16,
                            align: TextAlign.start,
                          )
                        : InkWell(
                            onTap: () {
                              context.read<VerificationCubit>().resetTimer();
                            },
                            child: AppText(
                              text: AppLocalizations.of(context)!
                                  .translate('resend')!,
                              color: AppColors.loginColoseColor,
                              weight: FontWeight.w400,
                              fontSize: 16,
                              align: TextAlign.start,
                            ),
                          )
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }
}
