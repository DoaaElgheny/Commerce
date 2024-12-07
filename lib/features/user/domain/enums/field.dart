enum UserField {
  accessToken(name: 'Access Token', value: 'access_token'),
  bio(name: 'Bio', value: 'bio'),
  birthday(name: 'Birthday', value: 'birthday'),
  chatId(name: 'Chat Id', value: 'chat_id'),
  commissionType(name: 'Commission Type', value: 'commission_type'),
  commissionValue(name: 'Commission Value', value: 'commission_value'),
  createdAt(name: 'Created At', value: 'created_at'),
  deletedAt(name: 'Deleted At', value: 'deleted_at'),
  deviceType(name: 'Device Type', value: 'device_type'),
  email(name: 'Email', value: 'email'),
  emailVerificationCode(
    name: 'Email Verification Code',
    value: 'email_verification_code',
  ),
  emailVerified(name: 'Email Verified', value: 'email_verified'),
  employmentStatus(name: 'Employment Status', value: 'employment_status'),
  firstName(name: 'First Name', value: 'first_name'),
  fullName(name: 'Full Name', value: 'full_name'),
  gender(name: 'Gender', value: 'gender'),
  id(name: 'id', value: 'id'),
  image(name: 'Image', value: 'image'),
  imageId(name: 'Image Id', value: 'image_id'),
  isBusy(name: 'Is Busy', value: 'is_busy'),
  isOnline(name: 'Is Online', value: 'is_online'),
  lastName(name: 'Last Name', value: 'last_name'),
  maritalStatus(name: 'Marital Status', value: 'marital_status'),
  notificationEnabled(
    name: 'Notification Enabled',
    value: 'notification_enabled',
  ),
  otp(name: 'OTP', value: 'otp'),
  phone(name: 'Phone', value: 'phone'),
  phoneVerificationCode(
    name: 'Phone Verification Code',
    value: 'phone_verification_code',
  ),
  phoneVerified(name: 'Phone Verified', value: 'phone_verified'),
  platform(name: 'Platform', value: 'platform'),
  role(name: 'Role Id', value: 'role_id'),
  token(name: 'Token', value: 'token'),
  updatedAt(name: 'Updated At', value: 'updated_at'),
  userDetails(name: 'User Details', value: 'user_details'),
  userId(name: 'User Id', value: 'user_id'),
  wallet(name: 'Wallet', value: 'wallet');

  const UserField({
    required this.name,
    required this.value,
  });

  final String name;
  final String value;
}
