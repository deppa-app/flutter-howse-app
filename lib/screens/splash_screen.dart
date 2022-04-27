import 'package:howse_app/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:howse_app/screens/onboard/on_board_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final List<Color> colors = <Color>[Colors.red, Colors.blue,Colors.amber];

  @override
  void initState() {

    super.initState();

    Timer(
        const Duration(
            seconds: 3
        ),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
            const OnBoardScreen()
        ))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: Center(
        child: Image.asset(
          'assets/images/hegga_logo_2a.png',
          fit: BoxFit.fill,
          height: 200,
          width: 300,
        ),
      ),
    );
  }
}
