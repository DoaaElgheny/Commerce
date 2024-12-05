import 'package:get_it/get_it.dart';
import 'package:qubeCommerce/features/sign_up/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/api_consumer.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/dio_consumer.dart';
import 'core/netwok/connection_cubit.dart';
import 'package:dio/dio.dart';
import 'features/bottomNavigationBar/injection_container.dart';
import 'features/home/injection_container.dart';
import 'features/login/injection_container.dart';
import 'features/splash/injection_container.dart';


final sl = GetIt.instance;

Future<void> init() async {
  //هادي علي مستوي التطبيق كل الاشياء المشتركة
  //باختصار الكوبيت كانت بتحتاج الي usecases وهادا يحتاج الي ريبو  وهادا يحتاج الي الداد سورس وهادا يحتاج الي http وكل هادا يكون داخل السيرفر لوكيتور بيجمع كل هدول
  //كل حاجة تستخدم في المشروع كديبنتنسي لازم تكون هان
  //بتحط الbloc والusecase والباقي
  //نحتفظ بسجل مركزي يوفر من مكان واحد
  // initRandomQute();
  initSplash();
  initHomeCvees();
  initLoginqubeCommerce();
  initSignUp();
  initButtomnavigationbarGotGame();



  //! Core
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton<DioConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton<ConnectionCubit>(() => ConnectionCubit());

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
   sl.registerLazySingleton(() => AppIntercepters());
   //هادا لطباعة اللوج
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => Dio());
}
