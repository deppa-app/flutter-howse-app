import 'package:flutter/material.dart';
import 'package:howse_app/screens/auth/sign_up_screen3.dart';

import 'package:howse_app/utils/custom_color.dart';
import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';
import 'package:howse_app/utils/custom_style.dart';
import 'package:howse_app/widgets/back_widget.dart';


import '../../widgets/secondary_button_widget.dart';

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2({Key key}) : super(key: key);

  @override
  _SignUpScreen2State createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {

    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              BackWidget(title: Strings.createAnAccount),
              const SizedBox(height: Dimensions.heightSize * 2,),
              inputFieldWidget(context),
              SecondaryButtonWidget(
                  title: "Siguiente",
                    onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder:
                    (context) => const SignUpScreen3()));
                  },
                ),
              const SizedBox(height: Dimensions.heightSize * 2,),
            ],
          ),
        ),
      ),
    );
  }



  inputFieldWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                 padding: const EdgeInsets.only(
                    left: Dimensions.marginSize,
                    right: Dimensions.marginSize),
                    child: Text(
                      "Phone number",
                       style: TextStyle(
                       color: Colors.black,
                        fontSize: Dimensions.extraLargeTextSize * 1.5,
                        fontWeight: FontWeight.bold
                       ),
                         textAlign: TextAlign.center,
                       ),
                        ),
              const SizedBox(height: Dimensions.heightSize * 2,),                  
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _titleData(Strings.phoneNumber),
                        TextFormField(
                          style: CustomStyle.textStyle,
                          controller: phoneController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String value){
                            if(value.isEmpty){
                              return Strings.pleaseFillOutTheField;
                            }else{
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: Strings.demoPhoneNumber,
                              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                              labelStyle: CustomStyle.textStyle,
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: CustomStyle.textStyle,
                              prefixIcon: const Icon(
                                Icons.person_outline,
                                color: CustomColor.primaryColor,
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: Dimensions.widthSize * 2,),
            
            ],
          )
          ],
        )
      )
    );
  }

  _titleData(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: Dimensions.heightSize * 0.1,
        top: Dimensions.heightSize,
      ),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black
        ),
      ),
    );
  }

}
