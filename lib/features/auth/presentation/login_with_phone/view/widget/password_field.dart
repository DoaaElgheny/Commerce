import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      validator: (value) {
        final state = AuthValidator.validPassword(value);
        switch (state) {
          case PasswordValidState.valid:
            return null;
          case PasswordValidState.notValid:
            return 'غير صالحة';
          case PasswordValidState.cannotBeEmpty:
            return 'هذا الحقل مطلوب';
          case PasswordValidState.lessThan8Char:
            return 'يجب أن تكون كلمة المرور مكونة من 8 أحرف على الأقل';
        }
      },
      // style: const TextStyle(
      //   color: Colors.white,
      //   fontSize: 12,
      // ),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: 'كلمة المرور',
        hintText: 'أكتب كلمة المرور هنا',
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 0.0,
          vertical: 12.0,
        ),

        // contentPadding: const EdgeInsetsDirectional.all(17.5),
        errorStyle: const TextStyle(color: Colors.red),
        prefixIcon: const Icon(
          Icons.lock_outline_rounded,
          color: Colors.grey,
        ),
        suffixIcon: Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: IconButton(
            onPressed: () => setState(() => isShowPassword = !isShowPassword),
            icon: Icon(
              isShowPassword ? Icons.visibility_off : Icons.visibility,
              size: 20,
              // color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
