import 'package:flutter/material.dart';
import 'package:howse_app/screens/auth/sign_up_screen7.dart';


import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';
import 'package:howse_app/widgets/back_widget.dart';

import '../../utils/custom_color.dart';
import '../../widgets/secondary_button_widget.dart';

class SignUpScreen6 extends StatefulWidget {
  const SignUpScreen6({Key key}) : super(key: key);

  @override
  _SignUpScreen6State createState() => _SignUpScreen6State();
}

class _SignUpScreen6State extends State<SignUpScreen6> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



  @override
  void initState() {

    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [ 
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.05
                    ),
                    child: const Icon(Icons.person_outline_rounded, size: 50, ),
                  ),
                  Text(
                    " Tomar foto facial",
                     style: TextStyle(
                     color: Colors.grey,
                     fontSize: Dimensions.largeTextSize,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.start,
                    ),
                ],
              ),
              const SizedBox(height: 340,),
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.1,
                  right: width * 0.1,
                ),
                child: SecondaryButtonWidget(
                    title: "Validar",
                      onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder:
                      (context) => const SignUpScreen7()));
                    },
                  ),
              ),
              const SizedBox(height: Dimensions.heightSize * 2,),
              Text(
                "¿Instrucciones para tomar las fotografías?",
                 style: TextStyle(
                 color: Colors.grey,
                 fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }


 inputFieldWidget(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.02,
        right: width * 0.02,
      ),
      child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                 padding: EdgeInsets.only(
                    left: width * 0.2,
                    right: width * 0.2),
                    child: const Text(
                      "Verificación de identidad real",
                       style: TextStyle(
                       color: CustomColor.primaryColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold
                       ),
                         textAlign: TextAlign.center,
                       ),
                ),
              const SizedBox(height: Dimensions.heightSize * 2,),  
              const Padding(
                 padding: EdgeInsets.only(
                    left: Dimensions.marginSize,
                    right: Dimensions.marginSize),
                    child: Text(
                      "Situa tu teléfono celular al frente de tu rostro, evitar elementos extra (gorro, cubre boca, etc)",
                       style: TextStyle(
                       color: CustomColor.primaryColor,
                        fontSize: 16,
                       ),
                         textAlign: TextAlign.start,
                      ),
                ),  
                Padding(
                 padding: EdgeInsets.only(
                    top: height * 0.016,
                    left: Dimensions.marginSize,
                    right: Dimensions.marginSize),
                    child: Text(
                      "Sube tu cedula de identidad",
                       style: TextStyle(
                       color: CustomColor.primaryColor,
                        fontSize: Dimensions.extraSmallTextSize * 1.8,
                        fontWeight: FontWeight.bold
                       ),
                         textAlign: TextAlign.start,
                      ),
                ),               
              
          ],
        )
      )
    );
  }

    

}