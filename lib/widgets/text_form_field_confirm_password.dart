import 'package:flutter/material.dart';
import 'package:howse_app/utils/custom_style.dart';
import 'package:howse_app/utils/strings.dart';

class TextFormFieldConfirmPassword extends StatelessWidget {
  const TextFormFieldConfirmPassword({ 
    Key key, 
    @required this.controller, 
    @required this.controller2,
    @required this.text, 
    this.suffixIcon, 
    }) 
    : super(key: key);

  final TextEditingController controller;
  final TextEditingController controller2;

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
          return (Strings.pleaseFillOutTheField);
        } else {
          if(controller.text != controller2.text){

              return (Strings.passwordsNotMatch);
              
            }
          return null;
        }
      },
      decoration: CustomStyle.decorationTextFormField(text, suffixIcon)
      
    );
  }
}