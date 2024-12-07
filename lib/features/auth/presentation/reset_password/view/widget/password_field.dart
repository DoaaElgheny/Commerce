import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../domain/validators/auth.dart';
import '../../../../domain/validators/enums/password_valid_state.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    required TextEditingController controller,
    super.key,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      obscureText: !isShowPassword,
      inputFormatters: [
        // ignore spaces.
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      validator: (value) {
        final state = AuthValidator.validPassword(value);
        switch (state) {
          case PasswordValidState.valid:
            return null;
          case PasswordValidState.notValid:
            return 'Not Valid';
          case PasswordValidState.cannotBeEmpty:
            return 'Required Field';
          case PasswordValidState.lessThan8Char:
            return 'Password Must Be At Least 8 Characters';
        }
      },
      style: const TextStyle(
        color: AppColors.white,
        fontSize: 12,
      ),
      decoration: InputDecoration(
        labelText: 'Password',
        errorStyle: const TextStyle(color: AppColors.appRed),
        suffixIcon: Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: IconButton(
            onPressed: () => setState(() => isShowPassword = !isShowPassword),
            icon: Icon(
              isShowPassword ? Icons.visibility_off : Icons.visibility,
              size: 20,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
