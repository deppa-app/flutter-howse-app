import 'package:flutter/material.dart';

import 'package:howse_app/screens/auth/auth.dart';
import 'package:howse_app/utils/utils.dart';
import 'package:howse_app/widgets/widget.dart';

class SignUpScreen3 extends StatefulWidget {
  const SignUpScreen3(
      {Key key, this.address, this.email, this.password, this.phone})
      : super(key: key);
  final String address;
  final String email;
  final String password;
  final String phone;
  @override
  _SignUpScreen3State createState() => _SignUpScreen3State();
}

class _SignUpScreen3State extends State<SignUpScreen3> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

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
              BackWidget(title: Strings.createAnAccount),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              inputFieldWidget(context),
              SizedBox(
                height: height * 0.4,
              ), // TODO: Cambiar por widget código seguridad.
              validateButtonPadding(height, width, context),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              footerRow(),
            ],
          ),
        ),
      ),
    );
  }

  Row footerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textReciveCode(),
        const SizedBox(
          width: 10,
        ),
        _newCode()
      ],
    );
  }

  Padding validateButtonPadding(
      double height, double width, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: height * 0.06,
        left: width * 0.08,
        right: width * 0.08,
      ),
      child: validateButton(context),
    );
  }

  SecondaryButtonWidget validateButton(BuildContext context) {
    return SecondaryButtonWidget(
      title: Strings.validateSignUp,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SignUpScreen4(
                  address: widget.address,
                  email: widget.email,
                  password: widget.password,
                  phone: widget.phone,
                )));
      },
    );
  }

  Text textReciveCode() {
    return Text(
      Strings.recibeCode,
      style: const TextStyle(
          color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  GestureDetector _newCode() {
    return GestureDetector(
        child: GestureDetector(
      child: Text(
        Strings.newCode,
        style: TextStyle(
            color: CustomColor.linkColor,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline),
      ),
      // onTap: (value){},
    ));
  }

  inputFieldWidget(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
        padding: EdgeInsets.only(
          left: width * 0.05,
          right: width * 0.05,
        ),
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                  child: Text(
                    Strings.confirmNumber,
                    style: const TextStyle(
                        color: CustomColor.primaryColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.05, right: width * 0.01),
                  child: Text(
                    Strings.fourDigitCode,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 16,
                      color: CustomColor.primaryColor,
                    ),
                  ),
                ),
              ],
            )));
  }
}
