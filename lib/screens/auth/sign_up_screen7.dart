import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:howse_app/screens/auth/auth.dart';
import 'package:howse_app/utils/utils.dart';
import 'package:howse_app/widgets/widget.dart';


class SignUpScreen7 extends StatefulWidget {
  const SignUpScreen7({Key key}) : super(key: key);

  @override
  _SignUpScreen7State createState() => _SignUpScreen7State();
}

class _SignUpScreen7State extends State<SignUpScreen7> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
 // TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController runController = TextEditingController();
  TextEditingController bornController = TextEditingController();
  TextEditingController runEmitController = TextEditingController();
  TextEditingController runExpirationController = TextEditingController();
  //TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {

    super.initState();


  }
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          color: Colors.white,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              BackWidget(title: Strings.createAnAccount),
              SizedBox(height: height * 0.05),
              inputFieldWidget(context),
              SizedBox(height: height * 0.03),
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.08,
                  right: width * 0.08,
                ),
                child: SecondaryButtonWidget(
                    title: Strings.nextSignUp,
                      onTap: () {
                        if(formKey.currentState.validate()){
                            Navigator.of(context).push(MaterialPageRoute(builder:
                            (context) => const SignUpScreen8()));
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
      child: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: Dimensions.marginSize,
                    right: Dimensions.marginSize),
                    child: Column(
                      children:[ 
                        Text(
                        Strings.checkData,
                          style: const TextStyle(
                          color: CustomColor.primaryColor,
                          fontSize: 26,
                          fontWeight: FontWeight.bold
                          ),
                            textAlign: TextAlign.center,
                        ),
                        Row(
                          children: [
                            //TODO: Cambiar CircleButtonWidget por elemento seleccionable
                            SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.18,
                                right: MediaQuery.of(context).size.width * 0.06
                                ),
                              child: Column(
                                children:[ 
                                  CircleButtonWidget(
                                  icon: Image.asset('assets/images/icon/male.png', color: CustomColor.primaryColor,),
                                  onTap: () {},
                                  ),
                                  Text(Strings.man)
                                ]
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.1,
                              right: MediaQuery.of(context).size.width * 0.06                                
                              ),
                              child: Column(
                                children: [
                                  CircleButtonWidget(
                                    icon: Image.asset('assets/images/icon/female.png', color: CustomColor.primaryColor,),
                                    onTap: () {},
                                  ),
                                  Text(Strings.woman)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]
                    ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.08,
                    right: MediaQuery.of(context).size.width * 0.08,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      _titleData(Strings.rut),
                      TextFormFieldRut(
                        text: Strings.demoRut,
                        controller: runController,
                      ),
                      
                      //TODO: Crear text_form_field para nombre?
                        _titleData(Strings.firstNameEs),
                      CustomTextFormField(
                        text: Strings.firstNameEs,
                        controller: firstNameController,
                      ),
                      
                      _titleData(Strings.phoneNumberEs),
                      TextFormFieldNumber(
                        text: Strings.demoPhoneNumber,
                        controller: phoneController,
                      ),
                      
                      _titleData(Strings.dateBirth),
                      TextFormFieldDate(
                        text: Strings.formDate,
                        controller: bornController, // cambiar controller
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const FaIcon(FontAwesomeIcons.solidCalendarDays, color: CustomColor.primaryColor) 
                          ),
                      ),
                      
                      SizedBox(height: MediaQuery.of(context).size.height * 0.03,),

                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width *0.15
                        ),
                        child: Text(Strings.idSignUp,
                            style: const TextStyle(
                              fontSize: 16,
                              color: CustomColor.primaryColor,
                              fontWeight: FontWeight.bold),


                        ),
                      ),
                      _titleData(Strings.emitDate),
                      TextFormFieldDate(
                        text: Strings.formDate, 
                        controller: runEmitController, 
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const FaIcon(FontAwesomeIcons.solidCalendarDays,  color: CustomColor.primaryColor)    
                          ),
                      ),
                      
                      _titleData(Strings.expirationDateSignUp),
                      TextFormFieldDate(
                        text: Strings.formDate, 
                        controller: runExpirationController, 
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const FaIcon(FontAwesomeIcons.solidCalendarDays,  color: CustomColor.primaryColor)  
                          ),
                        ),
                              
                      
                    ],
                  ),
                ),
              ] 
            ) 
        ),
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

