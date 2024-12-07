import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../config/locale/app_localizations.dart';
import 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(const VerificationState(time: 60)) {
    _startTimer();
  }

  Timer? _timer;
  int _initialDuration = 60; // base duration
  TextEditingController codeController = TextEditingController();
  void _startTimer() {
    emit(state.copyWith(time: _initialDuration));
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.time > 0) {
        emit(state.copyWith(time: state.time - 1));
      } else {
        _timer?.cancel();
      }
    });
  }

  void resetTimer() {
    _initialDuration *= 2; // Double the previous time
    _startTimer();
  }

  void verifyCode(
      {required BuildContext context,
      required String code,
      required bool isFromPhone}) {
    emit(state.copyWith(isVerifying: true, errorMessage: ''));

    // Simulate code verification process
    Future.delayed(const Duration(seconds: 2), () {
      if (code == "1234") {
        emit(state.copyWith(isVerifying: false));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Code Verified!'),
        ));
        clearTextiled();
        Navigator.pop(context);
      } else {
        log('code == 1234');
        emit(state.copyWith(
            isVerifying: false,
            errorMessage:
                AppLocalizations.of(context)!.translate('code_found')!));
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  void clearTextiled() {
    codeController.clear();
  }
}
