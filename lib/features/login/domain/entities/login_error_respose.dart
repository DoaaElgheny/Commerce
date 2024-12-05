class LoginErrorRespons {
  String? error;
  String? errorDescription;

  LoginErrorRespons({this.error, this.errorDescription});

  LoginErrorRespons.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    errorDescription = json['error_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['error_description'] = errorDescription;
    return data;
  }
}
