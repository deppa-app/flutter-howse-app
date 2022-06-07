import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:howse_app/screens/auth/sign_up_screen10.dart';
import 'package:howse_app/utils/custom_color.dart';
import 'package:howse_app/utils/custom_style.dart';



import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';
import 'package:howse_app/widgets/back_widget.dart';
import 'package:howse_app/widgets/custom_text_form_field.dart';

import '../../widgets/secondary_button_widget.dart';

class SignUpScreen9 extends StatefulWidget {
  const SignUpScreen9({Key key}) : super(key: key);

  @override
  _SignUpScreen9State createState() => _SignUpScreen9State();
}

class _SignUpScreen9State extends State<SignUpScreen9> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController numberCardController = TextEditingController();
  TextEditingController dateCardController = TextEditingController();
  TextEditingController securityCardController = TextEditingController();


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
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07),
                child: Text(
                  Strings.validateCard,
                   style: TextStyle(
                   color: Colors.grey,
                   fontSize: Dimensions.largeTextSize * 0.8,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.start,
                  ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.08,
                  right: MediaQuery.of(context).size.width * 0.08
                ),
                child: SecondaryButtonWidget(
                    title: "Guardar",
                      onTap: () {
                        if(formKey.currentState.validate()){
                            Navigator.of(context).push(MaterialPageRoute(builder:
                            (context) => const SignUpScreen10()));
                        }
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                 padding: const EdgeInsets.only(
                    left: Dimensions.marginSize,
                    right: Dimensions.marginSize ),
                    child: Text(
                      Strings.paymentMethodSignUp,
                       style: TextStyle(
                       color: CustomColor.primaryColor,
                        fontSize: Dimensions.extraLargeTextSize * 1.5,
                        fontWeight: FontWeight.bold
                       ),
                         textAlign: TextAlign.center,
                       ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: Dimensions.heightSize,
                  right: Dimensions.marginSize * 6
                ),
                child: Text(Strings.enrollingCard,
                style: const TextStyle(
                  color: CustomColor.primaryColor,
                  fontSize: 16
                ),),
              ),             
             // const SizedBox(height: 0,),

              const FaIcon(FontAwesomeIcons.ccVisa,
              size: 150,
              ),

              const Divider(
                color: Colors.grey,
                indent: 30,
                endIndent: 30,
                thickness: 2,
              ),

              _titleData(Strings.numberCard),
              CustomTextFormField(
                text: 'XXXX XXXX XXXX XXXX',
                controller: numberCardController,
                ),
                  
              Row(
                children: [
                  
                  Expanded(
                    child: Column(
                      children: [
                        _titleData(Strings.expiryDate),
                        CustomTextFormField(
                        text: Strings.monthYear,
                        controller: numberCardController,
                        ),
                      ],
                    ),
                  ),

                const SizedBox(width: 20,),

                Expanded(
                  child: Column(
                    children: [
                      _titleData('CVV'),
                      CustomTextFormField(
                        text: Strings.monthYear,
                        controller: numberCardController,
                        ),
                    ],
                  ),
                ),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: CustomColor.primaryColor,
                     
                    )
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Por favor! Confirma tu correo e inscribe tu \n tarjeta',
                    textAlign: TextAlign.justify,
                    ),
                    CheckboxListTile(
                      title: const Text(
                        "Si, es mi correo",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.00,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      value: false,
                      onChanged: (newValue) {},
                      controlAffinity:
                          ListTileControlAffinity.leading, //  <-- leading Checkbox
                    ),
                  ],
                ),
              )
            
          ],
        )
      )
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
        style: const TextStyle(
            color: Colors.black
        ),
      ),
    );
  }

}
