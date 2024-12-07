import '../../../../../../user/data/data_sources/remote/validators/remote/json_validator.dart';
import '../base/json_validator.dart';

final class AuthenticationPatternJsonValidator
    implements AuthenticationJsonValidator {
  const AuthenticationPatternJsonValidator();

  @override
  bool login(Object json) {
    if (json
        case <String, dynamic>{
          "succeeded": true,
          "message": String _,
          "data": {
            "user": {
              "id": String _,
              "userName": String _,
              "isActive": bool _,
              "emailConfirmed": bool _,
            },
            "access_token": String _,
          }
        }) {}
    if (json case <String, dynamic>{"data": Map _}) {
      final jsonData = Map<String, dynamic>.from(json);
      return const UserPatternJsonValidator().validUser(jsonData['data']);
    }
    return false;
  }

  @override
  bool loginWithSocialMedia(Object json) {
    if (json case <String, dynamic>{"data": Map _}) {
      final jsonData = Map<String, dynamic>.from(json);
      return const UserPatternJsonValidator().validUser(jsonData['data']);
    }
    return false;
  }

  @override
  bool register(Object json) {
    if (json case <String, dynamic>{"data": Map _}) {
      final jsonData = Map<String, dynamic>.from(json);
      return const UserPatternJsonValidator().validUser(jsonData['data']);
    }
    return false;
  }

  @override
  bool resetPasswordByOtp(Object json) {
    if (json case <String, dynamic>{"data": Map _}) {
      final jsonData = Map<String, dynamic>.from(json);
      return const UserPatternJsonValidator().validUser(jsonData['data']);
    }
    return false;
  }
}
