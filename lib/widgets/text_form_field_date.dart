import 'package:flutter/material.dart';
import 'package:howse_app/utils/custom_style.dart';
import 'package:howse_app/utils/strings.dart';

class TextFormFieldDate extends StatelessWidget {
  const TextFormFieldDate({ 
    Key key, 
    @required this.controller, 
    @required this.text, 
    this.suffixIcon, 
    }) 
    : super(key: key);

  final TextEditingController controller;

  final String text;

  final Widget suffixIcon;

  

  @override
  Widget build(BuildContext context) {
    return TextFormField(   
      style: CustomStyle.textStyle,
      controller: controller,
      validator: (String value) {
        
        if (value.isEmpty) {
          return (Strings.fillOutField);
        } else {
          // TODO: Mejorar expresión regular
          
          RegExp regExp = RegExp(r'[0-3][1-9]\/[0-1][0-9]\/[1-2][0-9][0-9][0-9]');
          bool match = regExp.hasMatch(value); 

          if(match == false){
            return(Strings.useValidDate);
          }

          return null;
        }
      },
      decoration: CustomStyle.decorationTextFormField(text, suffixIcon),
      
      
      
    );
  }
}