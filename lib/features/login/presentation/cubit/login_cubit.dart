import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qubeCommerce/config/routes/app_routes.dart';
import 'package:qubeCommerce/core/api/success_response.dart';
import 'package:qubeCommerce/core/error/Failure.dart';
import 'package:qubeCommerce/core/utils/map_failure_msg.dart';
import 'package:qubeCommerce/features/login/domain/entities/login_parameter.dart';
import 'package:qubeCommerce/features/login/domain/usecases/login_usecase.dart';

import 'package:dio/dio.dart';
import 'package:qubeCommerce/features/login/presentation/cubit/login_state.dart';

import '../widgets/otp_verification_sheet.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUseCase;

  TextEditingController passwordLogin = TextEditingController();
  TextEditingController emailLogin = TextEditingController();
  TextEditingController phoneLogin = TextEditingController();
  LoginCubit({required this.loginUseCase}) : super(LoginState());

  void loginWithPhone({required BuildContext context}) {
    emit(state.copyWith(isVerifying: true));

    // Simulate code verification process
    Future.delayed(const Duration(seconds: 2), () {
      if (phoneLogin.text == "123456789") {
        String phone = phoneLogin.text;
        phoneLogin.clear();
        emit(state.copyWith(isVerifying: false));
        Navigator.pop(context);
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
          ),
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: OtpVerificationSheet(
                phoneOrEmail: phone,
                isFromPhone: true,
              ),
            );
          },
        );
      }
    });
  }


Future<void> loginWithEmail({
  required BuildContext context,
  required LoginParameter loginParameter,
}) async {
  // Show loading indicator before starting the login process
  EasyLoading.show(status: 'Logging in...');

  try {
    // Call the use case for login
    Either<Failure, ApiResponse> response = await loginUseCase(loginParameter);

    // Handle the response based on whether it's a success or failure
    response.fold(
      (failure) {
        // If there is a failure, dismiss the loading indicator and show an error message
        EasyLoading.dismiss();
        print("Login failed: ${failure.toString()}"); // Log the failure
        // Optionally show a failure message
        EasyLoading.showError('Login failed: ${MapFailureToMsg.mapFailureToMsg(failure)}');
      },
      (respons) {
        // If login is successful, dismiss the loading indicator and proceed
        EasyLoading.dismiss();
        print("Login successful: ${respons.message}");
        EasyLoading.showSuccess(respons.message);

        // Navigate to the next screen after successful login
        Navigator.pushReplacementNamed(context, Routes.homeScreen);
      },
    );
  } catch (error) {
    // Catch any unexpected errors and dismiss the loading indicator
    EasyLoading.dismiss();
    print("Unexpected error during login: $error");
    // Optionally, show a generic error message
    EasyLoading.showError('An unexpected error occurred. Please try again.');
  }
}

  // void loginWithEmail({required BuildContext context,
  //  required String email,
  //   required String password,}) {
  //   emit(state.copyWith(isVerifying: true));
  //   // Simulate code verification process
  //   Future.delayed(const Duration(seconds: 2), () {
  //     if (emailLogin.text == "r@r.com") {
  //       String email = emailLogin.text;
  //       emailLogin.clear();

  //     }
  //   });
  // }

  void validatePhoneNumber(String value) {
    if (value.isEmpty) {
      emit(state.copyWith(isValidPhoneNumber: false));
    } else if (value.length < 9) {
      emit(state.copyWith(isValidPhoneNumber: false));
    } else {
      emit(state.copyWith(isValidPhoneNumber: true));
    }
  }

  void validateEmail(String value) {
    if (value.isEmpty) {
      emit(state.copyWith(isValidEmail: false));
    } else if (validateRegxEmail(value)) {
      emit(state.copyWith(isValidEmail: false));
    } else {
      emit(state.copyWith(isValidEmail: true));
    }
  }

  bool validateRegxEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }
// Future<void> login({required BuildContext context}) async {
//   emit(Loginloading());
//
//   try {
//     Either<Failure, LoginRespons> response = await loginUseCase(
//         LoginParameter(
//             username: emailLogin.text, password: passwordLogin.text, grantType: AppStrings.password, clientId: AppStrings.appNameLogin));
//     response.fold((failure) {
//       emit(LoginError(
//         msg: MapFailureToMsg.mapFailureToMsg(failure),
//       ));
//     }, (LoginRespons) {
//       print(LoginRespons.toString());
//       print("LoginRespons.accessToken"+LoginRespons.accessToken.toString());
//       return emit(LoginSuccess());
//     });
//   } catch (error) {
//     emit(LoginError(
//       msg: error.toString(),
//     ));
//   }
// }

