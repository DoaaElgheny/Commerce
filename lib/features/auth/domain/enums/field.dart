enum AuthField {
  bio(name: 'Bio', value: 'bio'),
  birthDay(name: 'Birthday', value: 'birthday'),
  countryId(name: 'Country ID', value: 'country_id'),
  fullName(name: 'Full Name', value: 'fullName'),
  email(name: 'Email', value: 'email'),
  // fcmToken(name: 'FCM Token', value: 'token'),
  firstName(name: 'First Name', value: 'first_name'),
  gender(name: 'Gender', value: 'gender'),
  lastName(name: 'Last Name', value: 'last_name'),
  otp(name: 'OTP', value: 'otp'),
  password(name: 'Password', value: 'password'),
  newPassword(name: 'New Password', value: 'newPassword'),
  passwordConfirmation(
    name: 'Password Confirmation',
    value: 'password_confirmation',
  ),
  phone(name: 'Phone', value: 'phoneNumber'),
  role(name: 'Role', value: 'role'),
  socialMedia(name: 'Social Media', value: 'method_id'),
  token(name: 'Token', value: 'token');

  const AuthField({
    required this.name,
    required this.value,
  });

  final String name;
  final String value;
}
