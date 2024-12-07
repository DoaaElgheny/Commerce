import 'dart:convert';

import '../../../../../network/client/base/client.dart';
import '../../../../../network/response_handler/base/response_handler.dart';
import '../../../domain/entities/parameters/add_fcm_token.dart';
import '../../../domain/entities/parameters/read.dart';
import '../../../domain/entities/parameters/user_by_token.dart';
import '../../../domain/entities/parameters/verify_account.dart';
import '../../../domain/entities/profile_modification_data.dart';
import '../../models/parameters/verify_account.dart';
import '../base/data_source.dart';
import 'endpoints/base/user.dart';
import 'validators/base/json_validator.dart';

final class UserRemoteDataSource implements UserDataSource {
  const UserRemoteDataSource({
    required NetworkClient client,
    required ResponseHandler responseHandler,
    required UserEndpoints endpoints,
    required UserJsonValidator jsonValidator,
  })  : _client = client,
        _responseHandler = responseHandler,
        _endpoints = endpoints,
        _jsonValidator = jsonValidator;

  final NetworkClient _client;
  final ResponseHandler _responseHandler;
  final UserEndpoints _endpoints;
  final UserJsonValidator _jsonValidator;

  @override
  Future<void> addFcmToken({
    required AddFcmTokenParameters parameters,
  }) async {
    // final response = await _client.post(
    //   uri: _endpoints.addFcmToken,
    //   body: AddFcmTokenParametersDTO.fromEntity(parameters).toMap(),
    // );
    //
    // return _responseHandler.handle<void>(
    //   response: response,
    //   expectedCases: [200],
    //   expectedCasesHandler: (status) {},
    // );
  }

  @override
  Future<void> deleteAccount() async {
    final response = await _client.delete(uri: _endpoints.delete);

    return _responseHandler.handle<void>(
      response: response,
      expectedCases: [200, 202],
      expectedCasesHandler: (state) {},
    );
  }

  @override
  Future<Map<String, dynamic>> read({
    required ReadUserParameters parameters,
  }) async {
    final response = await _client.get(
      uri: _endpoints.read(parameters: parameters),
    );

    return _responseHandler.handle<Map<String, dynamic>>(
      response: response,
      expectedCases: [200, 202],
      expectedCasesHandler: (state) {
        final jsonResponse = Map<String, dynamic>.from(
          jsonDecode(response.body) as Map,
        );

        if (!_jsonValidator.read(jsonResponse)) {
          throw const FormatException();
        }

        final data = Map<String, dynamic>.from(jsonResponse['data'] as Map);
        return Map<String, dynamic>.from(data['items'] as Map);
      },
    );
  }

  @override
  Future<void> sendOtpToVerifyUserAccount() async {
    final response = await _client.get(
      uri: _endpoints.sendOtpToVerifyUserAccount,
    );

    return _responseHandler.handle<void>(
      response: response,
      expectedCases: [200],
      expectedCasesHandler: (status) {},
    );
  }

  @override
  Future<Map<String, dynamic>> userByToken({
    required UserByTokenParameters parameters,
  }) async {
    final response = await _client.get(
      uri: _endpoints.userByToken,
      headers: {
        "Authorization": 'Bearer ${parameters.token}',
      },
    );

    return _responseHandler.handle<Map<String, dynamic>>(
      response: response,
      expectedCases: [200],
      expectedCasesHandler: (status) {
        final jsonResponse = Map<String, dynamic>.from(
          jsonDecode(response.body) as Map,
        );

        if (!_jsonValidator.userByToken(jsonResponse)) {
          throw const FormatException();
        }

        return Map<String, dynamic>.from(jsonResponse['data'] as Map);
      },
    );
  }

  @override
  Future<Map<String, dynamic>> update({
    required ProfileModificationData data,
  }) async {
    return {};
    // final response = await _client.patch(
    //   uri: _endpoints.update(data: data),
    //   body: ProfileModificationDataDTO.fromEntity(data).toMap()
    //     ..removeWhere((key, value) => value == null),
    // );
    //
    // return _responseHandler.handle<Map<String, dynamic>>(
    //   response: response,
    //   expectedCases: [200, 202],
    //   expectedCasesHandler: (state) {
    //     final jsonResponse = Map<String, dynamic>.from(
    //       jsonDecode(response.body) as Map,
    //     );
    //
    //     if (!_jsonValidator.update(jsonResponse)) {
    //       throw const FormatException();
    //     }
    //
    //     final data = Map<String, dynamic>.from(jsonResponse['data'] as Map);
    //     return Map<String, dynamic>.from(data['items'] as Map);
    //   },
    // );
  }

  @override
  Future<Map<String, dynamic>> verifyAccount({
    required VerifyAccountParameters parameters,
  }) async {
    final response = await _client.post(
      uri: _endpoints.verifyAccount,
      body: VerifyAccountParametersDTO.fromEntity(parameters).toMap(),
    );

    return _responseHandler.handle<Map<String, dynamic>>(
      response: response,
      expectedCases: [200],
      expectedCasesHandler: (status) {
        final jsonResponse = Map<String, dynamic>.from(
          jsonDecode(response.body) as Map,
        );

        if (!_jsonValidator.verifyAccount(jsonResponse)) {
          throw const FormatException();
        }

        return Map<String, dynamic>.from(jsonResponse['data'] as Map);
      },
    );
  }
}