// Future<bool> login({
//   required String email,
//   required String password,
//   bool isFromSignUp = false,
//   required BuildContext context,
// }) async {
//   final Dio dio = Dio(
//     BaseOptions(
//       // baseUrl: ApisURL.baseURL,
//       connectTimeout: 30000,
//       receiveTimeout: 30000,
//       headers: {
//         'Accept': 'application/json',
//         'Content-Type': 'application/json',
//         'Authorization': "**",
//       },
//     ),
//   );
//   try {
//     emit(Loginloading());
//     Response userData = await dio.post(EndPoints.login,
//         data: {
//           "Grant_type": "password",
//           "Client_Id": "Cveez_App",
//           // "Client_Secret": "1q2w3e*",
//           "UserName": email,
//           "Password": password
//           // "UserName": emailLogin.text,
//           // "Password": passwordLogin.text
//         },
//         options: Options(contentType: Headers.formUrlEncodedContentType));
//     print('userData' + userData.statusCode.toString());
//     if (userData.statusCode == 200 || userData.statusCode == 204) {
//       LoginRespons response = LoginRespons.fromJson(userData.data);
//       emailLogin.clear();
//       passwordLogin.clear();
//       context.read<SignUpCubit>().clearData(context: context);
//       print("userData.data" + userData.data.toString());
//       await SharedPrefController().setToken(response.accessToken!);
//       await SharedPrefController().setLoggedIn(true);
//       Either<Failure, bool> isLJobSeekerResponse =
//           await isLJobSeekerUseCase(NoParams());
//       isLJobSeekerResponse.fold((failure) {
//         EasyLoading.dismiss();
//       }, (isLJobSeeker) async {
//         if (isLJobSeeker) {
//           context.read<JobsCubit>().state.userData = null;
//
//           await context
//               .read<LocaleCubit>()
//               .getConditionsCurrentUserList(context: context);
//           String? fcmoken = await FbNotifications.getFCMTonken();
//           print('fcmoken '+fcmoken.toString());
//           await setFcmToken(deviceId: fcmoken ?? '');
//           emit(LoginSuccess());
//           if (SharedPrefController().isPayment) {
//             if (isFromSignUp) {
//               Navigator.pushNamed(context, Routes.aboutMeScreen);
//             } else {
//               context.read<ButtomnavigationbarCubit>().setTabIndex(0);
//               Navigator.pushReplacementNamed(
//                   context, Routes.bottomNavigationBarScreen);
//             }
//           } else {
//             Navigator.pushReplacementNamed(context, Routes.packageScreen);
//           }
//
//           // if (fromVerification) {
//           //   var packageCubit = context.read<PackageCubit>();
//           //   await packageCubit.payNow(
//           //       paymentParameter: PaymentParameter(
//           //           id: 56, //4 prouction
//           //           code: null,
//           //           cardToken: '',
//           //           currency: '',
//           //           amount: 0),
//           //       context: context,);
//           // }else{
//           //    context.read<ButtomnavigationbarCubit>().setTabIndex(0);
//           // Navigator.pushReplacementNamed(
//           //     context, Routes.bottomNavigationBarScreen);
//           // }
//         } else {
//           EasyLoading.showInfo(
//               AppLocalizations.of(context)!
//                   .translate('account_agent_accessed')!,
//               maskType: EasyLoadingMaskType.none,
//               dismissOnTap: true,
//               duration: const Duration(milliseconds: 8000));
//           String lang = await SharedPrefController().languageCode;
//           bool aboutMeProfile = SharedPrefController().aboutMeProfileEnter;
//
//           SharedPrefController().clearAll();
//           await SharedPrefController().setFirstLoginFlag(true);
//           await SharedPrefController().setLanguage(lang);
//           emit(LoginSuccess());
//         }
//         // EasyLoading.dismiss();
//         // emit(state.copyWith(userData: userDataResponse));
//       });
//     }
//     return true;
//   } on DioError catch (error) {
//     emit(LoginError(
//       msg: error.toString(),
//     ));
//     print('DioError');
//     print('DioError' + error.message);
//     // if(error.response!.statusCode==403){
//     //   EasyLoading.showError( AppLocalizations.of(context)!.translate('account_not_found')!);
//     // }else{
//     handleErrorResponse(error);
//     //}
//
//     return false;
//   }
// }
//
// dynamic handleErrorResponse(DioError e) {
//   LoginErrorRespons errorResponse =
//       LoginErrorRespons.fromJson(e.response!.data);
//   if (errorResponse.errorDescription != null) {
//     EasyLoading.showError(errorResponse.errorDescription ?? '');
//   } else {
//     EasyLoading.showError('Error sending request!');
//   }
// }
//
// Future<void> setFcmToken({
//   required String deviceId,
// }) async {
//   try {
//     Either<Failure, int> response = await setFcmTokenUseCase(deviceId);
//     response.fold((failure) {
//       print("Failure" + failure.toString());
//     }, (fcmTokenUseCaseRespons) {
//       print("fcmTokenUseCaseRespons" + fcmTokenUseCaseRespons.toString());
//     });
//   } catch (error) {
//     print("error" + error.toString());
//     // emit(SignUpError(
//     //   msg: 'error',
//     // ));
//   }
// }
//
// Future<void> deleteFcmToken({
//   required BuildContext context,
//   required String deviceId,
// }) async {
//   EasyLoading.show(
//     status: AppLocalizations.of(context)!.translate('loading')!,
//     dismissOnTap: false,
//   );
//   try {
//     Either<Failure, int> response = await deleteFcmTokenUseCase(deviceId);
//     response.fold((failure) {
//       EasyLoading.dismiss();
//       print("Failure" + failure.toString());
//     }, (fcmTokenUseCaseRespons) {
//       EasyLoading.dismiss();
//       print("fcmTokenUseCaseRespons" + fcmTokenUseCaseRespons.toString());
//     });
//   } catch (error) {
//     EasyLoading.dismiss();
//     print("error" + error.toString());
//     // emit(SignUpError(
//     //   msg: 'error',
//     // ));
//   }
// }
}
