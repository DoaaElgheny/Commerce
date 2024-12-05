class RegisterParameter {
  String? fullName;
  String email;
  String password;
  String phoneNumber;
 

  RegisterParameter(
      { this.fullName,
        required this.email,
        required this.password,
        required this.phoneNumber,
   });


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}