import 'package:get/get.dart';
import 'package:gigatech_coding_test/modules/splash/splash_screen.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreen());
  }
}
