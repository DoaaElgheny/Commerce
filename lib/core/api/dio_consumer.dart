import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qubeCommerce/core/api/status_code.dart';
import 'package:qubeCommerce/core/api/success_response.dart';
import 'package:qubeCommerce/injection_container.dart' as di;

import '../error/exceptions.dart';
import '../prefs/my_shared_prefs.dart';
import '../utils/error_response.dart';
import 'api_consumer.dart';
import 'app_interceptors.dart';
import 'end_points.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

//const
  DioConsumer({required this.client}) {
    if (!kIsWeb) {
      (client.httpClientAdapter as DefaultHttpClientAdapter)
          .onHttpClientCreate = (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }

    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };
    client.interceptors.add(di.sl<AppIntercepters>());
    if (kDebugMode) {
      client.interceptors.add(di.sl<LogInterceptor>());
    }
  }

  @override
  Future get(String path,
      {Map<String, dynamic>? queryParameters, isToken = false}) async {
    try {
      if (isToken) {
        String token = await SharedPrefController().token;
        if (token.isNotEmpty) {
          client.options.headers = {
            "Authorization": "Bearer $token",
          };
        }
      }
      final response = await client.get(path, queryParameters: queryParameters);
      return handleResponseAsJsonPost(response);
    } on DioError catch (error) {
      handleErrorResponse(error);
    }
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      isFormData = false,
      isToken = false}) async {
    if (isToken) {
      String token = await SharedPrefController().token;
      if (token.isNotEmpty) {
        client.options.headers = {
          "Authorization": "Bearer $token",
        };
      }
    }
    try {
      final response = await client.post(path,
          queryParameters: queryParameters,
          data: isFormData ? FormData.fromMap(body!) : body);

      var re = handleResponseAsJsonPost(response);
      return re;
    } on DioError catch (error) {
      log("errorerrorerror");
      handleErrorResponse(error);
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      isToken = true}) async {
    try {
      if (isToken) {
        String token = await SharedPrefController().token;
        if (token.isNotEmpty) {
          client.options.headers = {
            "Authorization": "Bearer $token",
          };
        }
      }
      final response =
          await client.put(path, queryParameters: queryParameters, data: body);
      var re = handleResponseAsJsonPost(response);

      return re;
    } on DioError catch (error) {
      handleErrorResponse(error);
    }
  }

  @override
  Future delete(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      isToken = true}) async {
    try {
      if (isToken) {
        String token = await SharedPrefController().token;
        if (token.isNotEmpty) {
          client.options.headers = {
            "Authorization": "Bearer $token",
          };
        }
      }
      final response = await client.delete(path,
          queryParameters: queryParameters, data: body);
      var re = handleResponseAsJsonPost(response);
      return re;
    } on DioError catch (error) {
      handleErrorResponse(error);
    }
  }

  dynamic handleResponseAsJsonPost(dynamic response) {
    if (response.statusCode == 200 || response.statusCode == 204) {
      return handleResponseAsJson(response);
    } else {
      return handleErrorResponseStatusCode(response);
    }
  }

  dynamic handleErrorResponse(DioError e) {
    var data = jsonDecode(e.response?.data);
    ErrorResponse errorResponse = ErrorResponse.fromJson(data);
    if (errorResponse.error!.message != null) {
      EasyLoading.showError(errorResponse.error!.message ?? '');
    } else {
      EasyLoading.showError('Error sending request!');
    }
  }

  dynamic handleErrorResponseStatusCode(Response<dynamic> response) {
    var data = jsonDecode(response.data);
    if (data["message"] != null) {
      EasyLoading.showError(data["message"] ?? '');
    } else {
      EasyLoading.showError('Error sending request!');
    }
  }

  dynamic handleResponseAsJson(Response<dynamic> response) {
    try {
      // Check if the response.data is a String (raw JSON)
      if (response.data is String) {
        // If it's a string, decode it into a Map
        final Map<String, dynamic> jsonResponse = jsonDecode(response.data);

        // Convert Map to ApiResponse
        final apiResponse = ApiResponse.fromJson(jsonResponse);
        return apiResponse;
      } else if (response.data is Map<String, dynamic>) {
        // If response.data is already a Map (decoded JSON), just convert it
        final apiResponse = ApiResponse.fromJson(response.data);
        return apiResponse;
      } else {
        throw Exception('Unexpected response format');
      }
    } catch (e) {
      log("Error handling response: $e");
      throw Exception("Error handling response: $e");
    }
  }

  // dynamic handleResponseAsJson(Response<dynamic> response) {
  //    final Map<String, dynamic> jsonResponse = jsonDecode(response.data);
  //     final apiResponse = ApiResponse.fromJson(jsonResponse);

  //   return apiResponse;
  // }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            log('BadRequestException error');
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.confilct:
            throw const ConflictException();

          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw const NoInternetConnectionException();
    }
  }
}
