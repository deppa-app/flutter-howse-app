//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_color.dart';
import 'dimensions.dart';

class CustomStyle {
  static const textLuft = TextStyle(
      color: CustomColor.blueColor, fontSize: 18, fontWeight: FontWeight.w500);
  static var textStyle = TextStyle(
      color: CustomColor.blueColor, fontSize: Dimensions.defaultTextSize);
  static const textStyle2 = TextStyle(
      color: CustomColor.blueColor, fontSize: 15, fontWeight: FontWeight.w500);
  static const textStyleTitle = TextStyle(
      color: CustomColor.blueColor, fontSize: 15, fontWeight: FontWeight.w500);
  static const textStyleBig = TextStyle(
      color: CustomColor.blueColor, fontSize: 22, fontWeight: FontWeight.w500);

  static const textStyleNormalPrimary = TextStyle(
      color: CustomColor.primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.w500);

  static const textStyleNormalPrimary2 = TextStyle(
      color: CustomColor.primaryColor,
      fontSize: 22,
      fontWeight: FontWeight.w500);

  static const textStyleNormalOrange = TextStyle(
      color: CustomColor.orangeColor,
      fontSize: 22,
      fontWeight: FontWeight.w500);

  static const textStyleNormalRed = TextStyle(
      color: CustomColor.redColor, fontSize: 22, fontWeight: FontWeight.w500);

  static const textStyleBigPrimary = TextStyle(
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
  static const bigTextblack =
      TextStyle(color: CustomColor.colorBlack, fontSize: 50);
  static const mediumTextblack =
      TextStyle(color: CustomColor.colorBlack, fontSize: 30);
  static const normalTextGray =
      TextStyle(color: CustomColor.colorBlack, fontSize: 16);
  static var listStyle = TextStyle(
    color: Colors.white,
    fontSize: Dimensions.largeTextSize,
  );

  static var defaultStyle =
      TextStyle(color: Colors.black, fontSize: Dimensions.largeTextSize);

  static var focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radius),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  static var focusErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radius),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  static const focusBorder2 = OutlineInputBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(Dimensions.radius),
      bottomLeft: Radius.circular(Dimensions.radius),
    ),
    borderSide: BorderSide(color: Colors.transparent),
  );

  static const focusErrorBorder2 = OutlineInputBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(Dimensions.radius),
      bottomLeft: Radius.circular(Dimensions.radius),
    ),
    borderSide: BorderSide(color: Colors.transparent),
  );

  static var searchBox = OutlineInputBorder(
    //borderRadius: BorderRadius.circular(Dimensions.radius),
    borderRadius: BorderRadius.circular(100),
    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
  );

  static var formField = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
  );

  static decorationTextFormField( String text, [Widget suffixIcon, Widget prefixIcon]){
  
     return InputDecoration(
              border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
              hintText: text,
              //contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              labelStyle: CustomStyle.textStyle,
              filled: true,
              fillColor: Colors.white,
              enabledBorder: CustomStyle.formField,
              hintStyle: CustomStyle.hintTextStyle,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon
            );

    }
    
}
