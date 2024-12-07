import 'dart:convert';

import 'package:dio/dio.dart';

import '../base/client.dart';
import '../base/response.dart';
import 'client.dart';

final class DioNetworkClient implements NetworkClient {
  DioNetworkClient({
    Dio? dio,
  }) : _dio = dio ?? DioClient().instance;

  final Dio _dio;

  @override
  Future<NetworkResponse> delete({
    required Uri uri,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final response = await _dio.delete(
      uri.toString(),
      data: body,
      options: Options(headers: headers),
    );

    return _adaptResponse(response);
  }

  @override
  Future<NetworkResponse> get({
    required Uri uri,
    Map<String, String>? headers,
  }) async {
    final response = await _dio.get(
      uri.toString(),
      options: Options(headers: headers),
    );

    return _adaptResponse(response);
  }

  @override
  Future<NetworkResponse> head({
    required Uri uri,
    Map<String, String>? headers,
  }) async {
    final response = await _dio.head(
      uri.toString(),
      options: Options(headers: headers),
    );

    return _adaptResponse(response);
  }

  @override
  Future<NetworkResponse> patch({
    required Uri uri,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final response = await _dio.patch(
      uri.toString(),
      data: body,
      options: Options(headers: headers),
    );

    return _adaptResponse(response);
  }

  @override
  Future<NetworkResponse> post({
    required Uri uri,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final response = await _dio.post(
      uri.toString(),
      data: body,
      options: Options(headers: headers),
    );

    return _adaptResponse(response);
  }

  @override
  Future<NetworkResponse> put({
    required Uri uri,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final response = await _dio.put(
      uri.toString(),
      data: body,
      options: Options(headers: headers),
    );

    return _adaptResponse(response);
  }

  NetworkResponse _adaptResponse(Response response) {
    return NetworkResponse(
      statusCode: response.statusCode ?? 0,
      body: jsonEncode(response.data),
    );
  }
}
