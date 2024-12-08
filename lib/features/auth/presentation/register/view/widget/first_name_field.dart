import 'package:flutter/material.dart';

import '../../../../domain/validators/auth.dart';
import '../../../../domain/validators/enums/name_valid_state.dart';

class FirstNameField extends StatelessWidget {
  const FirstNameField({
    required TextEditingController controller,
    super.key,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      inputFormatters: const [
        // ignore spaces.
        // FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      validator: (value) {
        final state = AuthValidator.validName(value);
        switch (state) {
          case NameValidState.valid:
            return null;
          case NameValidState.notValid:
            return 'Minimum 3 Characters';
          case NameValidState.cannotBeEmpty:
            return 'Required Field';
        }
      },
      // style: const TextStyle(color: AppColors.white),
      decoration: const InputDecoration(
        labelText: 'Name',
        hintText: 'Enter Your Full Name',
        contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        errorStyle: TextStyle(color: Colors.red),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.grey,
        ),
      ),
    );
  }
}
