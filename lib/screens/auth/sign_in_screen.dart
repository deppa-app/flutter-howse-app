
import 'package:flutter/material.dart';
import 'package:deppa_app/models/user.dart';
import 'package:deppa_app/screens/auth/auth.dart';


import 'package:deppa_app/utils/utils.dart';
import 'package:deppa_app/widgets/widget.dart';

import '../../services/login_auth.dart';
import '../dashboard/home_screen.dart';
import 'forgot_password_screen.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool checkedValue = false;
  bool _toggleVisibility = true;
  bool isError = false;
  late Future<DataUser?> futureUser;
  int? id;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            //width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                createAccountButton(height, width, context),
                bodyWidget(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  createAccountButton(double height, double width, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.only(top: height * 0.03, right: width * 0.05),
            child: Text(
              Strings.createAnAccount,
              textScaleFactor: 1.1,
              style: const TextStyle(
                color: CustomColor.brownColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),

            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PassSignUpScreen()));
          },
        ),
      ],
    );
  }

  bodyWidget(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Column(
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
        SizedBox(height: height * 0.05),
      ],
    );
  }

  headingWidget(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(top: height * 0.05),
      child: Column(
        children: [
        SizedBox(
          width: 160.0,  // Ancho deseado
          height: 160.0, // Alto deseado
          child: Image.asset('assets/images/onboard/deppa_logo.png'),
        ),
        Text(
          Strings.fraseLogin,
          style: const TextStyle(
              fontSize: 16,
              color: CustomColor.brownColor,
              ),
        ),
        Text(
          Strings.signInAccount,
          style: const TextStyle(
              fontSize: 27,
              color: CustomColor.brownColor,
              fontWeight: FontWeight.bold),
        ),
        ],
      )
      

      
    );
  }

  inputFiledWidget(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.only(
              top: height * 0.02, left: width * 0.11, right: width * 0.11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: width * 0.04),
              isError
                  ? Padding(
                      padding: EdgeInsets.only( left: MediaQuery.of(context).size.width * .001, bottom:5 ),
                      child: const Text(
                        "Email o contraseña incorrectos",
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  : Container(),
              CustomTextFormField(
                  controller: emailController, text: Strings.emailLogin),
              SizedBox(height: height * 0.08),
              TextFormFieldPassword(
                obscureText: _toggleVisibility,
                controller: passwordController,
                text: Strings.typePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    _toggleVisibility == true
                        ? _toggleVisibility = false
                        : _toggleVisibility = true; //TODO
                    setState(() {});
                  },
                  icon: _toggleVisibility
                      ? const Icon(
                          Icons.visibility_off,
                          color: CustomColor.colorBlack,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: CustomColor.primaryColor,
                        ),
                ),
              ),
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
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const ForgotPasswordScreen()));
        //             ()));
      },
    );
  }

  signInButtonWidget(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
      child: SecondaryButtonWidget(
          title: 'Iniciar Sesión',
          // icon: const Icon(
          //   Icons.arrow_forward,
          //   color: CustomColor.whiteColor,
          // ),
          onTap: () async {

 if (formKey.currentState!.validate()) {
                await authenticate(emailController.text.trim(),
                    passwordController.text.trim())
                .then((DataUser? user) {
                    isError = false;
                    if (user != null) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen(
                                idProfile: user.id,
                                tokenSession: user.token,
                              )));
                    } else {
                      isError = true;
                      print('Contraseña o email incorrecto');
                    }
                }).catchError((error) {
                  print(error);
                  isError = true;
                    isError = true;
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error de autenticación'),
                            content: Text(
                                'El email o la contraseña son incorrectos'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('Cerrar'))
                            ],
                          );
                        });
                });
              }


            /*Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen(
                                idProfile: id,
                              )));*/
            //final authService = Provider.of<AuthService>(context, listen: false);
          
          }),
    );
  }

  orSignInWidget(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Expanded(child: Divider(indent: 30, endIndent: 10, thickness: 1.5)),
            Text('O si prefieres acceder',
                style: TextStyle(color: CustomColor.secondBlack)),
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
                color: CustomColor.brownColor,
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


}
