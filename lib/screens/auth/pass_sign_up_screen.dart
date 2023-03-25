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
                     BackWidget(
                      title: "",
                      percent: 0,
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
                                        .titleSignUp, //se debe cambiar para tomar la variable de una clase
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
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: height * 0.045,
                                    left: width * 0.02,
                                    right: width * 0.02,
                                  ),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Image.asset(
                                      'assets/images/lorem-image.png',
                                      fit: BoxFit.fill,
                                      height: height * 0.38,
                                      width: width * 0.65,
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
                                right: width * 0.05,
                              ),
                              child: Column(
                                children: [
                                  SecondaryButtonWidget(
                                    title: Strings.buttonSignUp,
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                   SignUpScreen1()));
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
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      Strings.termsSignUp,
                                      style: const TextStyle(
                                          color: CustomColor.brownColor,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                   TermsAndConditions()));
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
              ])),
    ));
  }
}
