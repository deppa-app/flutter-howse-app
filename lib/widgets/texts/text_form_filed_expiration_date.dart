import 'package:flutter/material.dart';
import 'package:deppa_app/utils/utils.dart';

class TextFormFieldExpirationDate extends StatelessWidget {
  const TextFormFieldExpirationDate({ 
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
      validator: (String ?value) {
        
        if (value!.isEmpty) {
          return (Strings.fillOutField);
        } else {
          // TODO: Mejorar expresión regular
          
          RegExp regExp = RegExp(r'^[0-3][1-9]\/[0-1][0-9]$');
          //TODO:corregir validación de tarjeta
          bool match= true;
          //bool match = regExp.hasMatch(value); 

          if(match == false){
            return(Strings.useValidDate);
          }

          return null;
        }
      },
      decoration: CustomStyle.decorationTextFormField(text),
      
      
      
    );
  }
}