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
            return 'غير صالح';
          case PasswordValidState.cannotBeEmpty:
            return 'هذا الحقل مطلوب';
          case PasswordValidState.lessThan8Char:
            return '"يجب أن تكون كلمة المرور مكونة من 8 أحرف على الأقل"';
        }
      },
      style: const TextStyle(
        color: AppColors.black,
        // fontSize: 12,
      ),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: 'كلمة المرور',
        hintText: 'أكتب كلمة المرور هنا',
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10.0,
        ),
        errorStyle: const TextStyle(color: Colors.red),
        suffixIcon: Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: IconButton(
            onPressed: () => setState(() => isShowPassword = !isShowPassword),
            icon: Icon(
              isShowPassword ? Icons.visibility_off : Icons.visibility,
              size: 20,
              color: AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
