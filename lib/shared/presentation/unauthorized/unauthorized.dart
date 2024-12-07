import 'package:flutter/material.dart';

class UnauthorizedView extends StatelessWidget {
  const UnauthorizedView({super.key});

  static const routeName = '/unauthorized';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Unauthorized!")),
    );
  }
}
