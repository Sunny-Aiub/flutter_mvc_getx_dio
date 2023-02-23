import 'package:get/get.dart';

import '../authentication/login_screen.dart';

class GetSplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    goToLoginScreen();
  }

  Future goToLoginScreen() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    Get.to(const LoginScreen());
  }
}
