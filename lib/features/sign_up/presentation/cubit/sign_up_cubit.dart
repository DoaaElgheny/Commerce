import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qubeCommerce/core/api/success_response.dart';

import '../../../../core/error/Failure.dart';
import '../../../../core/utils/map_failure_msg.dart';
import '../../../auth/presentation/login/view/login.dart';
import '../../domain/entities/register_parameter.dart';
import '../../domain/usecases/register.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final Register registerUseCase;
  TextEditingController passwordSignUp = TextEditingController();
  TextEditingController fullNameSignUp = TextEditingController();
  TextEditingController emailSignUp = TextEditingController();
  TextEditingController phoneSignUp = TextEditingController();

  SignUpCubit({required this.registerUseCase}) : super(const SignUpState());

  Future<void> register({
    required RegisterParameter registerParameter,
    required BuildContext context,
  }) async {
    emit(SignUploading());

    try {
      Either<Failure, ApiResponse> response =
          await registerUseCase(registerParameter);

      response.fold((failure) {
        return SignUpError(
          msg: MapFailureToMsg.mapFailureToMsg(failure),
        );
      }, (signUpResponse) {
        log("signUpResponse $signUpResponse");
        emit(SignUpSuccess());
        EasyLoading.showSuccess(signUpResponse.message);
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      });
    } catch (error) {
      emit(const SignUpError(msg: 'error'));
    }
  }

  Future<void> clearData({required BuildContext context}) async {
    fullNameSignUp.clear();
    phoneSignUp.clear();
    emailSignUp.clear();
    passwordSignUp.clear();
  }
}
