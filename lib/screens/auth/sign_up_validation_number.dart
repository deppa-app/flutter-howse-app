import 'package:flutter/material.dart';

import 'package:deppa_app/screens/auth/auth.dart';
import 'package:deppa_app/utils/utils.dart';
import 'package:deppa_app/widgets/widget.dart';

class SignUpValidationNumbre extends StatefulWidget {
  const SignUpValidationNumbre(
      {Key ?key, /*this.address, this.email, this.password, this.phone*/})
      : super(key: key);
  /*final String ?address;
  final String ?email;
  final String ?password;
  final String ?phone;*/
  @override
  _SignUpValidationNumbreState createState() => _SignUpValidationNumbreState();
}

class _SignUpValidationNumbreState extends State<SignUpValidationNumbre> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
             const BackWidget(
              title: '',
              percent: 0.3,
            ),
            const SizedBox(
              height: Dimensions.heightSize * 2,
            ),
            inputFieldWidget(context),
            validateButtonPadding(height, width, context),
            const SizedBox(
              height: Dimensions.heightSize * 2,
            ),
            footerRow(),
          ],
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
            builder: (context) => SignUpValidationDocumentation(
                  /*address: widget.address!,
                  email: widget.email!,
                  password: widget.password!,
                  phone: widget.phone!,*/
                )));
      },
    );
  }

  Text textReciveCode() {
    return Text(
      Strings.recibeCode,
      style: const TextStyle(
          color: CustomColor.colorBlack, fontSize: 14),
      textAlign: TextAlign.center,
    );
  }

  GestureDetector _newCode() {
    return GestureDetector(
        child: GestureDetector(
      child: Text(
        Strings.newCode,
        style: const TextStyle(
            color: CustomColor.brownColor2,
            //fontWeight: FontWeight.bold,
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
                        color: CustomColor.colorBlack,
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
                      color: CustomColor.colorBlack,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTextFormField(controller: controller),
                    const SizedBox(
                      width: 30,
                    ),
                    SquareTextFormField(
                      controller: controller1,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    SquareTextFormField(
                      controller: controller2,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    SquareTextFormField(
                      controller: controller3,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.4)
              ],
            )));
  }
}

class SquareTextFormField extends StatelessWidget {
  const SquareTextFormField({
    Key ?key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: 50,
        child: TextFormField(
          decoration: CustomStyle.decorationTextFormField(''),
          controller: controller,
          showCursor: false,
          style: const TextStyle(color: CustomColor.greenColor, fontSize: 30),
          textAlign: TextAlign.center,
        ));
  }
}
