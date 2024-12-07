import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    required this.name,
    required this.onTap,
    this.color,
    this.textColor,
    super.key,
  });

  final String name;
  final VoidCallback onTap;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return EasyButton(
      idleStateWidget: Text(
        name,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: textColor ?? Colors.white,
              fontSize: 14,
              height: 1.5,
              fontWeight: FontWeight.bold,
            ),
      ),
      loadingStateWidget: Container(
        padding: const EdgeInsets.all(5.0),
        child: const CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.white,
          ),
        ),
      ),
      height: 50,
      borderRadius: 10.0,
      buttonColor: color ?? Theme.of(context).primaryColor,
      onPressed: onTap,
    );
  }
}
