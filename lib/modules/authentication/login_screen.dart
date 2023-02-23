import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gigatech_coding_test/routes/app_routes.dart';
import 'package:gigatech_coding_test/themes/color_theme.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/asset_constant.dart';
import '../../utils/globals.dart';
import '../../utils/strings.dart';
import '../../utils/widgets/input_field_widget.dart';
import 'login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetLoginController>(
      init: GetLoginController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Form(
              key: controller.loginFormKey,
              child: Column(
                // scrollDirection: Axis.vertical,
                // shrinkWrap: true,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  SvgPicture.asset(
                    AssetConstant.logoIcon,
                    height: 48,
                    width: 48,
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  Text(
                    'Sign in',
                    style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: ThemeColor.gray900),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Welcome back! Please enter your details.',
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: ThemeColor.gray600),
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  Text(
                    'Email',
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: ThemeColor.gray700),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  InputFieldWidget(
                    controller: controller.emailController,
                    focusNode: controller.emailControllerFocus,
                    backgroundColor: Colors.white,
                    isEnabled: true,
                    hintText: 'Enter your email',
                    validator: controller.validator,

                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Password',
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: ThemeColor.gray700),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  InputFieldWidget(
                    controller: controller.passwordController,
                    focusNode: controller.passwordControllerFocus,
                    backgroundColor: Colors.white,
                    isEnabled: true,
                    obscureText: true,
                    hintText: 'Enter your password',
                    validator: controller.validator,
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(AssetConstant.checkboxIcon),
                      const SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        flex: 4,
                        child: Text(
                          'Remember for 30 days ',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: ThemeColor.gray700),
                        ),
                      ),
                      const Spacer(),
                      Flexible(
                        flex: 3,
                        child: Text(
                          'Forgot password',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              color: ThemeColor.primary700),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  InkWell(
                    onTap: (){
                      if(controller.loginFormKey.currentState!.validate()){
                          controller.signIn();
                          print(storageData.read(Strings.email));

                          if(storageData.read('email') != ''){
                            Get.offAllNamed(AppRoutes.homeScreen,arguments: storageData.read(Strings.email));
                          }
                      }else{
                          ///show alert
                      }
                    },
                    child: Container(
                      height: 44,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ThemeColor.primary700,
                          borderRadius: const BorderRadius.all(Radius.circular(8))),
                      child: Center(
                          child: Text(
                        'Sign in',
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: ThemeColor.white),
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account ? ",
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: ThemeColor.gray600),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              color: ThemeColor.primary700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
