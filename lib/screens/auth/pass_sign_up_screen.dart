import 'package:flutter/material.dart';
import 'package:howse_app/screens/auth/sign_up_screen1.dart';
import 'package:howse_app/utils/custom_color.dart';
import 'package:howse_app/utils/dimensions.dart';

import 'package:howse_app/widgets/secondary_button_widget.dart';

import '../../widgets/back_widget.dart';

class PassSignUpScreen extends StatefulWidget {
  const PassSignUpScreen({Key key}) : super(key: key);

  @override
  _PassSignUpScreenState createState() => _PassSignUpScreenState();
}

class _PassSignUpScreenState extends State<PassSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
              children: [
               const BackWidget(title: "",),
               SingleChildScrollView(
                      child: Padding(
                                padding: EdgeInsets.only(
                                  left: width * 0.05,
                                  right: width * 0.05,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          width: width* 0.6,
                                          padding: EdgeInsets.only(
                                            top: height * 0.01
                                            ),
                                          child: const Text(
                                            "Únete al cambio de la comodidad",//se debe cambiar para tomar la variable de una clase
                                            style: TextStyle(
                                                color: CustomColor.primaryColor,
                                                fontSize: 26,
                                                height: 2.0,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 20.00,
                                            left: width * 0.1 ,
                                            right: width * 0.1,
                                          ),
                                          child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                left: width * 0.02,
                                                right: width * 0.02,
                                                top: height * 0.02
                                              ),
                                              child: const Text(
                                                "Antes de comenzar tu registro, te pediremos que tengas a mano tu documento de identidad vigente.",
                                                style: TextStyle(
                                                  color: CustomColor.primaryColor,
                                                  fontSize: 16.00,
                                                  height: 2.0
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: height * 0.045,
                                            left: width * 0.02,
                                            right: width * 0.02 ,
                                          ),
                                          child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Image.asset(
                                              'assets/images/lorem-image.png',
                                              fit: BoxFit.fill,
                                              height: height * 0.38,
                                              width: width * 0.72,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.07,
                                        ),
                                      ],
                                    ),
                                    //const SizedBox(height: Dimensions.heightSize * 4),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: width * 0.05,
                                        right: width * 0.05 ,
                                      ),
                                      child: Column(
                                        children: [
                                          SecondaryButtonWidget(
                                            title: "Ir al registro",
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SignUpScreen1()));
                                            },
                                          ),
                                          const SizedBox(
                                            height: Dimensions.heightSize,
                                          ),
                                          const Text(
                                            "Al continuar, declaro haber leído los y aceptado",
                                            style: TextStyle(
                                                color: CustomColor.primaryColor,
                                                fontSize: 12.00,
                                                height: 2.0,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.left,
                                          ),
                                          GestureDetector(
                                          child: const Text(
                                            "Términos y condiciones",
                                            style: TextStyle(
                                                color: CustomColor.primaryColor,
                                                fontSize: 12.00,
                                                height: 2.0,
                                                fontWeight: FontWeight.bold,
                                                decoration: TextDecoration.underline),
                                          ),
                                          onTap: () {
                                            /*Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => const TermsAndConditions()));*/
                                          },
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: Dimensions.heightSize),
                                  ],
                                ),
                              ),
                    ),
              ],
            ),]
          )
                
              ),
    ));
  }
}
