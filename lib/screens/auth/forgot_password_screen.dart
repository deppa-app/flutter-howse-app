import 'package:flutter/material.dart';

import 'package:howse_app/screens/auth/auth.dart';
import 'package:howse_app/screens/auth/recovery_code_screen.dart';
import 'package:howse_app/utils/utils.dart';

import 'package:howse_app/widgets/widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmEmailController = TextEditingController();

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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const BackWidget(
                      title: "",
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.03,
                          right: width * 0.03,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: width * 0.75,
                                  padding: EdgeInsets.only(top: height * 0.03),
                                  child: Text(
                                    Strings
                                        .recoverPasswordText, //se debe cambiar para tomar la variable de una clase
                                    style: const TextStyle(
                                        color: CustomColor.colorBlack,
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    left: width * 0.08,
                                    right: width * 0.08,
                                  ),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: width * 0.03,
                                          right: width * 0.03,
                                          top: height * 0.02),
                                      child: Text(
                                        Strings.recoveryBodyText,
                                        style: const TextStyle(
                                          color: CustomColor.colorBlack,
                                          fontSize: 15.00,
                                          height: 2,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.04,
                                ),
                                SizedBox(
                                  width: width * 0.8,
                                  child: Column(
                                    children: [
                                      TextFormFieldEmail(
                                          controller: emailController,
                                          text: 'Escribe tu correo'),
                                      SizedBox(
                                        height: height * 0.04,
                                      ),
                                      TextFormFieldEmail(
                                          controller: confirmEmailController,
                                          text:
                                              'Confirma tu correo electrónico'),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.07,
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.3),
                            Padding(
                              padding: EdgeInsets.only(
                                left: width * 0.05,
                                right: width * 0.05,
                              ),
                              child: SecondaryButtonWidget(
                                title: Strings.recoverPasswordText,
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const RecoveryCodeScreen()));
                                },
                              ),
                            ),
                            const SizedBox(height: Dimensions.heightSize),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ])),
    ));
  }
}
