import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gigatech_coding_test/modules/splash/splash_screen.dart';
import 'package:gigatech_coding_test/modules/splash/splash_screen_binding.dart';
import 'package:gigatech_coding_test/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Giga Tech Coding Test',
      debugShowCheckedModeBanner: false,
      home:  const SplashScreen(),
      initialBinding: SplashScreenBinding(),
      getPages: AppPages.pages,
    );
  }
}


