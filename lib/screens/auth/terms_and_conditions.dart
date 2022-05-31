import 'package:flutter/material.dart';
import 'package:howse_app/utils/custom_color.dart';
//import 'package:howse_app/screens/auth/sign_in_screen.dart';



import 'package:howse_app/utils/dimensions.dart';
//import 'package:howse_app/utils/strings.dart';
import 'package:howse_app/widgets/back_widget.dart';

//import '../../widgets/secondary_button_widget.dart';

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                 padding: const EdgeInsets.only(
                    left: Dimensions.marginSize,
                    right: Dimensions.marginSize),
                    child: Text(
                      "Términos legales",
                       style: TextStyle(
                       color: CustomColor.primaryColor,
                        fontSize: Dimensions.extraLargeTextSize * 1.5,
                        fontWeight: FontWeight.bold
                       ),
                         textAlign: TextAlign.center,
                       ),
              ),
              const SizedBox(height: Dimensions.heightSize * 2,),    
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03,
                  right: MediaQuery.of(context).size.width * 0.03 
                ),
                child: const Text('Lreom ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 2, 
                  color: CustomColor.primaryColor
                  ),
                ),
              ), 

              Padding(
                padding: const EdgeInsets.all(50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/images/lorem-image.png'),
                ),
              ),
            
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03,
                  right: MediaQuery.of(context).size.width * 0.03 
                ),
                child: const Text('Lreom ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 2, 
                  color: CustomColor.primaryColor
                  ),
                ),
              ), 
              
          ],
        )
      )
    );
  }

    

}
