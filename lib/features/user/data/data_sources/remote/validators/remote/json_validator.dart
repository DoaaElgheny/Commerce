import '../base/json_validator.dart';

final class UserPatternJsonValidator implements UserJsonValidator {
  const UserPatternJsonValidator();

  @override
  bool read(Object json) {
    if (json case {'data': <String, dynamic>{"items": Map _}}) {
      final jsonData = Map<String, dynamic>.from(json);
      final data = Map<String, dynamic>.from(jsonData['data'] as Map);

      return validUserDetails(data['items'] as Map);
    }
    return false;
  }

  @override
  bool toggleNotification(Object json) {
    if (json case <String, dynamic>{'data': bool _}) {
      return true;
    }
    return false;
  }

  @override
  bool update(Object json) {
    if (json case {'data': <String, dynamic>{"items": Map _}}) {
      final jsonData = Map<String, dynamic>.from(json);
      final data = Map<String, dynamic>.from(jsonData['data'] as Map);

      return validUserDetails(data['items'] as Map);
    }
    return false;
  }

  @override
  bool userByToken(Object json) {
    if (json
        case {
          "succeeded": true,
          "data": {
            "id": int _,
            "fullName": String _,
            "email": String _,
            "phoneNumber": String _,
            "appUserId": String _,
            "isActive": bool _,
          }
        }) {
      return true;
    }
    return false;
  }

  @override
  bool userToggleOnline(Object json) {
    if (json case {'data': <String, dynamic>{"items": Map _}}) {
      final jsonData = Map<String, dynamic>.from(json);
      final data = Map<String, dynamic>.from(jsonData['data'] as Map);

      return validUserDetails(data['items'] as Map);
    }
    return false;
  }

  @override
  bool validUser(Object json) {
    if (json case {"user_details": Map _, "access_token": String _}) {
      final jsonData = Map<String, dynamic>.from(json);
      return validUserDetails(jsonData['user_details']);
    }
    return false;
  }

  @override
  bool validUserDetails(Object json) {
    if (json
        case {
          'bio': String? _,
          'birthday': String? _,
          'chat_id': int _,
          'commission_type': String? _,
          'commission_value': num? _,
          'created_at': String _,
          'deleted_at': String? _,
          'email': String _,
          'email_verified': bool _,
          'employment_status': int? _,
          'first_name': String? _,
          'full_name': String? _,
          'gender': int _,
          'id': int _,
          'image': String? _,
          'image_id': int? _,
          'is_busy': bool _,
          'is_online': bool _,
          'last_name': String? _,
          'marital_status': int? _,
          'notification_enabled': bool _,
          'phone': String _,
          'phone_verified': bool _,
          'role_id': int _,
          'updated_at': String _,
          'wallet': num _,
        }) {
      return true;
    }
    return false;
  }

  @override
  bool verifyAccount(Object json) {
    if (json case {'data': Map _}) {
      final jsonData = Map<String, dynamic>.from(json);
      return validUser(jsonData['data']);
    }
    return false;
  }
}
