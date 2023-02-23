import 'package:get/get.dart';
import 'package:gigatech_coding_test/modules/home/home_screen.dart';


class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => const HomeScreen());
  }
}