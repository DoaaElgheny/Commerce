import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qubeCommerce/features/login/presentation/pages/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentSection = 1;

  @override
  void initState() {
    super.initState();
    _startSplashSequence();
  }

  void _startSplashSequence() async {
    // Show the first section for 3 seconds
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _currentSection = 2;
    });

    // Show the second section for another 3 seconds
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _currentSection = 3;
    });

    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _currentSection = 4;
    });

    // After that, navigate to the next screen or display all sections
    await Future.delayed(const Duration(seconds: 4));
    //we put Logic here if he logged go to home if not go to login
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (r) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildSection(),
      ),
    );
  }

  Widget _buildSection() {
    switch (_currentSection) {
      case 1:
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        );
      case 2:
        return Container(
          alignment: Alignment.topCenter,
          child: Image.asset(
            'assets/images/png/SS-Top.png',
            fit: BoxFit.cover,
            height: 72,
            width: 343,
          ),
        );
      case 3:
        return Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/png/SS-Top.png',
                fit: BoxFit.cover,
                height: 72,
                width: 343,
              ),
            ),
            Positioned(
                top: 260,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: const Column(
                    children: [
                      Text(
                        "Qube",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF000080)),
                      ),
                      Text("Commerce",
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF000080)))
                    ],
                  ),
                )),
            Positioned(
              top: 470,
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                //color: Colors.amber,
                child: Image.asset(
                  'assets/images/png/SS_Bottom.png',
                  fit: BoxFit.cover,
                  height: 342,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            )
          ],
        );
      case 4:
        return Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/png/SS-Top.png',
                fit: BoxFit.cover,
                height: 72,
                width: 343,
              ),
            ),
            Positioned(
                top: 260,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: const Column(
                    children: [
                      Text(
                        "Qube",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF000080)),
                      ),
                      Text("Commerce",
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF000080)))
                    ],
                  ),
                )),
            Positioned(
              top: 399,
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                //color: Colors.amber,
                child: Image.asset(
                  'assets/images/png/SS_Middle.png',
                  fit: BoxFit.cover,
                  height: 379,
                  width: 265,
                ),
              ),
            ),
            Positioned(
              top: 470,
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                //color: Colors.amber,
                child: Image.asset(
                  'assets/images/png/SS_Bottom.png',
                  fit: BoxFit.cover,
                  height: 342,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            )
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   late Timer _timer;

//   // _startDelay() {
//   //   Future.delayed(const Duration(seconds: 3), () {
//   //     // Replace 'NextPage' with your desired page.
//   //     Navigator.pushReplacement(
//   //       context,
//   //       MaterialPageRoute(builder: (context) => DealDetailsScreen()),
//   //     );
//   //   });

//   //   // _timer = Timer(const Duration(milliseconds: 2000), () => _goNext());
//   //   // _timer = Timer(
//   //   //     const Duration(milliseconds: 2000),
//   //   //     () async =>
//   //   //         await qubeCommerceFirebaseRemoteConfig().versionCheck(context: context));
//   // }

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _startDelay();
//   // }

//   // @override
//   // void dispose() {
//   //   _timer.cancel();
//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Container(
//               alignment: Alignment.topCenter,
//               child: Image.asset(
//                 'assets/images/png/SS-Top.png',
//                 fit: BoxFit.cover,
//                 height: 72,
//                 width: 343,
//               ),
//             ),
//             Positioned(
//                 top: 260,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   alignment: Alignment.center,
//                   child: const Column(
//                     children: [
//                       Text(
//                         "Qube",
//                         style: TextStyle(
//                             fontSize: 32,
//                             fontWeight: FontWeight.w700,
//                             color: Color(0xFF000080)),
//                       ),
//                       Text("Commerce",
//                           style: TextStyle(
//                               fontSize: 32,
//                               fontWeight: FontWeight.w700,
//                               color: Color(0xFF000080)))
//                     ],
//                   ),
//                 )),
//             Positioned(
//               top: 399,
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 alignment: Alignment.center,
//                 //color: Colors.amber,
//                 child: Image.asset(
//                   'assets/images/png/SS_Middle.png',
//                   fit: BoxFit.cover,
//                   height: 379,
//                   width: 265,
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 470,
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 alignment: Alignment.center,
//                 //color: Colors.amber,
//                 child: Image.asset(
//                   'assets/images/png/SS_Bottom.png',
//                   fit: BoxFit.cover,
//                   height: 342,
//                   width: MediaQuery.of(context).size.width,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
