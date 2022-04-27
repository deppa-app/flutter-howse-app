import 'package:flutter/material.dart';
import 'package:howse_app/screens/auth/sign_in_screen.dart';



import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';
import 'package:howse_app/widgets/back_widget.dart';

import '../../widgets/secondary_button_widget.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key key}) : super(key: key);

  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {

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
              const BackWidget(title: "Atrás"),
              const SizedBox(height: Dimensions.heightSize * 2,),
              inputFieldWidget(context),
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
                      "Términos y Condiciones",
                       style: TextStyle(
                       color: Colors.black,
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
