import 'package:flutter/material.dart';
import 'package:deppa_app/screens/auth/auth.dart';

import 'package:deppa_app/utils/utils.dart';
import 'package:deppa_app/widgets/widget.dart';

class SignUpCongratulation extends StatefulWidget {
  const SignUpCongratulation({Key ?key}) : super(key: key);

  @override
  _SignUpCongratulationState createState() => _SignUpCongratulationState();
}

class _SignUpCongratulationState extends State<SignUpCongratulation> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              const BackButtonGeneralWidget(),
              const SizedBox(
                height: Dimensions.heightSize * 5,
              ),
              inputFieldWidget(context),
              SizedBox(
                height: 360,
                child: Image.asset('assets/images/tinck.png')
              ),
              const SizedBox(height: 21,),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                "Haz finalizado el registro. Tu cuenta está en proceso de validación",
                style: TextStyle(
                    color: CustomColor.colorBlack,
                    fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Dimensions.heightSize * 10),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.08,
                  right: MediaQuery.of(context).size.width * 0.08,
                ),
                child: SecondaryButtonWidget(
                  title: "Entiendo",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignInScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  inputFieldWidget(BuildContext context) {
    /*return Padding(
        padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize,
        ),
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: Dimensions.marginSize,
                      right: Dimensions.marginSize),
                  child: Text(
                    "¡Felicidades!",
                    style: TextStyle(
                        color: CustomColor.primaryColor,
                        fontSize: Dimensions.extraLargeTextSize * 1.5,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 2,
                ),
              ],
            )));*/
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Text("¡Felicidades!",
      style: TextStyle(
        fontSize: Dimensions.extraLargeTextSize * 1.5,
        fontWeight: FontWeight.bold,
        color: CustomColor.primaryColor
      ),
      textAlign: TextAlign.center
        //style: TextStyle(
        //color: CustomColor.primaryColor,
        //fontSize: Dimensions.extraLargeTextSize * 1.5,
        //fontWeight: FontWeight.bold),
        //textAlign: TextAlign.center,
      ),
    );
  }
}
