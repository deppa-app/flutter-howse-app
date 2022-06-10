import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:howse_app/screens/auth/auth.dart';
import 'package:howse_app/utils/utils.dart';
import 'package:howse_app/widgets/widget.dart';

class SignUpScreen8 extends StatefulWidget {
  const SignUpScreen8({Key key}) : super(key: key);

  @override
  _SignUpScreen8State createState() => _SignUpScreen8State();
}

class _SignUpScreen8State extends State<SignUpScreen8> {

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
              Stack(
                children: [
                  const Icon(
                    Icons.arrow_right_rounded,
                    color: CustomColor.primaryColor,
                    size: 80,
                  ),
                  Positioned(
                    bottom: 28,
                    left: 60,
                    child: Text(Strings.paymentMethodSignUp,
                      style: const TextStyle(
                        color: CustomColor.linkColor, 
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )

                ],
              ),
            
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.13
                ),
                 child: Row(children: [
                   Image.asset('assets/images/icon/card_cash.png', scale: 1.5,), //TODO: icono provisorio
                   Padding(
                     padding: const EdgeInsets.only(
                       left: 20,
                       top: 5
                      ),
                     child: Text(Strings.creditCard,
                     style: const TextStyle(color: CustomColor.primaryColor, fontSize: 16),
                     ),
                   )
                  ],
                 )
              ),

              const Divider(
                indent: 50,
                endIndent: 50,
                thickness: 1,
                color: Colors.grey,
                ),
                ListTileCustom(
                  fontAwesomeIcon: FontAwesomeIcons.ccVisa, 
                  title: Strings.creditVisa, 
                  onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder:
                      (context) => const SignUpScreen9()));
                    },
                  ),

              ListTileCustom(
                fontAwesomeIcon: FontAwesomeIcons.ccPaypal, 
                title: Strings.creditVisa, 
                onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder:
                    (context) => const SignUpScreen9()));
                  },
                ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

              Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.13
              ),
                child: Row(children: [
                      const FaIcon(
                              FontAwesomeIcons.creditCard,
                              color: Colors.black,
                              size: 30,
                              ), //TODO: icono provisorio
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 5
                          ),
                        child: Text(Strings.prepaidOption,
                        style: const TextStyle(color: CustomColor.primaryColor, fontSize: 16),
                        ),
                      )
                      ],
                      ),
              ),

              const Divider(
                indent: 50,
                endIndent: 50,
                thickness: 1,
                color: Colors.grey,
                ),

              ListTileCustom(
                fontAwesomeIcon: Icons.credit_card_rounded, 
                title: Strings.noCreditCard, 
                onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder:
                    (context) => const SignUpScreen9()));
                  },),
            
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
                    left: Dimensions.marginSize ,
                    right: Dimensions.marginSize),
                    child: Text(
                      Strings.chooseMethod,
                       style: const TextStyle(
                       color: CustomColor.primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                       ),
                         textAlign: TextAlign.center,
                    ),
                ),              
              
          ],
        )
      )
    );
  }

    

}
