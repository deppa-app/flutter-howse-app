import 'package:flutter/material.dart';
import 'package:howse_app/screens/auth/sign_up_screen8.dart';



import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';
import 'package:howse_app/widgets/back_widget.dart';
import 'package:howse_app/widgets/circle_button_widget.dart';

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

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          color: Colors.white,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              BackWidget(title: Strings.createAnAccount),
              SizedBox(height: height * 0.05),
              inputFieldWidget(context),
              SizedBox(height: height * 0.03),
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.1,
                  right: width * 0.1,
                ),
                child: SecondaryButtonWidget(
                    title: "Siguiente",
                      onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder:
                      (context) => const SignUpScreen8()));
                    },
                  ),
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
      child: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: Dimensions.marginSize,
                    right: Dimensions.marginSize),
                    child: Column(
                      children:[ 
                        const Text(
                        "Revisa y completa tus datos demográficos",
                          style: TextStyle(
                          color: CustomColor.primaryColor,
                          fontSize: 26,
                          fontWeight: FontWeight.bold
                          ),
                            textAlign: TextAlign.center,
                        ),
                        Row(
                          children: [
                            //TODO: Cambiar CircleButtonWidget por elemento seleccionable
                            SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.18,
                                right: MediaQuery.of(context).size.width * 0.06
                                ),
                              child: Column(
                                children:[ 
                                  CircleButtonWidget(
                                  icon: Image.asset('assets/images/icon/facebook.png'),
                                  onTap: () {},
                                  ),
                                  const Text('Hombre')
                                ]
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.1,
                              right: MediaQuery.of(context).size.width * 0.06                                
                              ),
                              child: Column(
                                children: [
                                  CircleButtonWidget(
                                    icon: Image.asset('assets/images/icon/facebook.png'),
                                    onTap: () {},
                                  ),
                                  const Text('Mujer')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]
                    ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.08,
                    right: MediaQuery.of(context).size.width * 0.08,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _titleData('RUT'),
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
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: CustomColor.primaryColor,)),
                          ),
                      ),
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
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: CustomColor.primaryColor,))
                        ),
                      ),
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
                          border:const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: CustomColor.primaryColor,)),
                        ),
                      ),
                      _titleData('Fecha de nacimiento'),
                      TextFormField(
                        style: CustomStyle.textStyle,
                        controller: emailController,
                        keyboardType: TextInputType.datetime,
                        validator: (String value){
                          if(value.isEmpty){
                            return Strings.pleaseFillOutTheField;
                          }else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'dd/mm/aaaa',
                          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                          labelStyle: CustomStyle.textStyle,
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: CustomStyle.textStyle,
                          border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: CustomColor.primaryColor,)),
                          suffixIcon: const Icon(
                            Icons.calendar_month,
                            color: CustomColor.primaryColor,
                          )
                        ),
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height * 0.03,),

                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width *0.15
                        ),
                        child: const Text('Cédula de identidad',
                            style: TextStyle(
                              fontSize: 16,
                              color: CustomColor.primaryColor,
                              fontWeight: FontWeight.bold),


                        ),
                      ),
                      _titleData('Fecha de emision'),
                      TextFormField(
                        style: CustomStyle.textStyle,
                        controller: usernameController,
                        keyboardType: TextInputType.datetime,
                        validator: (String value){
                          if(value.isEmpty){
                            return Strings.pleaseFillOutTheField;
                          }else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'dd/mm/aaaa',
                          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                          labelStyle: CustomStyle.textStyle,
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: CustomStyle.textStyle,
                          border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: CustomColor.primaryColor,)),
                          suffixIcon: const Icon(
                            Icons.calendar_month,
                            color: CustomColor.primaryColor,
                          )
                        ),
                      ),
                      _titleData('Fecha de expiración'),
                      TextFormField(
                        style: CustomStyle.textStyle,
                        controller: usernameController,
                        keyboardType: TextInputType.datetime,
                        validator: (String value){
                          if(value.isEmpty){
                            return Strings.pleaseFillOutTheField;
                          }else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'dd/mm/aaaa',
                          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                          labelStyle: CustomStyle.textStyle,
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: CustomStyle.textStyle,
                          border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: CustomColor.primaryColor,)),
                          suffixIcon: const Icon(
                            Icons.calendar_month,
                            color: CustomColor.primaryColor,
                          )
                        ),
                      ),
                    ],
                  ),
                ),
              ] 
            ) 
        ),
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
