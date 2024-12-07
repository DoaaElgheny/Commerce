// import 'package:bloc/bloc.dart';
// import 'package:ceevezapp/core/utils/enums.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
//
// import '../../../../config/locale/app_localizations.dart';
// import '../../../../config/routes/app_routes.dart';
// import '../../../../core/error/Failure.dart';
// import '../../../../core/notification_firebase/fb_notifications.dart';
// import '../../../../core/prefs/my_shared_prefs.dart';
// import '../../../../core/usecases/usecase.dart';
// import '../../../../core/utils/assets_manager.dart';
// import '../../../../core/utils/map_failure_msg.dart';
// import '../../../login/presentation/cubit/login_cubit.dart';
// import '../../../porfile/domain/entities/user_data.dart';
// import '../../../porfile/domain/usecases/get_userdata.dart';
// import '../../data/models/classification_list_model.dart';
// import '../../domain/entities/search_jobs_list.dart';
// import '../../domain/usecases/get_classification_list.dart';
// import '../../domain/usecases/get_recent_jobs_list.dart';
// import 'home_state.dart';
//
//
// class HomeCubit extends Cubit<HomeState> {
//   final GetClassificationList getClassificationListUseCase;
//   final GetRecentJobsList getRecentJobsListUseCase;
//   final GetUserData getUserDataUseCase;
//
//   HomeCubit({required this.getUserDataUseCase, required this.getRecentJobsListUseCase, required this.getClassificationListUseCase}) : super(HomeState(
//     classificationList: [], recentJobsList: [], userData: null,
//   ));
//
//   Future<void> getClassificationList() async {
//     try {
//       Either<Failure, List<ClassificationListModel>> response =
//       await getClassificationListUseCase(NoParams());
//       response.fold((failure) {
//         MapFailureToMsg.mapFailureToMsg(failure);
//       }, (classificationList) {
//         emit(state.copyWith(classificationList: classificationList));
//       });
//     } catch (error) {
//       emit(state.copyWith(classificationList: []));
//     }
//   }
//   Future<void> getRecentJobsList() async {
//     try {
//       Either<Failure,SearchJobsList> response =
//       await getRecentJobsListUseCase(NoParams());
//       response.fold((failure) {
//         MapFailureToMsg.mapFailureToMsg(failure);
//       }, (recentJobsList) {
//         log('classificationList' + recentJobsList.toString());
//         emit(state.copyWith(recentJobsList: recentJobsList.items));
//       });
//     } catch (error) {
//       log('error.toString()' + error.toString());
//       emit(state.copyWith(recentJobsList: []));
//     }
//   }
//   Future<void> getUserData({required BuildContext context}) async {
//     EasyLoading.show(
//       status: AppLocalizations.of(context)!.translate('loading')!,
//       dismissOnTap: false,
//     );
//     try {
//       Either<Failure, UserData> response = await getUserDataUseCase(NoParams());
//       response.fold((failure) {
//
//       }, (userDataResponse) async {
//         EasyLoading.dismiss();
//         if(userDataResponse.yearsExperience !=null){
//           // await SharedPrefController().setCompleteProfile(true);
//         }
//
//         userDataResponse.paymentType == Payment.Paied?await SharedPrefController().setIsPayment(true): await SharedPrefController().setIsPayment(false);
//
//         emit(state.copyWith(userData: userDataResponse));
//       });
//     } catch (error) {
//       emit(state.copyWith(userData: null));
//     }
//   }
//
// void clearData(BuildContext context){
//   getUserData(context: context);
//     emit(state.copyWith(classificationList: [],recentJobsList: []));
// }
// void clearDataAsVistor(BuildContext context){
//     emit(state.copyWith(classificationList: [],recentJobsList: []));
// }
// List<String> listImage=[ImageAssets.ads1,
//   ImageAssets.ads2,
//   ImageAssets.ads3,
//   ImageAssets.ads4,
//   ImageAssets.ads5,];
// Future <void> clearUserData(BuildContext context) async{
//   await  getUserData(context: context);
// }
//
//   Future<void> LogoutOrDelete(
//       { required BuildContext context,
//         required bool isLogout,
//         required String message}) async {
//     if(isLogout){
//       String? fcmtoken=await FbNotifications.getFCMTonken();
//       log('fcmoken '+fcmtoken.toString());
//       context.read<LoginCubit>().deleteFcmToken(context: context, deviceId: fcmtoken??'');
//     }
//     EasyLoading.showInfo(
//         AppLocalizations.of(context)!
//             .translate(message)!,
//         maskType: EasyLoadingMaskType.none,
//         dismissOnTap: true,
//         duration: const Duration(milliseconds: 8000));
//     String lang =
//     await SharedPrefController().languageCode;
//     SharedPrefController().clearAll();
//     await SharedPrefController()
//         .setFirstLoginFlag(true);
//     await SharedPrefController().setLanguage(lang);
//     Navigator.pushNamedAndRemoveUntil(context,  Routes.loginScreen, (Route<dynamic> route) => false);
//   }
// }
