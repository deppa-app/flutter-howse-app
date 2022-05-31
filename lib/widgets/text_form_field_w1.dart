import 'package:flutter/material.dart';
import 'package:howse_app/utils/custom_style.dart';

import '../utils/custom_color.dart';
import '../utils/dimensions.dart';
import '../utils/strings.dart';


class TextFormFieldW1 extends StatelessWidget{

  final String text;
  final Color color;
  final TextEditingController dataController;

  const TextFormFieldW1({
    Key key,
    this.text,
    this.color,
    this.dataController
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize,
        ),
        child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.00,
                    left: 30.00,
                    right: 30.00,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: TextFormField(
                      style: CustomStyle.textStyle,
                      controller: dataController,
                      keyboardType: TextInputType.emailAddress,
                      validator: ( String value ) {
                        if(value.isEmpty ){
                          return Strings.pleaseFillOutTheField;
                        }
                        return ''; //agreagado para eliminar error de consola
                      },
                      decoration: InputDecoration(
                        hintText: text,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        labelStyle: CustomStyle.textStyle,
                        filled: true,
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                                color: CustomColor.primaryColor)),
                        hintStyle: CustomStyle.hintTextStyle),
                    ),
                  ),
                ),
              ],
            )
            ),
    );
  }
}
 
// class CustomTextFormField extends StatelessWidget {
//   const CustomTextFormField({
//     Key key,
//     @required this.textEditingController,
//     @required this.pleaseFillOutTheField,
//     @required this.text,
//   }) : super(key: key);

//   final TextEditingController textEditingController;
//   final String pleaseFillOutTheField;
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       style: CustomStyle.textStyle,
//       controller: textEditingController,
//       keyboardType: TextInputType.emailAddress,
//       validator: (String value) {
//         if (value.isEmpty) {
//           return pleaseFillOutTheField;
//         } else {
//           return null;
//         }
//       },
//       decoration: InputDecoration(
//           hintText: text,
//           contentPadding: const EdgeInsets.symmetric(
//               vertical: 10.0, horizontal: 10.0),
//           labelStyle: CustomStyle.textStyle,
//           filled: true,
//           fillColor: Colors.white,
//           border: OutlineInputBorder(
//               borderRadius:
//                   BorderRadius.all(Radius.circular(5.0)),
//               borderSide: const BorderSide(
//                   color: CustomColor.primaryColor)),
//           hintStyle: CustomStyle.hintTextStyle),
//     );
//   }
// }