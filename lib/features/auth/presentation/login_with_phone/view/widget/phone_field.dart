import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginWithPhoneField extends StatelessWidget {
  const LoginWithPhoneField({
    required TextEditingController controller,
    super.key,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      autovalidateMode: AutovalidateMode.disabled,
      style: const TextStyle(
        color: Colors.black,
        locale: Locale('ar'),
      ),
      validator: (v) {
        if (!(v?.isValidNumber() ?? false)) {
          return 'رقم هاتف غير صالح';
        }
        return null;
      },
      decoration: const InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 0.0,
          vertical: 12.0,
        ),
        labelText: 'رقم الهاتف',
      ),
      initialCountryCode: 'EG',
      textAlign: TextAlign.start,
      dropdownTextStyle: const TextStyle(color: Colors.black),
      onChanged: (v) {
        _controller.text = v.completeNumber;
      },
    );
  }
}
