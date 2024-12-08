import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../core/api/end_points.dart';
import '../../../core/authentication/provider.dart';

final class DioClient {
  late Dio _dio;
  static final _singleton = DioClient._internal();

  factory DioClient() {
    return _singleton;
  }

  DioClient._internal() {
    final options = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 100000,
      receiveDataWhenStatusError: true,
      validateStatus: (status) {
        return true;
      },
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );

    _dio = Dio(options);
    _dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) async {
          try {
            final res = Map<String, dynamic>.from(response.data);
            if (response.statusCode == 500) {
              if (res['errors']['error_message'] == 'Unauthenticated.') {
                await AuthenticationProvider.instance.verifyToken();
              }
            }
          } catch (_) {}
          return handler.next(response);
        },
        onRequest: (options, handler) async {
          final tkn = AuthenticationProvider.instance.currentUser?.accessToken;
          if (tkn != null) {
            options.headers['Authorization'] = 'Bearer $tkn';
          }

          // Send the local with every request.
          // final context = NavigationService.navigatorKey.currentContext;
          // if (context != null) {
          //   final currentLocaleName = AppLocalizations.of(context).localeName;
          //   options.headers['Accepted-Language'] = currentLocaleName;
          // }
          return handler.next(options);
        },
      ),
    );
    _dio.interceptors.add(
      PrettyDioLogger(
        responseBody: true,
        requestHeader: true,
        requestBody: true,
        logPrint: (object) => log('$object'),
      ),
    );
  }

  Dio get instance => _dio;
}
