import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../shared/widget/loading_btn.dart';

class VerifyBtn extends StatelessWidget {
  const VerifyBtn({
    required VoidCallback onPressed,
    super.key,
  }) : _onPressed = onPressed;

  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      onTap: _onPressed,
      name: 'Verify',
      color: AppColors.color1,
    );
  }
}
