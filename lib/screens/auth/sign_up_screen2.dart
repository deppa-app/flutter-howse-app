import 'package:flutter/material.dart';
import 'package:howse_app/screens/auth/sign_up_screen3.dart';

import 'package:howse_app/utils/custom_color.dart';
import 'package:howse_app/utils/dimensions.dart';
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
              BackWidget(title: ""),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              inputFieldWidget(context),
              const SizedBox(height: 70.00),
              Padding(
                padding: const EdgeInsets.only(
                  left: 50.00,
                  right: 50.00,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SecondaryButtonWidget(
                    title: "Siguiente",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUpScreen3()));
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: Dimensions.marginSize,
                      right: Dimensions.marginSize),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 50.00,
                      right: 50.00,
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Numero de teledono celular",
                        style: TextStyle(
                            color: CustomColor.primaryColor,
                            fontSize: 22.00,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.00,
                    left: 50.00,
                    right: 50.00,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Ingresar tu numero telefonico para validar tu dispositivo",
                      style: TextStyle(
                        color: CustomColor.primaryColor,
                        fontSize: 16.00,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 2,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20.00,
                              left: 30.00,
                              right: 30.00,
                            ),
                            child: Align(
                              alignment: Alignment.topCenter,
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
                                    hintText: "Escribe tu telefono personal",
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    labelStyle: CustomStyle.textStyle,
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: const BorderSide(
                                            color: CustomColor.primaryColor)),
                                    hintStyle: CustomStyle.hintTextStyle),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: Dimensions.widthSize * 2,
                    ),
                  ],
                )
              ],
            )));
  }

  _titleData(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: Dimensions.heightSize * 0.1,
        top: Dimensions.heightSize,
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
