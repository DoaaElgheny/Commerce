import 'package:flutter/material.dart';

import '../../core/shared_widgets/images.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.0,
      child: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Images.authbackGroundPng,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              constraints: const BoxConstraints.expand(height: 30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    offset: const Offset(0.0, -4.0),
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(999),
                  topLeft: Radius.circular(999),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0.0,
            child: Center(
              child: Image.asset(Images.backGroundPng),
            ),
          ),
        ],
      ),
    );
  }
}
