import 'package:flutter/material.dart';
import 'package:howse_app/screens/auth/sign_up_screen9.dart';
import 'package:howse_app/utils/custom_color.dart';


import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';
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

              Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child:  Stack(
                              children: const [
                                Icon(
                              Icons.arrow_right_rounded,
                              color: CustomColor.primaryColor,
                              size: 80,
                              ),
                              ]
                            ),
                          ),
                        TextSpan(
                          text: Strings.paymentMethodSignUp,
                          )
                      ]
                    ),
                    style: const TextStyle(
                    color: CustomColor.electricVioletColor,
                    fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.start,
                  ),
              
              
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1
                ),
                child:  Text.rich(
                    TextSpan(
                      children: [
                        const WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: 
                        Icon(
                          Icons.credit_card_rounded,
                          color: CustomColor.primaryColor,
                          size: 35,
                          )),
                        TextSpan(
                          text: Strings.creditCard,
                          )
                      ]
                    ),
                    style: const TextStyle(
                    color: CustomColor.electricVioletColor,
                    fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.start,
                  ),
              ),
              const Divider(
                indent: 50,
                endIndent: 50,
                thickness: 1,
                color: Colors.grey,
                ),

                ListTile(
                    title: Text.rich(TextSpan(
                    children: [
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: 
                      Icon(
                        Icons.credit_card_rounded,
                        color: CustomColor.primaryColor,
                        size: 35,
                        )),
                      TextSpan(
                        text: Strings.creditVisa,
                        ),
                        const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: 
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: CustomColor.primaryColor,
                          size: 35,
                        )),
                      ]
                    ),
                    ),
                    leading: const Icon(Icons.circle,
                    size: 20,
                    color: Colors.grey,
                    ),
                  ),

                  ListTile(
                    title: Text.rich(TextSpan(
                    children: [
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: 
                      Icon(
                        Icons.credit_card_rounded,
                        color: CustomColor.primaryColor,
                        size: 35,
                        )),
                      TextSpan(
                        text: Strings.creditVisa,
                        ),
                        const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: 
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: CustomColor.primaryColor,
                          size: 35,
                        )),
                      ]
                    ),
                    ),
                    leading: const Icon(Icons.circle_rounded,
                    size: 20,
                    color: Colors.grey,
                    ),
                  ),
                  Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1
                ),
                child: Text.rich(
                    TextSpan(
                      children: [
                        const WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: 
                        Icon(
                          Icons.credit_card_rounded,
                          color: CustomColor.primaryColor,
                          size: 35,
                          )),
                        TextSpan(
                          text: Strings.prepaidOption,
                          )
                      ]
                    ),
                    style: const TextStyle(
                    color: CustomColor.electricVioletColor,
                    fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.start,
                  ),
              ),
              const Divider(
                indent: 50,
                endIndent: 50,
                thickness: 1,
                color: Colors.grey,
                ),
                 ListTile(
                    title: Text.rich(TextSpan(
                    children: [
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: 
                      Icon(
                        Icons.credit_card_rounded,
                        color: CustomColor.primaryColor,
                        size: 35,
                        )),
                      TextSpan(
                        text: Strings.noCreditCard,
                        ),
                        const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: 
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: CustomColor.primaryColor,
                          size: 35,
                        )),
                      ]
                    ),
                    ),
                    leading: const Icon(Icons.circle_rounded,
                    size: 20,
                    color: Colors.grey,
                    ),
                  ),

                  
                
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.08,
                  right: MediaQuery.of(context).size.width * 0.08
                ),
                child: SecondaryButtonWidget(
                    title: Strings.validateSignUp,
                      onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder:
                      (context) => const SignUpScreen9()));
                    },
                  ),
              ),
              const SizedBox(height: Dimensions.heightSize * 2,),
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
                    child: Text(
                      Strings.chooseMethod,
                       style: const TextStyle(
                       color: CustomColor.primaryColor,
                        fontSize: 26,
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
