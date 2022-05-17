//import 'package:flutter/cupertino.dart';
import 'package:howse_app/screens/auth/terms_and_conditions.dart';
import 'package:howse_app/widgets/circle_button_widget.dart';
import 'package:flutter/material.dart';

import 'package:howse_app/utils/custom_color.dart';
import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';
import 'package:howse_app/utils/custom_style.dart';
import 'package:howse_app/widgets/back_widget.dart';

import '../dashboard/home_screen.dart';
import '../splash_screen.dart';
//import 'package:howse_app/auth/sign_up_screen.dart';
//import 'package:howse_app/utils/dashboard_screen.dart';
//import 'package:howse_app/auth/forgot_password_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _toggleVisibility = true;
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          //width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  new InkWell(
                    child: new Text(
                      Strings.createAnAccount,
                      style: DefaultTextStyle.of(context).style.apply(
                      fontSizeFactor: 0.6, 
                      color: CustomColor.primaryColor, 
                      decoration: TextDecoration.none),
                    ),
                    onTap: () => SplashScreen()
                ),
                  
                ],
              ),
              

              bodyWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          headingWidget(context),
          inputFiledWidget(context),
          const SizedBox(height: Dimensions.heightSize),
          rememberForgotWidget(context),
          const SizedBox(height: Dimensions.heightSize * 2),
          signInButtonWidget(context),
          const SizedBox(height: Dimensions.heightSize * 2),
          orSignInWidget(context),
          const SizedBox(height: Dimensions.heightSize * 2),
          alreadyHaveAccountWidget(context),
          const SizedBox(height: Dimensions.heightSize * 2),
        ],
      ),
    );
  }

  headingWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Text(Strings.signInAccount, style:  const TextStyle(fontSize: 45, color: CustomColor.primaryColor), ),
      
      //child: Image.asset('assets/images/hegga_logo_2a.png'),
    );
  }

  inputFiledWidget(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(
              top: Dimensions.heightSize * 2,
              left: Dimensions.marginSize,
              right: Dimensions.marginSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _titleData(Strings.email),
              TextFormField(
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
                    hintText: Strings.demoEmail,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    labelStyle: CustomStyle.textStyle,
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: CustomStyle.textStyle,
                    prefixIcon: const Icon(
                      Icons.mail_outline,
                      color: CustomColor.primaryColor,
                    )),
              ),
              _titleData(Strings.password),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: passwordController,
                validator: (String value) {
                  if (value.isEmpty) {
                    return Strings.pleaseFillOutTheField;
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: Strings.typePassword,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  labelStyle: CustomStyle.textStyle,
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: CustomStyle.textStyle,
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: CustomColor.primaryColor,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _toggleVisibility = !_toggleVisibility;
                      });
                    },
                    icon: _toggleVisibility
                        ? const Icon(
                            Icons.visibility_off,
                            color: CustomColor.primaryColor,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: CustomColor.primaryColor,
                          ),
                  ),
                ),
                obscureText: _toggleVisibility,
              ),
              const SizedBox(height: Dimensions.heightSize),
            ],
          ),
        ));
  }

  rememberForgotWidget(BuildContext context) {
    return CheckboxListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Text(
              Strings.forgotPassword,
              style: CustomStyle.textStyle,
            ),
            onTap: () {
              /* Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPasswordScreen
                ()));*/
            },
          ),
        ],
      ),
      value: checkedValue,
      onChanged: (newValue) {
        setState(() {
          checkedValue = newValue;
        });
      },
      controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
    );
  }

  signInButtonWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: CircleButtonWidget(
        icon: const Icon(
          Icons.arrow_forward,
          color: CustomColor.whiteColor,
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
              const HomeScreen()));
        },
      ),
    );
  }

  orSignInWidget(BuildContext context) {
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

  alreadyHaveAccountWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Al continuar, declaro haber leído y aceptado los",
          style: CustomStyle.textStyle,
        ),
        GestureDetector(
          child: const Text(
            "Términos y condiciones",
            style: TextStyle(
                color: CustomColor.primaryColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TermsAndConditions()));
          },
        )
      ],
    );
  }

  _titleData(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: Dimensions.heightSize * 0.5,
        top: Dimensions.heightSize,
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
