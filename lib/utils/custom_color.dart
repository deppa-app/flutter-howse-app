import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CustomColor {
  static const Color primaryColor = Color(0xFF7ED321);
  static Color secondaryColor = Color(0xFFDEFFE4);
  static Color settingColor = Color(0xFFE0F1E4);
  static Color accentColor = Color(0xFF2C3066);
  static Color yellowLightColor = Color(0xFFFDF5E6);
  static Color electricVioletColor = Color(0xFF7836FC);
  static Color redColor = Color(0xFFEB2721);
  static Color greyColor = Color(0xFF9E9E9E);
  static Color greenColor = Color(0xFF03A60F);
  static Color greenLightColor = Color(0xFFD8EEDC);
  static Color blueColor = Color(0xFF2C3066);
  static Color whiteColor = Color(0xFFFFFFFF);
  static Color colorBlack = Color(0xFF313131);
  static Color orangeColor = Color(0xFFFF8000);

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
