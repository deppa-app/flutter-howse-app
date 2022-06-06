import 'package:flutter/material.dart';
import 'package:howse_app/utils/custom_style.dart';
import 'package:howse_app/utils/strings.dart';

class TextFormFieldPassword extends StatelessWidget {
  const TextFormFieldPassword({ 
    Key key, 
    @required this.controller, 
    @required this.text, 
    this.suffixIcon, 
    }) 
    : super(key: key);

  final TextEditingController controller;

  final String text;

  final Widget suffixIcon;

  final bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,    
      style: CustomStyle.textStyle,
      controller: controller,
      validator: (String value) {
        if (value.isEmpty) {
          return Strings.pleaseFillOutTheField;
        } else {
          return null;
        }
      },
      decoration: CustomStyle.decorationTextFormField(text, suffixIcon)
      
    );
  }
}