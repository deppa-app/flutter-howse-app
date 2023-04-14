import 'package:flutter/material.dart';
//import 'package:deppa_app/screens/auth/sign_in_screen.dart';

import 'package:deppa_app/utils/utils.dart';
import 'package:deppa_app/widgets/widget.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key ?key}) : super(key: key);

  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
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
              const BackWidget(title: "", percent: 0,),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              inputFieldWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  inputFieldWidget(BuildContext context) {
    return Padding(
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
                    Strings.legalTerms,
                    style: TextStyle(
                        color: CustomColor.primaryColor,
                        fontSize: Dimensions.semilarge,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 2,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.03,
                      right: MediaQuery.of(context).size.width * 0.03),
                  child: Text(
                    Strings.termsFirstText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: Dimensions.textSize18,  
                        height: 2, 
                        color: CustomColor.colorBlack),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: Dimensions.heightSize * 4,
                    left: Dimensions.marginSize,
                    right: Dimensions.marginSize,
                  ),
                  child:Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                      'assets/images/onboard/seguridad.png',
                    ),
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 4,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.03,
                      right: MediaQuery.of(context).size.width * 0.03),
                  child:  Text(
                    Strings.termsSecondText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: Dimensions.textSize18, 
                        height: 2, 
                        color: CustomColor.colorBlack),
                  ),
                ),
              ],
            )));
  }
}
