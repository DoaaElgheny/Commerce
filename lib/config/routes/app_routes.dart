import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/features/sign_up/presentation/pages/sign_up_screen.dart';
import 'package:qubeCommerce/injection_container.dart' as di;

import '../../core/utils/app_strings.dart';
import '../../features/auth/presentation/forget_password/view/forget_password_view.dart';
import '../../features/auth/presentation/login/view/login.dart';
import '../../features/auth/presentation/login_with_phone/view/login.dart';
import '../../features/bottomNavigationBar/presentation/pages/bottom_navigation_bar.dart';
import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/splash/presentation/cubit/locale_cubit.dart';
import '../../features/splash/presentation/pages/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';

  // static const String loginScreen = '/login';
  static const String homeScreen = '/homeScreen';
  static const String signUpScreen = '/signUpScreen';

  static const String bottomNavigationBarScreen = '/bottomNavigationBarScreen';
  static const String exploreScreen = '/exploreScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => di.sl<LocaleCubit>(),
            child: SplashScreen(),
          );
        });
      // case Routes.loginScreen:
      //   return MaterialPageRoute(builder: ((context) {
      //     return const LoginScreen();
      //   }));
      // case Routes.exploreScreen:
      //   return MaterialPageRoute(builder: ((context) {
      //     return const ExploreScreen();
      //   }));
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: ((context) {
          return SignUpScreen();
        }));
      // case Routes.forgetPasswordScreen:
      //   return MaterialPageRoute(builder: ((context) {
      //     return const ForgetPasswordScreen();
      //   }));
      // case Routes.verificationCodeScreen:
      //   return MaterialPageRoute(builder: ((context) {
      //     return const VerificationCodeScreen(
      //       screen: VerificationCode.Forget,
      //     );
      //   }));

      // case Routes.getcommentsScreen:
      //   return MaterialPageRoute(builder: ((context) {
      //     return const GetComments(
      //       postId: -1,
      //     );
      //   }));
      // case Routes.resetPasswordScreen:
      //   return MaterialPageRoute(builder: ((context) {
      //     return const ResetPasswordScreen();
      //   }));
      // case Routes.passwordChangedSuccessfullyScreen:
      //   return MaterialPageRoute(builder: ((context) {
      //     return const PasswordChangedSuccessfullyScreen();
      //   }));

      // case Routes.profileFirstScreen:
      // return MaterialPageRoute(builder: ((context) {
      //   return const ProfileFirstScreen();
      // }));
      // case Routes.profileSecondScreen:
      // return MaterialPageRoute(builder: ((context) {
      //   return const ProfileSecondScreen();
      // }));
      case Routes.homeScreen:
        return MaterialPageRoute(builder: ((context) {
          return const HomeScreen();
        }));
      case Routes.bottomNavigationBarScreen:
        return MaterialPageRoute(builder: ((context) {
          return const BottomNavigationBarScreen();
        }));
      case ForgetPasswordView.routeName:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordView(),
        );
      case LoginView.routeName:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case LoginWithPhoneView.routeName:
        return MaterialPageRoute(
          builder: (context) => const LoginWithPhoneView(),
        );
      // case Routes.changePasswordScreen:
      //   return MaterialPageRoute(builder: ((context) {
      //     return ChangePasswordScreen();
      //   }));
      //
      // case Routes.aboutMeScreen:
      //   return MaterialPageRoute(builder: ((context) {
      //     return AboutMeScreen(fromHome: false,);
      //   }));
      // case Routes.changeLanguageScreen:
      //   return MaterialPageRoute(builder: ((context) {
      //     return ChangeLanguageScreen();
      //   }));
      // case Routes.contactUsScreen:
      //   return MaterialPageRoute(builder: ((context) {
      //     return ContactUsScreen();
      //   }));
      //case Routes.jobDetailsScreen:
      // return MaterialPageRoute(builder: ((context) {
      //   return JobDetailsScreen();
      // }));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
