//import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CustomColor {
  static const Color primaryColor = Color(0xFF5E7FB1);
  static const Color secondaryColor = Color(0xFFDEFFE4);
  static const Color settingColor = Color(0xFFE0F1E4);
  static const Color accentColor = Color(0xFF2C3066);
  static const Color yellowLightColor = Color(0xFFFDF5E6);
  static const Color electricVioletColor = Color(0xFF7836FC);
  static const Color redColor = Color(0xFFEB2721);
  static const Color greyColor = Color(0xFF9E9E9E);
  static const Color greenColor = Color(0xFF03A60F);
  static const Color greenLightColor = Color(0xFFD8EEDC);
  static const Color blueColor = Color(0xFF2C3066);
  static const Color whiteColor = Color(0xFFf6f3ed);
  static const Color colorBlack = Color(0xFF313131);
  static const Color secondBlack = Color.fromARGB(185, 95, 94, 94);
  static const Color orangeColor = Color(0xFFFF8000);
  static const Color linkColor = Color(0xFF0165FC);
  static const Color brownColor = Color.fromARGB(255, 191, 163, 91);
  static const Color brownColor2 = Color.fromARGB(255, 173, 119, 841);

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
