import 'package:flutter/material.dart';
import 'package:howse_app/screens/auth/sign_in_screen.dart';
import 'package:howse_app/utils/custom_color.dart';



import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';
import 'package:howse_app/widgets/back_widget.dart';

import '../../widgets/secondary_button_widget.dart';

class SignUpScreen10 extends StatefulWidget {
  const SignUpScreen10({Key key}) : super(key: key);

  @override
  _SignUpScreen10State createState() => _SignUpScreen10State();
}

class _SignUpScreen10State extends State<SignUpScreen10> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
              BackWidget(title: Strings.createAnAccount),
              const SizedBox(height: Dimensions.heightSize * 2,),
              inputFieldWidget(context),

              Image(
              image: const AssetImage('assets/images/lorem-image.jpeg'), 
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.4,
              
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
              Text(
                "Haz finalizado el registro. Tu cuenta está en proceso de validación",
                 style: TextStyle(
                 color: CustomColor.primaryColor,
                 fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
                ),
              const SizedBox(height: Dimensions.heightSize * 10),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.08,
                  right:MediaQuery.of(context).size.width * 0.08,
                ),
                child: SecondaryButtonWidget(
                    title: "Entendido",
                      onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder:
                      (context) => const SignInScreen()));
                    },
                  ),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                 padding: const EdgeInsets.only(
                    left: Dimensions.marginSize,
                    right: Dimensions.marginSize),
                    child: Text(
                      "¡Felicidades!",
                       style: TextStyle(
                       color: CustomColor.primaryColor,
                        fontSize: Dimensions.extraLargeTextSize * 1.5,
                        fontWeight: FontWeight.bold
                       ),
                         textAlign: TextAlign.center,
                       ),
                        ),
              const SizedBox(height: Dimensions.heightSize * 2,),                  
              
          ],
        )
      )
    );
  }

    

}
