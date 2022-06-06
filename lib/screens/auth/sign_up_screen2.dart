import 'package:flutter/material.dart';
import 'package:howse_app/screens/auth/sign_up_screen3.dart';

import 'package:howse_app/utils/custom_color.dart';
import 'package:howse_app/utils/strings.dart';
import 'package:howse_app/utils/custom_style.dart';
import 'package:howse_app/widgets/back_widget.dart';

import '../../widgets/secondary_button_widget.dart';

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2({Key key}) : super(key: key);

  @override
  _SignUpScreen2State createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

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
              const BackWidget(title: ""),
              SizedBox(
                height: height * 0.02,
              ),
              inputFieldWidget(context),
              SizedBox(height: height * 0.35),
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.08,
                  right: width * 0.08,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SecondaryButtonWidget(
                    title: Strings.nextSignUp,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUpScreen3()));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }

  inputFieldWidget(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
        padding: EdgeInsets.only(
          left: width * 0.01,
          right: width * 0.01,
        ),
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.1,
                      right: width * 0.1,
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        Strings.titleSignUp2,
                        style: const TextStyle(
                            color: CustomColor.primaryColor,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                
                Padding(
                  padding: EdgeInsets.only(
                    top: height * 0.05,
                    left: width * 0.12,
                    right: width * 0.1,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      Strings.phoneNumberSignUp,
                      style: const TextStyle(
                        color: CustomColor.primaryColor,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: height * 0.05,
                              left: width * 0.12,
                              right: width * 0.1,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: TextFormField(
                                style: CustomStyle.textStyle,
                                controller: phoneController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return Strings.pleaseFillOutTheField;
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    hintText: Strings.formPhoneNumberSignUp,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    labelStyle: CustomStyle.textStyle,
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: CustomStyle.formField,
                                    hintStyle: CustomStyle.hintTextStyle),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                  ],
                )
              ],
            )));
  }

}
