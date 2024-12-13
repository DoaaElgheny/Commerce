import 'package:bloc/bloc.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qubeCommerce/core/usecases/usecase.dart';
import 'package:qubeCommerce/features/setting/presentation/cubit/setting_state.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../core/error/Failure.dart';
import '../../domain/usecases/delete_account.dart';



class SettingCubit extends Cubit<SettingState> {
  final DeleteAccountUsecase deleteAccountUsecase;

  SettingCubit({required this.deleteAccountUsecase, }) : super(SettingState());


  Future<void> deleteAccount({
    required BuildContext context,
  }) async {
    EasyLoading.show(
      status: AppLocalizations.of(context)!.translate('loading')!,
      dismissOnTap: false,
    );
    try {
      Either<Failure, int> response = await deleteAccountUsecase(NoParams());
      response.fold((failure) {
        EasyLoading.dismiss();
        print("Failure" + failure.toString());
      }, (deleteAccountRespons) async {
        EasyLoading.dismiss();
      //  await context.read<JobsCubit>().LogoutOrDelete( context: context, message: 'delete_account_Successfully',isLogout: false);
        print("deleteAccountRespons" + deleteAccountRespons.toString());
      });
    } catch (error) {
      EasyLoading.dismiss();
   
    }
  }


}
