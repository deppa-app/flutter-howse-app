import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_color.dart';
import 'dimensions.dart';

class CustomStyle {
  static var textLuft = TextStyle(
      color: CustomColor.blueColor, fontSize: 18, fontWeight: FontWeight.w500);
  static var textStyle = TextStyle(
      color: CustomColor.blueColor, fontSize: Dimensions.defaultTextSize);
  static var textStyle2 = TextStyle(
      color: CustomColor.blueColor, fontSize: 15, fontWeight: FontWeight.w500);
  static var textStyleTitle = TextStyle(
      color: CustomColor.blueColor, fontSize: 15, fontWeight: FontWeight.w500);
  static var textStyleBig = TextStyle(
      color: CustomColor.blueColor, fontSize: 22, fontWeight: FontWeight.w500);

  static var textStyleNormalPrimary = TextStyle(
      color: CustomColor.primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.w500);

  static var textStyleNormalPrimary2 = TextStyle(
      color: CustomColor.primaryColor,
      fontSize: 22,
      fontWeight: FontWeight.w500);

  static var textStyleNormalOrange = TextStyle(
      color: CustomColor.orangeColor,
      fontSize: 22,
      fontWeight: FontWeight.w500);

  static var textStyleNormalRed = TextStyle(
      color: CustomColor.redColor, fontSize: 22, fontWeight: FontWeight.w500);

  static var textStyleBigPrimary = TextStyle(
      color: CustomColor.primaryColor,
      fontSize: 22,
      fontWeight: FontWeight.w500);

  static var hintTextStyle = TextStyle(
      color: Colors.grey.withOpacity(0.5),
      fontSize: Dimensions.defaultTextSize);
  static var bigTextGray =
      TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: 50);

  static var mediumTextGray =
      TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: 30);
  static var bigTextblack =
      TextStyle(color: CustomColor.colorBlack, fontSize: 50);
  static var mediumTextblack =
      TextStyle(color: CustomColor.colorBlack, fontSize: 30);
  static var normalTextGray =
      TextStyle(color: CustomColor.colorBlack, fontSize: 16);
  static var listStyle = TextStyle(
    color: Colors.white,
    fontSize: Dimensions.largeTextSize,
  );

  static var defaultStyle =
      TextStyle(color: Colors.black, fontSize: Dimensions.largeTextSize);

  static var focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radius),
    borderSide: BorderSide(color: Colors.transparent),
  );

  static var focusErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radius),
    borderSide: BorderSide(color: Colors.transparent),
  );

  static var focusBorder2 = OutlineInputBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(Dimensions.radius),
      bottomLeft: Radius.circular(Dimensions.radius),
    ),
    borderSide: BorderSide(color: Colors.transparent),
  );

  static var focusErrorBorder2 = OutlineInputBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(Dimensions.radius),
      bottomLeft: Radius.circular(Dimensions.radius),
    ),
    borderSide: BorderSide(color: Colors.transparent),
  );

  static var searchBox = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radius),
    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
  );
}
