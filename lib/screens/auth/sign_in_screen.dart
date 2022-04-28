//import 'package:flutter/cupertino.dart';
import 'package:howse_app/screens/auth/terms_and_conditions.dart';
import 'package:howse_app/widgets/circle_button_widget.dart';
import 'package:flutter/material.dart';

import 'package:howse_app/utils/custom_color.dart';
import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';
import 'package:howse_app/utils/custom_style.dart';
import 'package:howse_app/widgets/back_widget.dart';
//import 'package:howse_app/auth/sign_up_screen.dart';
//import 'package:howse_app/utils/dashboard_screen.dart';
//import 'package:howse_app/auth/forgot_password_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
<<<<<<< HEAD
=======

>>>>>>> main
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
<<<<<<< HEAD
              BackWidget(
                title: Strings.signInAccount,
              ),
=======
              BackWidget(title: Strings.signInAccount,),
>>>>>>> main
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
<<<<<<< HEAD
      padding: const EdgeInsets.only(top: Dimensions.heightSize * 2),
      child: Image.asset('assets/images/hegga_logo_2a.png'),
=======
      padding: const EdgeInsets.only(
          top: Dimensions.heightSize * 2
      ),
      child: Image.asset(
        'assets/images/hegga_logo_2a.png'
      ),
>>>>>>> main
    );
  }

  inputFiledWidget(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(
              top: Dimensions.heightSize * 2,
              left: Dimensions.marginSize,
<<<<<<< HEAD
              right: Dimensions.marginSize),
=======
              right: Dimensions.marginSize
          ),
>>>>>>> main
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _titleData(Strings.email),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
<<<<<<< HEAD
                validator: (String value) {
                  if (value.isEmpty) {
                    return Strings.pleaseFillOutTheField;
                  } else {
=======
                validator: (String value){
                  if(value.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
>>>>>>> main
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: Strings.demoEmail,
<<<<<<< HEAD
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
=======
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
>>>>>>> main
                    labelStyle: CustomStyle.textStyle,
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: CustomStyle.textStyle,
                    prefixIcon: const Icon(
                      Icons.mail_outline,
                      color: CustomColor.primaryColor,
<<<<<<< HEAD
                    )),
=======
                    )
                ),
>>>>>>> main
              ),
              _titleData(Strings.password),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: passwordController,
<<<<<<< HEAD
                validator: (String value) {
                  if (value.isEmpty) {
                    return Strings.pleaseFillOutTheField;
                  } else {
=======
                validator: (String value){
                  if(value.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
>>>>>>> main
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: Strings.typePassword,
<<<<<<< HEAD
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
=======
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
>>>>>>> main
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
<<<<<<< HEAD
                            Icons.visibility_off,
                            color: CustomColor.primaryColor,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: CustomColor.primaryColor,
                          ),
=======
                      Icons.visibility_off,
                      color: CustomColor.primaryColor,
                    )
                        : const Icon(
                      Icons.visibility,
                      color: CustomColor.primaryColor,
                    ),
>>>>>>> main
                  ),
                ),
                obscureText: _toggleVisibility,
              ),
              const SizedBox(height: Dimensions.heightSize),
            ],
          ),
<<<<<<< HEAD
        ));
=======
        )
    );
>>>>>>> main
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
<<<<<<< HEAD
              /* Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPasswordScreen
=======
             /* Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPasswordScreen
>>>>>>> main
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
<<<<<<< HEAD
      controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
=======
      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
>>>>>>> main
    );
  }

  signInButtonWidget(BuildContext context) {
    return Padding(
<<<<<<< HEAD
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: CircleButtonWidget(
        icon: const Icon(
          Icons.arrow_forward,
          color: CustomColor.whiteColor,
=======
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: CircleButtonWidget(
        icon: const Icon(
          Icons.arrow_forward,
          color: CustomColor.primaryColor,
>>>>>>> main
        ),
        onTap: () {
          /*Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
              DashboardScreen()));*/
        },
      ),
    );
  }

  orSignInWidget(BuildContext context) {
    return Column(
      children: [
<<<<<<< HEAD
        const Text('Or'),
=======
        const Text(
          'Or'
        ),
>>>>>>> main
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleButtonWidget(
<<<<<<< HEAD
              icon: Image.asset('assets/images/icon/facebook.png'),
              onTap: () {},
            ),
            const SizedBox(
              width: Dimensions.widthSize,
            ),
            CircleButtonWidget(
              icon: Image.asset('assets/images/icon/google.png'),
              onTap: () {},
=======
              icon: Image.asset(
                  'assets/images/icon/facebook.png'
              ),
              onTap: () {

              },
            ),
            const SizedBox(width: Dimensions.widthSize,),
            CircleButtonWidget(
              icon: Image.asset('assets/images/icon/google.png'),
              onTap: () {

              },
>>>>>>> main
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
<<<<<<< HEAD
                decoration: TextDecoration.underline),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TermsAndConditions()));
=======
              decoration: TextDecoration.underline
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                const TermsAndConditions()));
>>>>>>> main
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
<<<<<<< HEAD
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
=======
        style: const TextStyle(
            color: Colors.black
        ),
      ),
    );
  }

>>>>>>> main
}
