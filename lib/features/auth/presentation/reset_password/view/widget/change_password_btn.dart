import 'package:flutter/material.dart';

import '../../../../../../shared/widget/loading_btn.dart';

class ChangePasswordBtn extends StatelessWidget {
  const ChangePasswordBtn({
    required VoidCallback onPressed,
    super.key,
  }) : _onPressed = onPressed;

  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      onTap: _onPressed,
      name: 'Next',
    );
  }
}
