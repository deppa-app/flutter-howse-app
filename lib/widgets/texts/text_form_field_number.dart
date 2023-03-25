import 'package:flutter/material.dart';
import 'package:deppa_app/utils/custom_style.dart';
import 'package:deppa_app/utils/strings.dart';

class TextFormFieldNumber extends StatelessWidget {
  const TextFormFieldNumber({ 
    Key ?key, 
    required this.controller, 
    required this.text, 
    }) 
    : super(key: key);

  final TextEditingController controller;

  final String text;

  

  @override
  Widget build(BuildContext context) {
    return TextFormField(   
      style: CustomStyle.textStyle,
      controller: controller,
      validator: (String? value) {
        
        // if (value.isEmpty) {
        //   return (Strings.fillOutField);
        // } else {
        //   // TODO: Mejorar expresión regular
          
        //   RegExp regExp = RegExp(r'[9][0-9]{8}');
        //   bool match = regExp.hasMatch(value); 

        //   if(match == false){
        //     return(Strings.useValidPhone);
        //   }

        //   return null;
        // }
      },
      decoration: CustomStyle.decorationTextFormField(text)
      
    );
  }
}