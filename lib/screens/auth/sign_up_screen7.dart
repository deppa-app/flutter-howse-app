import 'package:flutter/material.dart';
import 'package:howse_app/screens/auth/sign_up_screen8.dart';



import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';
import 'package:howse_app/widgets/widget.dart';

import '../../utils/custom_color.dart';



class SignUpScreen7 extends StatefulWidget {
  const SignUpScreen7({Key key}) : super(key: key);

  @override
  _SignUpScreen7State createState() => _SignUpScreen7State();
}

class _SignUpScreen7State extends State<SignUpScreen7> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                                  icon: Image.asset('assets/images/icon/facebook.png'),
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
                                    icon: Image.asset('assets/images/icon/facebook.png'),
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
                      CustomTextFormField(
                        text: Strings.demoFirstName,
                        controller: firstNameController,
                      ),
                      
                        _titleData(Strings.firstName),
                      CustomTextFormField(
                        text: Strings.demoFirstName,
                        controller: firstNameController,
                      ),
                      
                      _titleData(Strings.phoneNumber),
                      CustomTextFormField(
                        text: Strings.demoPhoneNumber,
                        controller: phoneController,
                      ),
                      
                      _titleData(Strings.dateBirth),
                      CustomTextFormField(
                        text: Strings.formDate,
                        controller: emailController, // cambiar controller
                        suffixIcon: const Icon(
                            Icons.calendar_month,
                            color: CustomColor.primaryColor,
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
                      _titleData(Strings.issueDate),
                      CustomTextFormField(
                        text: Strings.formDate, 
                        controller: usernameController, 
                        suffixIcon: const Icon(
                            Icons.calendar_month,
                            color: CustomColor.primaryColor,
                          ),
                      ),
                      
                      _titleData(Strings.expirationDateSignUp),
                      CustomTextFormField(
                        text: Strings.formDate, 
                        controller: usernameController, 
                        suffixIcon: const Icon(
                            Icons.calendar_month,
                            color: CustomColor.primaryColor,
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

