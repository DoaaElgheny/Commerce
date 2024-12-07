import 'package:flutter/material.dart';

class UnauthenticatedView extends StatelessWidget {
  const UnauthenticatedView({super.key});

  static const routeName = '/unauthenticated';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Unauthenticated!')),
    );
  }
}
