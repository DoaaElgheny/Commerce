class ErrorResponse {
  Error? error;

  ErrorResponse({this.error});
  ErrorResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (error != null) {
      data['error'] = error!.toJson();
    }
    return data;
  }
}

class Error {
  String? code;
  String? message;
  String? details;
  Data? data;
  List<ValidationErrors>? validationErrors;

  Error(
      {this.code,
      this.message,
      this.details,
      this.data,
      this.validationErrors});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'] ?? ' ';
    message = json['message'] ?? ' ';
    details = json['details'] ?? ' ';
    data = json['data'] != null ? Data.fromJson(json['data']) : Data();
    if (json['validationErrors'] != null) {
      validationErrors = <ValidationErrors>[];
      json['validationErrors'].forEach((v) {
        validationErrors!.add(ValidationErrors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    data['details'] = details;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (validationErrors != null) {
      data['validationErrors'] =
          validationErrors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? additionalProp1;
  String? additionalProp2;
  String? additionalProp3;

  Data({this.additionalProp1, this.additionalProp2, this.additionalProp3});

  Data.fromJson(Map<String, dynamic> json) {
    additionalProp1 = json['additionalProp1'] ?? ' ';
    additionalProp2 = json['additionalProp2'] ?? ' ';
    additionalProp3 = json['additionalProp3'] ?? ' ';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['additionalProp1'] = additionalProp1;
    data['additionalProp2'] = additionalProp2;
    data['additionalProp3'] = additionalProp3;
    return data;
  }
}

class ValidationErrors {
  String? message;
  List<String>? members;

  ValidationErrors({this.message, this.members});

  ValidationErrors.fromJson(Map<String, dynamic> json) {
    message = json['message'] ?? ' ';
    members = json['members'].cast<String>() ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['members'] = members;
    return data;
  }
}
