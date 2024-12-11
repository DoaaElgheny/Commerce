import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/utils/app_colors.dart';

class ConfirmPasswordField extends StatefulWidget {
  const ConfirmPasswordField({
    required TextEditingController controller,
    required this.validator,
    super.key,
  }) : _controller = controller;

  final TextEditingController _controller;
  final FormFieldValidator<String>? validator;

  @override
  State<ConfirmPasswordField> createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      obscureText: !isShowPassword,
      validator: widget.validator,
      inputFormatters: [
        // ignore spaces.
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      style: const TextStyle(color: AppColors.black),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: 'تأكيد كلمة المرور',
        hintText: 'قم بتأكيد كلمة المرور هنا',
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
