import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../domain/validators/auth.dart';
import '../../../../domain/validators/enums/phone_valid_state.dart';

class PhoneField extends StatefulWidget {
  const PhoneField({
    required TextEditingController controller,
    super.key,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      textInputAction: TextInputAction.done,
      onTapOutside: (v) {
        Focus.of(context).unfocus();
      },
      keyboardType: TextInputType.phone,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        // ignore spaces.
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      validator: (value) {
        final state = AuthValidator.validPhone(value);
        switch (state) {
          case PhoneValidState.valid:
            return null;
          case PhoneValidState.cannotBeEmpty:
            return 'Required Field';
          case PhoneValidState.notValid:
          case PhoneValidState.lessThan8Char:
            return 'Not Valid Phone';
        }
      },
      decoration: InputDecoration(
        filled: true,
        errorStyle: const TextStyle(color: Colors.red),
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 17.0,
        ),
        hintText: 'Phone Number',
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.7),
        ),
        prefixIcon: Icon(
          Icons.call,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
