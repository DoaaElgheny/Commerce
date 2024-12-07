import 'package:flutter/material.dart';

class ResetCodeBtn extends StatefulWidget {
  const ResetCodeBtn({
    required this.onSend,
    super.key,
  });

  final Future<void> Function() onSend;

  @override
  State<ResetCodeBtn> createState() => _ResetCodeBtnState();
}

class _ResetCodeBtnState extends State<ResetCodeBtn> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _loading
          ? null
          : () async {
              try {
                setState(() => _loading = true);
                await widget.onSend();
              } catch (_) {
              } finally {
                setState(() => _loading = false);
              }
            },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        disabledForegroundColor: Colors.grey,
      ),
      child: const Text('Resend Code'),
    );
  }
}
