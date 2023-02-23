
import 'package:get/get.dart';
import 'package:gigatech_coding_test/modules/home/home_screen.dart';
import 'package:gigatech_coding_test/modules/home/home_screen_binding.dart';
import 'package:gigatech_coding_test/modules/splash/splash_screen.dart';
import 'package:gigatech_coding_test/modules/splash/splash_screen_binding.dart';
import 'package:gigatech_coding_test/routes/app_routes.dart';

import '../modules/authentication/login_screen.dart';
import '../modules/authentication/login_screen_binding.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () =>  const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginScreenBinding(),
    ),

    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeScreenBinding(),
    ),

  ];
}
