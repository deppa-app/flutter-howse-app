import 'package:flutter/material.dart';
import 'package:deppa_app/utils/custom_style.dart';
import 'package:deppa_app/utils/strings.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({ 
    Key ?key, 
    required this.controller, 
    required this.text, 
    this.suffixIcon, 
    this.prefixIcon, 
    }) 
    : super(key: key);

  final TextEditingController controller;

  final String text;

  final Widget ?suffixIcon;

  final Widget ?prefixIcon;

  final bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,    
      style: CustomStyle.textStyle,
      controller: controller,
      validator: (String? value) {
        // if (value.isEmpty) {
        //   return Strings.fillOutField;
        // } else {
        //   return null;
        // }
      },
      decoration: CustomStyle.decorationTextFormField(text, suffixIcon, prefixIcon)
      
    );
  }
}

                    
                    