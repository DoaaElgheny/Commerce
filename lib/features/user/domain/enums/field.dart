enum UserField {
  id(name: 'ID', value: 'id'),
  fullName(name: 'Full Name', value: 'fullName'),
  email(name: 'Email', value: 'email'),
  phoneNumber(name: 'Phone Number', value: 'phoneNumber'),
  appUserId(name: 'App User ID', value: 'appUserId'),
  accessToken(name: 'Access Token', value: 'access_token'),
  userDetails(name: 'User Data', value: 'user'),
  otp(name: 'OTP', value: 'otp'),
  isActive(name: 'Is Active', value: 'isActive');

  const UserField({
    required this.name,
    required this.value,
  });

  final String name;
  final String value;
}
