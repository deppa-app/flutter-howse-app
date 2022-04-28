import 'package:flutter/material.dart';
import 'package:howse_app/screens/auth/sign_up_screen1.dart';
import 'package:howse_app/utils/custom_color.dart';
import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';
//import 'package:howse_app/widgets/primary_button_widget.dart';
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
    return Scaffold(
        body: SizedBox(
            width: width,
            height: height,
            child: Stack(
              children: [
                const BackWidget(title: ""),
                Positioned(
                    top: 50,
                    right: -10,
                    left: -10,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: Dimensions.marginSize * 1.5,
                        right: Dimensions.marginSize * 1.5,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Unete al cambio de la comodidad",
                                style: TextStyle(
                                    color: CustomColor.primaryColor,
                                    fontSize: 22.00,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20.00,
                                  left: 50.00,
                                  right: 50.00,
                                ),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "Antes de comenzar tu registro, te pediremos que tengas a mano tu documento de identidad vigente.",
                                    style: TextStyle(
                                      color: CustomColor.primaryColor,
                                      fontSize: 16.00,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: Dimensions.topHeight,
                                  left: Dimensions.marginSize,
                                  right: Dimensions.marginSize,
                                ),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Image.asset(
                                    'assets/images/lorem-image.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: Dimensions.heightSize * 2,
                              ),
                            ],
                          ),
                          const SizedBox(height: Dimensions.heightSize * 4),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: Dimensions.marginSize,
                              right: Dimensions.marginSize,
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
                                  "¿No recibiste el código?",
                                  style: TextStyle(
                                      color: CustomColor.primaryColor,
                                      fontSize: 12.00,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: Dimensions.heightSize),
                        ],
                      ),
                    ))
              ],
            )));
  }
}
