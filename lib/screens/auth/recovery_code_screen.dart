import 'package:flutter/material.dart';

import 'package:howse_app/screens/auth/auth.dart';
import 'package:howse_app/utils/utils.dart';

import 'package:howse_app/widgets/widget.dart';

class RecoveryCodeScreen extends StatefulWidget {
  const RecoveryCodeScreen({Key key}) : super(key: key);

  @override
  _RecoveryCodeScreenState createState() => _RecoveryCodeScreenState();
}

class _RecoveryCodeScreenState extends State<RecoveryCodeScreen> {
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: height * 0.06,
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Image.asset(
                                    'assets/images/lorem-image.png',
                                    fit: BoxFit.fill,
                                    height: height * 0.25,
                                    width: width * 0.5,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.07,
                                ),
                                SizedBox(
                                  width: width * 0.75,
                                  child: const Text(
                                    'Se envió un código de seguridad a tu correo',
                                    style: TextStyle(
                                        color: CustomColor.greenColor,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: height * 0.3),
                            Padding(
                              padding: EdgeInsets.only(
                                left: width * 0.05,
                                right: width * 0.05,
                              ),
                              child: SecondaryButtonWidget(
                                title: 'Volver al HOME',
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const SignInScreen()));
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
