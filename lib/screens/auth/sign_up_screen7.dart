import 'package:flutter/material.dart';
import 'package:howse_app/screens/auth/sign_up_screen8.dart';



import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';
import 'package:howse_app/widgets/back_widget.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../widgets/secondary_button_widget.dart';



class SignUpScreen7 extends StatefulWidget {
  const SignUpScreen7({Key key}) : super(key: key);

  @override
  _SignUpScreen7State createState() => _SignUpScreen7State();
}

class _SignUpScreen7State extends State<SignUpScreen7> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                    (context) => const SignUpScreen8()));
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
                      "Revisa y completa tus datos demográficos",
                       style: TextStyle(
                       color: Colors.black,
                        fontSize: Dimensions.extraLargeTextSize * 1.5,
                        fontWeight: FontWeight.bold
                       ),
                         textAlign: TextAlign.center,
                       ),
                ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _titleData(Strings.firstName),
                        TextFormField(
                          style: CustomStyle.textStyle,
                          controller: firstNameController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String value){
                            if(value.isEmpty){
                              return Strings.pleaseFillOutTheField;
                            }else{
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: Strings.demoFirstName,
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _titleData(Strings.lastName),
                        TextFormField(
                          style: CustomStyle.textStyle,
                          controller: lastNameController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String value){
                            if(value.isEmpty){
                              return Strings.pleaseFillOutTheField;
                            }else{
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: Strings.demoLastName,
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
                  )
                ],
              ),
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       
              _titleData(Strings.email),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (String value){
                  if(value.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: Strings.demoEmail,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    labelStyle: CustomStyle.textStyle,
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: CustomStyle.textStyle,
                    prefixIcon: const Icon(
                      Icons.mail_outline,
                      color: CustomColor.primaryColor,
                    )
                ),
              ),
              _titleData(Strings.username),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: usernameController,
                keyboardType: TextInputType.emailAddress,
                validator: (String value){
                  if(value.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: Strings.demoUsername,
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
              
              const SizedBox(height: Dimensions.heightSize),
              ],
            )
          )
        ]
      ) 
      ] 
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

