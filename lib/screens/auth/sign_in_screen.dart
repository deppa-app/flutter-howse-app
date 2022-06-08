//import 'package:flutter/cupertino.dart';
import 'package:howse_app/screens/auth/pass_sign_up_screen.dart';
import 'package:howse_app/screens/auth/terms_and_conditions.dart';
import 'package:flutter/material.dart';

import 'package:howse_app/utils/custom_color.dart';
import 'package:howse_app/utils/strings.dart';
import 'package:howse_app/utils/custom_style.dart';
import 'package:howse_app/widgets/widget.dart';

import '../dashboard/home_screen.dart';
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

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            //width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: height * 0.03, 
                          right: width * 0.05),
                        child: Text(
                          Strings.createAnAccount,
                          style: DefaultTextStyle.of(context).style.apply(
                            fontSizeFactor: 0.4, 
                            color: CustomColor.primaryColor, 
                            decoration: TextDecoration.none),
                        ),
                      ),
                      onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PassSignUpScreen()));
                        },
                    ),                  
                  ],
                ),
                bodyWidget(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          headingWidget(context),
          inputFiledWidget(context),
          SizedBox(height: height * 0.05),
          rememberForgotWidget(context),
          SizedBox(height: height * 0.04),
          signInButtonWidget(context),
          SizedBox(height: height * 0.04),
          orSignInWidget(context),
          SizedBox(height: height * 0.04),
          alreadyHaveAccountWidget(context),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }

  headingWidget(BuildContext context) {
    
     final height = MediaQuery.of(context).size.height;

    return Padding(
      
      padding: EdgeInsets.only(top: height * 0.09),
      child: Text(Strings.signInAccount, style:  const TextStyle(fontSize: 27, color: CustomColor.primaryColor,fontWeight: FontWeight.bold ), ),
      
      //child: Image.asset('assets/images/hegga_logo_2a.png'),
    );
  }

  inputFiledWidget(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    
    return Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.only(
              top: height * 0.02,
              left: width * 0.11,
              right: width * 0.11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: width * 0.04),

              CustomTextFormField(controller: emailController, text: Strings.emailLogin),

              SizedBox(height: height * 0.08),
              TextFormFieldPassword(
              controller: passwordController, 
              text: Strings.typePassword, 
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
                  ),),

              SizedBox(height: height * 0.02),
            ],
          ),
        ));
  }

  rememberForgotWidget(BuildContext context) {
    return GestureDetector(
      child: Text(
        Strings.forgotPassword,
        style: CustomStyle.textStyle,
      ),
      onTap: (){
        /* Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPasswordScreen
        //             ()));*/
      } ,
    );
  }

  signInButtonWidget(BuildContext context) {
    
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.08, right: width * 0.08),
      child: SecondaryButtonWidget(
        title: 'Iniciar Sesión',
        // icon: const Icon(
        //   Icons.arrow_forward,
        //   color: CustomColor.whiteColor,
        // ),
        onTap: () {
          if(formKey.currentState.validate()){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                const HomeScreen()));
          }
        },
      ),
    );
  }

  orSignInWidget(BuildContext context) {
    
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        
        Row(crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Expanded(child: Divider(indent: 30, endIndent: 10, thickness: 1.5)),
            Text('O si prefieres acceder', style: TextStyle(color: CustomColor.primaryColor)),
            Expanded(child: Divider(indent: 10, endIndent: 30, thickness: 1.5))
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: height * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleButtonWidget(
                icon: Image.asset('assets/images/icon/twitter.png'),
                onTap: () {},
              ),
               SizedBox(
                width: width * 0.05,
              ),
              CircleButtonWidget(
                icon: Image.asset('assets/images/icon/facebook.png'),
                onTap: () {},
              ),
              SizedBox(
                width: width * 0.05,
              ),
              CircleButtonWidget(
                icon: Image.asset('assets/images/icon/google.png'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  alreadyHaveAccountWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.footerSignUp,
          style: CustomStyle.textStyle,
        ),
        GestureDetector(
          child: Text(
            Strings.termsSignUp,
            style: const TextStyle(
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

  /*_titleData(String title) {

    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
        bottom: height * 0.005,
        top: height * 0.1,
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }*/
}
