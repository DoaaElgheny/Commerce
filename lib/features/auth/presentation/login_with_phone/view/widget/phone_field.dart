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
      style: const TextStyle(color: Colors.black),
      validator: (v) {
        if (!(v?.isValidNumber() ?? false)) {
          return 'Not Valid Number';
        }
        return null;
      },
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 0.0,
          vertical: 12.0,
        ),
        hintText: 'Phone Number',
      ),
      initialCountryCode: 'EG',
      onChanged: (v) {
        _controller.text = v.completeNumber;
      },
    );
  }
}
