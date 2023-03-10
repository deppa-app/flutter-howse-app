import 'package:flutter/material.dart';
import 'package:howse_app/utils/checkbox_validate.dart';
import 'package:howse_app/utils/custom_style.dart';
import 'package:howse_app/utils/strings.dart';

class TextFormFieldPassword extends StatelessWidget {
  const TextFormFieldPassword({
    Key key,
    @required this.controller,
    @required this.text,
    this.controller2,
    this.suffixIcon,
    this.value,
    this.callBack,
    this.obscureText = true,
  }) : super(key: key);

  final Function callBack;

  final TextEditingController controller;

  final TextEditingController controller2;

  final String text;

  final Widget suffixIcon;

  final bool value;

  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      style: CustomStyle.textStyle,
      controller: controller,
      validator: (String value) {
        // if (value.isEmpty) {
        //   return (Strings.fillOutField);
        // } else if (controller != null && controller2 == null){
        //   // TODO: Mejorar expresión regular

        //   RegExp regExp = RegExp(r'[a-zA-Z0-9@._\-¡!]{8,15}');
        //   bool match = regExp.hasMatch(value);

        //   if(!match){
        //     return(Strings.passwordsNotMatch);
        //   }

        // }else if(controller2 != null) {
        //   if(controller.text != controller2.text){

        //       return (Strings.passwordsNotMatch);

        //     }
        // }
        return null;
      },
      decoration: CustomStyle.decorationTextFormField(text, suffixIcon),
      onChanged: callBack != null
          ? callBack(
              validateUppercase(controller.text),
              validateLowercase(controller.text),
              validateCharacter(controller.text),
              validateLenght(controller.text))
          : (String value) {
              return;
            },
    );
  }
}
