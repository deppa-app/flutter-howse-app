import 'package:flutter/material.dart';
import 'package:howse_app/screens/auth/sign_up_screen1.dart';
import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';
//import 'package:howse_app/widgets/primary_button_widget.dart';
import 'package:howse_app/widgets/secondary_button_widget.dart';

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
      body:Container(
                width: width,
                height: height,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: Dimensions.topHeight,
                        left: Dimensions.marginSize,
                        right: Dimensions.marginSize,
                      ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          'assets/images/hegga_logo_1a.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
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
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: Dimensions.marginSize,
                                      right: Dimensions.marginSize),
                                  child: Text(
                                    "página de transición",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Dimensions.extraLargeTextSize * 1.5,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(height: Dimensions.heightSize * 2,),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: Dimensions.marginSize,
                                      right: Dimensions.marginSize),
                                  child: Text(
                                    "Howse",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: Dimensions.largeTextSize,
                                      fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: Dimensions.heightSize * 4),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: Dimensions.marginSize,
                                right: Dimensions.marginSize,
                              ),
                              child:  Column(
                                      children: [
                                        SecondaryButtonWidget(
                                          title: Strings.createAnAccount,
                                          onTap: () {
                                            Navigator.of(context).push(MaterialPageRoute(builder:
                                            (context) => const SignUpScreen1()));
                                          },
                                        ),
                                        const SizedBox(height: Dimensions.heightSize,),
                                        Text(
                                    "¿No recibiste el código?",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: Dimensions.largeTextSize,
                                      fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                      ],
                                    ),
                            ) ,
                            const SizedBox(height: Dimensions.heightSize),
                          ],
                        ),
                      )
                    )
                  ],
                )
              )
            );
  }
}
