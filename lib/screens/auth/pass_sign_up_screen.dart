import 'package:flutter/material.dart';

import 'package:deppa_app/screens/auth/auth.dart';
import 'package:deppa_app/utils/utils.dart';

import 'package:deppa_app/widgets/widget.dart';

class PassSignUpScreen extends StatefulWidget {
  const PassSignUpScreen({Key ?key}) : super(key: key);

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
        height: height,
        width: width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/onboard/img_logo.png'),
              fit: BoxFit.cover,
            )
          ),
         
          child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     const BackWidget(title: "",percent: 0),
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
                                  padding: EdgeInsets.only(top: height * 0.05),
                                  child: Text(
                                    Strings.titleSignUp, //se debe cambiar para tomar la variable de una clase
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
                                        Strings.bodySignUp,
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
                                  height: height * 0.55,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: width * 0.05,
                                right: width * 0.05,
                              ),
                              child: Column(
                                children: [
                                  SecondaryButtonWidget(
                                    title: Strings.buttonSignUp,
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => const SignUpBasics()));
                                    },
                                  ),
                                  const SizedBox(
                                    height: Dimensions.heightSize,
                                  ),
                                  Text(
                                    Strings.footerSignUp,
                                    style: const TextStyle(
                                        color: CustomColor.colorBlack,
                                        fontSize: 12.00,
                                        height: 2.0,
                                        ),
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(height: Dimensions.heightSize * 0.9),
                                  GestureDetector(
                                    child: Text(
                                      Strings.termsSignUp,
                                      style: const TextStyle(
                                          color: CustomColor.secondaryColor,
                                          decoration: TextDecoration.underline),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                   const TermsAndConditions()));
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
                ),
              ])
              ),
    ));
  }
}
