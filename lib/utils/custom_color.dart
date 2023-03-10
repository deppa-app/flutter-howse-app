//import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CustomColor {
  static const Color primaryColor = Color(0x12B967);
  static const Color secondaryColor = Color(0xA76846);
  static const Color settingColor = Color(0xFFE0F1E4);
  static const Color accentColor = Color(0xFF2C3066);
  static const Color yellowLightColor = Color(0xFFFDF5E6);
  static const Color electricVioletColor = Color(0xFF7836FC);
  static const Color redColor = Color(0xFFEB2721);
  static const Color greyColor = Color(0xFF9E9E9E);
  static const Color keyboardBackgroundColor = Color(0xFFF8F8F8);
  static const Color keyboardBorderColor = Color(0xFFF8F8F8);
  static const Color greenColor = Color.fromARGB(255,77, 186, 109);

  static const Color greenLightColor = Color(0xFFD8EEDC);
  static const Color blueColor = Color(0xFF2C3066);
  static const Color whiteColor = Color(0xFFf6f3ed);
  static const Color whiteColor2 = Color.fromARGB(255, 248, 248, 248);
  static const Color colorBlack = Color(0xFF313131);
  static const Color secondBlack = Color.fromARGB(185, 95, 94, 94);
  static const Color orangeColor = Color(0xFFFF8000);
  static const Color linkColor = Color(0xFF0165FC);
  static const Color brownColor = Color.fromARGB(255, 191, 163, 91);
  static const Color brownColor2 = Color.fromARGB(255, 167, 104, 70);

  static var primaryButtonGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        whiteColor.withOpacity(0.8),
        whiteColor,
      ]);

  static var secondaryButtonGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        primaryColor.withOpacity(0.8),
        primaryColor,
      ]);
}
