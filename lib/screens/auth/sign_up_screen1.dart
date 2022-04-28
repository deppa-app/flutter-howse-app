import 'package:flutter/material.dart';
import 'package:howse_app/screens/auth/sign_up_screen2.dart';

import 'package:howse_app/utils/custom_color.dart';
import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';
import 'package:howse_app/utils/custom_style.dart';
import 'package:howse_app/widgets/back_widget.dart';
import 'package:howse_app/widgets/circle_button_widget.dart';

import '../../widgets/secondary_button_widget.dart';

class SignUpScreen1 extends StatefulWidget {
  const SignUpScreen1({Key key}) : super(key: key);

  @override
  _SignUpScreen1State createState() => _SignUpScreen1State();
}

class _SignUpScreen1State extends State<SignUpScreen1> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _toggleVisibility = true;
  bool checkedValue = false;

  String selectedCounty = 'United States';
  //Country _selected;

  List<String> genderList = ['Male', 'Female', 'Others'];
  String selectedGender;

  @override
  void initState() {
    super.initState();

    selectedGender = genderList[0].toString();
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
              const BackWidget(title: ""),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 90.00,
                  right: 90.00,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Informacion basica para crear tu cuenta",
                    style: TextStyle(
                        color: CustomColor.primaryColor,
                        fontSize: 22.00,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
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
                    "Ingresar tu informacion para crear tu cuenta",
                    style: TextStyle(
                      color: CustomColor.primaryColor,
                      fontSize: 16.00,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              inputFieldWidget(context),
              termsCheckBoxWidget(context),
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
                          builder: (context) => const SignUpScreen2()));
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

  headingWidget(BuildContext context) {
    return Image.asset('assets/images/sign_in.png');
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
                  top: 20.00,
                  left: 30.00,
                  right: 30.00,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: TextFormField(
                    style: CustomStyle.textStyle,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return Strings.pleaseFillOutTheField;
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Escribe tu direccion",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        labelStyle: CustomStyle.textStyle,
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: const BorderSide(
                                color: CustomColor.primaryColor)),
                        hintStyle: CustomStyle.hintTextStyle),
                  ),
                ),
              ),
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
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return Strings.pleaseFillOutTheField;
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Escribe tu correo",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        labelStyle: CustomStyle.textStyle,
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: const BorderSide(
                                color: CustomColor.primaryColor)),
                        hintStyle: CustomStyle.hintTextStyle),
                  ),
                ),
              ),
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
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return Strings.pleaseFillOutTheField;
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Escribe tu contraseña",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        labelStyle: CustomStyle.textStyle,
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: const BorderSide(
                                color: CustomColor.primaryColor)),
                        hintStyle: CustomStyle.hintTextStyle),
                  ),
                ),
              ),
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
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return Strings.pleaseFillOutTheField;
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Confirma tu contraseña",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        labelStyle: CustomStyle.textStyle,
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: const BorderSide(
                                color: CustomColor.primaryColor)),
                        hintStyle: CustomStyle.hintTextStyle),
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.heightSize),
            ],
          )),
    );
  }

  termsCheckBoxWidget(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 30.00,
            right: 30.00,
          ),
          child: SizedBox(
            height: 30.00,
            child: CheckboxListTile(
              title: const Text(
                "Una mayuscula",
                style: TextStyle(
                  color: CustomColor.primaryColor,
                  fontSize: 12.00,
                ),
                textAlign: TextAlign.justify,
              ),
              value: checkedValue,
              onChanged: (newValue) {
                setState(() {
                  checkedValue = newValue;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 0.0,
            left: 30.00,
            right: 30.00,
          ),
          child: SizedBox(
            height: 30.00,
            child: CheckboxListTile(
              title: const Text(
                "Una mayuscula",
                style: TextStyle(
                  color: CustomColor.primaryColor,
                  fontSize: 12.00,
                ),
                textAlign: TextAlign.justify,
              ),
              value: checkedValue,
              onChanged: (newValue) {
                setState(() {
                  checkedValue = newValue;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 0.0,
            left: 30.00,
            right: 30.00,
          ),
          child: SizedBox(
            height: 30.00,
            child: CheckboxListTile(
              title: const Text(
                "Un caracter especial",
                style: TextStyle(
                  color: CustomColor.primaryColor,
                  fontSize: 12.00,
                ),
                textAlign: TextAlign.justify,
              ),
              value: checkedValue,
              onChanged: (newValue) {
                setState(() {
                  checkedValue = newValue;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
          ),
        )
      ],
    );
  }

  buttonWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.00,
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: CircleButtonWidget(
        icon: const Icon(
          Icons.arrow_forward,
          color: CustomColor.primaryColor,
        ),
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SignUpScreen2()));
        },
      ),
    );
  }

  orSignUpWidget(BuildContext context) {
    return Column(
      children: [
        const Text('Or'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleButtonWidget(
              icon: Image.asset('assets/images/icon/facebook.png'),
              onTap: () {},
            ),
            const SizedBox(
              width: Dimensions.widthSize,
            ),
            CircleButtonWidget(
              icon: Image.asset('assets/images/icon/google.png'),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  ifYouDontHaveAccountWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.ifYouHaveNoAccount,
          style: CustomStyle.textStyle,
        ),
        GestureDetector(
          child: Text(
            Strings.signUp.toUpperCase(),
            style: const TextStyle(
                color: CustomColor.primaryColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SignUpScreen1()));
          },
        )
      ],
    );
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

  Future<bool> _showTermsConditions() async {
    return (await showDialog(
          context: context,
          builder: (context) => Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: CustomColor.primaryColor,
            child: Stack(
              children: [
                Positioned(
                    top: -35.0,
                    left: -50.0,
                    child: Image.asset('assets/images/splash_logo.png')),
                Positioned(
                    right: -35.0,
                    bottom: -20.0,
                    child: Image.asset('assets/images/splash_logo.png')),
                Padding(
                  padding: const EdgeInsets.only(
                      top: Dimensions.defaultPaddingSize * 2,
                      bottom: Dimensions.defaultPaddingSize * 2),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: AlertDialog(
                        content: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 45,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: Dimensions.heightSize * 2,
                                ),
                                Text(
                                  Strings.ourPolicyTerms,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: Dimensions.largeTextSize,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: Dimensions.heightSize),
                                Text(
                                  'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
                                  style: CustomStyle.textStyle,
                                ),
                                const SizedBox(height: Dimensions.heightSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CustomColor.accentColor,
                                          fontSize:
                                              Dimensions.extraLargeTextSize),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'simply random text. It has roots in a piece of classical Latin literature ',
                                        style: CustomStyle.textStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: Dimensions.heightSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CustomColor.accentColor,
                                          fontSize:
                                              Dimensions.extraLargeTextSize),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Distracted by the readable content of a page when looking at its layout.',
                                        style: CustomStyle.textStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: Dimensions.heightSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CustomColor.accentColor,
                                          fontSize:
                                              Dimensions.extraLargeTextSize),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Available, but the majority have suffered alteration',
                                        style: CustomStyle.textStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: Dimensions.heightSize * 2,
                                ),
                                Text(
                                  'When do we contact information ?',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: Dimensions.largeTextSize,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: Dimensions.heightSize),
                                Text(
                                  'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
                                  style: CustomStyle.textStyle,
                                ),
                                const SizedBox(
                                  height: Dimensions.heightSize * 2,
                                ),
                                Text(
                                  'Do we use cookies ?',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: Dimensions.largeTextSize,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: Dimensions.heightSize),
                                Text(
                                  'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
                                  style: CustomStyle.textStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      height: 35.0,
                                      width: 100.0,
                                      decoration: const BoxDecoration(
                                          color: CustomColor.secondaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                      child: Center(
                                        child: Text(
                                          Strings.decline,
                                          style: TextStyle(
                                              color: CustomColor.primaryColor,
                                              fontSize:
                                                  Dimensions.defaultTextSize,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      height: 35.0,
                                      width: 100.0,
                                      decoration: const BoxDecoration(
                                          color: CustomColor.primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                      child: Center(
                                        child: Text(
                                          Strings.agree,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  Dimensions.defaultTextSize,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                  ),
                ),
              ],
            ),
          ),
        )) ??
        false;
  }
}
