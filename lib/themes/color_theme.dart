import 'dart:ui';
import 'package:flutter/material.dart';

class ThemeColor {
  static const Color white = Color(0xffffffff);
  static const Color primaryBlack = Color(0xff141915);
  static const Color secondaryDarkGrey = Color(0xff606260);
  static const Color primaryDarkGrey = Color(0xff414141);
  static const Color primaryBlue = Color(0xFF2E2739);
  static const Color primaryGreen = Color(0xff5EBE4E);
  static const Color primaryGrey = Colors.grey;
  static const Color secondaryBlack = Color(0xff2B2F2C);
  static const Color primaryShadowGrey = Color(0xffBABABA);
  static const Color primaryYellow = Color(0xffE2B317);
  static const Color gradient1 = Color(0xFF2E2739);
  static const Color gradient2 = Color(0xFF49BEE8);
  static Color tabsBackground = const Color(0xff239DD1);


  static Color gray900 = HexColor.fromHex("#101828");
  static Color gray600 = HexColor.fromHex("#475467");
  static Color gray700 = HexColor.fromHex("#344054");
  static Color shadowColor = HexColor.fromHex("#1018280D");
  static Color gray500  = HexColor.fromHex("#667085");
  static Color gray300  = HexColor.fromHex("#D0D5DD");
  static Color gray200  = HexColor.fromHex("#EAECF0");

  static Color primary600  = HexColor.fromHex("#7F56D9");
  static Color primary700  = HexColor.fromHex("#6941C6");
  static Color blue700  = HexColor.fromHex("#1570EF");


}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}