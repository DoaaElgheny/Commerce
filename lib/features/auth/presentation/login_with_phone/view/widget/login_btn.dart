import 'package:flutter/material.dart';

import '../../../../../../shared/widget/loading_btn.dart';

typedef FutureCallback = Future<void> Function();

class LoginBtn extends StatelessWidget {
  const LoginBtn({
    required VoidCallback onPressed,
    super.key,
  }) : _onPressed = onPressed;

  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      onTap: _onPressed,
      name: 'Login',
    );
  }
}
