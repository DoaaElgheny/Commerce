import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:qubeCommerce/config/routes/app_routes.dart';
import 'package:qubeCommerce/features/auth/presentation/login/view/login.dart';

import '../../../../core/authentication/cache/disk/hive.dart';
import '../../../../core/authentication/provider.dart';
import '../../../../core/db/kv_db/hive.dart';
import '../../../../di/dependency_injector.dart';

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
    await Future.delayed(const Duration(seconds: 2));
    await _initAppDatabases();
    DependencyInjector.setup();

    AuthenticationProvider.injectDelegate(
      delegate: DependencyInjector.authenticationDelegateWithRxdart,
    );

    final firstTimeOpenedApp = HiveDatabase.firstTimeOpenedApp();

    if (firstTimeOpenedApp) {
      await HiveDatabase.cacheTheAppIsOpened();

      Navigator.of(context).pushNamedAndRemoveUntil(
        LoginView.routeName,
        (r) => false,
      );
      return;
    } else {
      await AuthenticationProvider.instance.init();
      final user = AuthenticationProvider.instance.currentUser;

      log('user : asdlkn $user');
      if (user == null) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          LoginView.routeName,
          (r) => false,
        );
        return;
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.bottomNavigationBarScreen,
          (r) => false,
        );
        return;
      }
    }

  }

  Future<void> _initAppDatabases() async {
    await HiveDatabase.init();
    await HiveAuthenticationCache().init();
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
