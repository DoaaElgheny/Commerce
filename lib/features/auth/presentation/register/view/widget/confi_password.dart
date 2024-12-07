import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/utils/app_colors.dart';

class ConfirmPasswordField extends StatefulWidget {
  const ConfirmPasswordField({
    required TextEditingController controller,
    required String? Function(String?)? validator,
    super.key,
  })  : _validator = validator,
        _controller = controller;

  final TextEditingController _controller;
  final FormFieldValidator<String>? _validator;
  @override
  State<ConfirmPasswordField> createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      obscureText: !isShowPassword,
      validator: widget._validator,
      style: const TextStyle(color: Colors.white),
      inputFormatters: [
        // ignore spaces.
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      decoration: InputDecoration(
        hintText: 'Confirm Password',
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
