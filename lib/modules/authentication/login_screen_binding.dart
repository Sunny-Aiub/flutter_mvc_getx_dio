import 'package:get/get.dart';

import 'login_screen.dart';

class LoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => const LoginScreen());
  }
}