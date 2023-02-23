import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gigatech_coding_test/modules/splash/splash_screen_controller.dart';
import 'package:gigatech_coding_test/utils/asset_constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetSplashController>(
      init: GetSplashController(),
      builder: (controller) => Scaffold(
          body: Center(
        child: SvgPicture.asset(
          AssetConstant.logoIcon,
          height: 90,
          width: 90,
        ),
      )),
    );
  }
}
