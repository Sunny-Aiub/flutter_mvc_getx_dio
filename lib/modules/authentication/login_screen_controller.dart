import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gigatech_coding_test/utils/globals.dart';

import '../../utils/strings.dart';

class GetLoginController extends GetxController{


  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var emailControllerFocus = FocusNode();
  var passwordControllerFocus = FocusNode();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  Future goToLoginScreen() async {
    await Future.delayed(const Duration(milliseconds: 200));

  }

  String? validator(String? value) {
    if (value != null && value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  Future<void> signIn() async {
      try {
        storageData.write(Strings.email, emailController.text);
      } catch (err, _) {
        passwordController.clear();
        rethrow;
      }
  }
}