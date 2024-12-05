import 'package:flutter/material.dart';

class CountryCodePicker extends StatelessWidget {
  const CountryCodePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('🇸🇦'),
          SizedBox(width: 8.0),
          Text('+966'),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
