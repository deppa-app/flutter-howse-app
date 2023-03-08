import 'package:flutter/material.dart';
import 'package:howse_app/utils/custom_style.dart';
//import 'package:howse_app/utils/strings.dart';

class TextFormFieldRut extends StatelessWidget {
  const TextFormFieldRut({ 
    Key key, 
    @required this.controller, 
    @required this.text, 
    }) 
    : super(key: key);

  final TextEditingController controller;

  final String text;

  

  @override
  Widget build(BuildContext context) {
    return TextFormField(   
      style: CustomStyle.textStyle,
      controller: controller,
      validator: (String value) {
        
        // if (value.isEmpty) {
        //   return (Strings.fillOutField);
        // } else {
        //   // TODO: Mejorar expresión regular
          
        //   RegExp regExp = RegExp(r'[0-9]{7,8}\-[0-9kK]');
        //   bool match = regExp.hasMatch(value); 

        //   if(match == false){
        //     return(Strings.useValidRut);
        //   }

        //   return null;
        // }
      },
      decoration: CustomStyle.decorationTextFormField(text)
      
    );
  }
}