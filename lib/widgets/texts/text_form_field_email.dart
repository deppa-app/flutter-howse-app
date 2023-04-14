import 'package:flutter/material.dart';
import 'package:deppa_app/utils/custom_style.dart';

import '../../utils/strings.dart';

class TextFormFieldEmail extends StatelessWidget {
  const TextFormFieldEmail({ 
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
        
         if (value!.isEmpty) {
           return (Strings.fillOutField);
         } else {
           // TODO: Mejorar expresión regular
           RegExp regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
           
           bool match = regExp.hasMatch(value); 

           if(!match){
             return(Strings.pleaseUseValidEmail);
           }

           return null;
         }
      },
      decoration: CustomStyle.decorationTextFormField(text)
      
    );
  }
}