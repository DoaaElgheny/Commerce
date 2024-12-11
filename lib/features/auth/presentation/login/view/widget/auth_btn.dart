import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthButtons extends StatelessWidget {
  const AuthButtons({
    required this.onGoogle,
    required this.onPhone,
    super.key,
  });

  final VoidCallback onPhone;
  final VoidCallback onGoogle;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 50.0),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onGoogle,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0.0, 2.0),
                      blurRadius: 8,
                      spreadRadius: 0.0,
                      color: Color.fromRGBO(0, 0, 0, 0.08),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "assets/images/svg/Google_icon.svg",
                    ),
                    const SizedBox(width: 10.0),
                    const Text(
                      'جوجل',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: GestureDetector(
              onTap: onPhone,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0.0, 2.0),
                      blurRadius: 8,
                      spreadRadius: 0.0,
                      color: Color.fromRGBO(0, 0, 0, 0.08),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "assets/images/svg/Phone_icon.svg",
                    ),
                    const SizedBox(width: 10.0),
                    const Text(
                      'رقم الهاتف',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
