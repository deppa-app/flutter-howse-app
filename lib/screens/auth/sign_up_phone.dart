import 'package:flutter/material.dart';
import 'package:deppa_app/screens/auth/sign_up_validation_number.dart';

import 'package:deppa_app/utils/utils.dart';
import '../../widgets/widget.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpPhone extends StatefulWidget {
  const SignUpPhone({Key ?key, this.address, this.email, this.password})
      : super(key: key);
  final String ?address;
  final String ?email;
  final String ?password;

  @override
  _SignUpPhoneState createState() => _SignUpPhoneState();
}

class _SignUpPhoneState extends State<SignUpPhone> {
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
              BackWidget(title: "", percent: 0.2),
              SizedBox(height: height * 0.02),
              inputFieldWidget(context),
              SizedBox(height: height * 0.35),
              nextButtonPadding(width, context),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  Padding nextButtonPadding(double width, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.08,
        right: width * 0.08,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: _nextButton(context),
      ),
    );
  }

  SecondaryButtonWidget _nextButton(BuildContext context) {
    return SecondaryButtonWidget(
      title: Strings.nextSignUp,
      onTap: () {
        if (formKey.currentState!.validate()) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SignUpValidationNumbre(
                    /*address: widget.address!,
                    email: widget.email!,
                    password: widget.password!,
                    phone: phoneController.text,*/
                  )));
        }
      },
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
                          color: CustomColor.colorBlack,
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
                        color: CustomColor.colorBlack,
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
                              child: IntlPhoneField(
                                decoration: InputDecoration(
                                  labelText: Strings.formPhoneNumberSignUp,
                                ),
                                initialCountryCode: 'CL',
                                controller: phoneController,
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
