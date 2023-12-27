import 'package:flutter/material.dart';

import 'package:intl_phone_field/intl_phone_field.dart';


import 'package:deppa_app/screens/auth/sign_up_validation_number.dart';

import 'package:deppa_app/utils/utils.dart';
//import '../../services/sms_validate.dart';
import '../../widgets/widget.dart';

String area = '56';

class SignUpPhone extends StatefulWidget {
  const SignUpPhone({Key ?key, this.address, this.email, this.password})
      : super(key: key);
  final String ?address;
  final String ?email;
  final String ?password;

  @override
  _SignUpPhoneState createState() => _SignUpPhoneState();
}

class _SignUpPhoneState extends State<SignUpPhone> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();
  




  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Datos Recibidos de Pantalla: SignUpBasics');
    print('Email:  ${widget.email}');
    print('Contraseña: ${widget.password}');
    print('Dirección: ${widget.address}');
    

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


//Pantalla general
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
              const BackWidget(title: "", percent: 0.2),
              SizedBox(height: height * 0.02),
              inputFieldWidget(context),
              SizedBox(height: height * 0.35),
              nextButtonPadding(width, context),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

//Componente de registro de número celular
  inputFieldWidget(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
        padding: EdgeInsets.only(
          left: width * 0.01,
          right: width * 0.01,
        ),
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Título de la pantalla
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.1,
                    right: width * 0.1,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      Strings.titleSignUp2,
                      style: const TextStyle(
                          color: CustomColor.colorBlack,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                //Texto de Indicaciones
                Padding(
                  padding: EdgeInsets.only(
                    top: height * 0.05,
                    left: width * 0.12,
                    right: width * 0.1,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      Strings.phoneNumberSignUp,
                      style: const TextStyle(
                        color: CustomColor.colorBlack,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                //Imput de número de teléfono
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: height * 0.05,
                              left: width * 0.12,
                              right: width * 0.1,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: IntlPhoneField(
                                decoration: InputDecoration(
                                  labelText: Strings.formPhoneNumberSignUp,
                                ),
                                initialCountryCode: 'CL',
                                controller: phoneController,
                                onChanged: (phone) {
                                    print(phone.completeNumber);
                                },
                                onCountryChanged: (country) {
                                  print('Country changed to: ' + country.dialCode);
                                  area = country.dialCode;
                                },
                                
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                  ],
                )
              ],
            )
      )
    );
  }



  //Componente Botón de Siguiente
  Padding nextButtonPadding(double width, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.08,
        right: width * 0.08,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: SecondaryButtonWidget(
          title: Strings.nextSignUp,
          onTap: () async{
            if (formKey.currentState!.validate()) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SignUpValidationNumbre(
                        address: widget.address!,
                        email: widget.email!,
                        password: widget.password!,
                        phone: '+'+area+phoneController.text,
                      )
                  )
                );
              /*if(await sendCode(phoneController.text, area) == 200){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SignUpValidationNumbre(
                        address: widget.address!,
                        email: widget.email!,
                        password: widget.password!,
                        phone: '+'+area+phoneController.text,
                      )
                  )
                );
              }else{
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(Strings.error),
                      content: Text(Strings.errorMessage),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(Strings.returnBtn),
                        ),
                      ],
                    );
                  },
                );
              }*/
              
            }
          },
        )
      ),
    );
  }
}
