
import 'package:flutter/material.dart';
import 'package:howse_app/screens/auth/auth.dart';

import 'package:howse_app/utils/utils.dart';
import 'package:howse_app/widgets/widget.dart';

class SignUpScreen1 extends StatefulWidget {
  const SignUpScreen1({Key key}) : super(key: key);

  @override
  _SignUpScreen1State createState() => _SignUpScreen1State();
}

class _SignUpScreen1State extends State<SignUpScreen1> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //bool _toggleVisibility = true;
  bool checkedValue1 = false;
  bool checkedValue2 = false;
  bool checkedValue3 = false;
  bool checkedValue4 = false;

  String selectedCounty = 'United States';
  //Country _selected;

  List<String> genderList = ['Male', 'Female', 'Others'];
  String selectedGender;

  callBack(bool value, bool value2, bool value3, bool value4){
    checkedValue1 = value;
    checkedValue2 = value2;
    checkedValue3 = value3;
    checkedValue4 = value4;

  }

  @override
  void initState() {
    super.initState();

    selectedGender = genderList[0].toString();
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  BackWidget(title: ""),
                  //Se debe agregar la barra de carga en este apartado
                ],
              ),
              const SizedBox(
                height: Dimensions.heightSize * 1,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.15,
                  right: width * 0.15,
                ),
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Informacion básica para crear tu cuenta",
                    style: TextStyle(
                        color: CustomColor.primaryColor,
                        fontSize: 25,
                        height: 1.3,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: height * 0.03,
                  left: width * 0.12,
                  right: width * 0.12,
                ),
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Ingresar tu información para crear tu cuenta.",
                    style: TextStyle(
                      color: CustomColor.primaryColor,
                      fontSize: 16,
                      height: 2.0,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Column(
                children: [
                  //TextFormFieldW1(text: "Escribe tu correo", color: CustomColor.primaryColor, dataController: emailController,),
                  Container(
                    padding: EdgeInsets.only(
                      left: width * 0.12,
                      right: width * 0.12
                      ),
                    child: inputFieldWidget(context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: height * 0.02,
                      right: width * 0.15
                    ),
                    child: const Text('La contraseña debe incluir:',
                    style: TextStyle(
                      fontSize: 16,
                      color: CustomColor.primaryColor,
                      fontWeight: FontWeight.bold

                    ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: width *  0.09,
                    ),
                    child: termsCheckBoxWidget(context),
                  ),
                  
                ],
              ),
              
              SizedBox(height: height * 0.05),
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.08,
                  right: width * 0.08,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SecondaryButtonWidget(
                    title: "Siguiente",
                    onTap: () {
                      if(formKey.currentState.validate()){
                          Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUpScreen2()));
                        }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  headingWidget(BuildContext context) {
    return Image.asset('assets/images/sign_in.png');
  }

  inputFieldWidget(BuildContext context) {


    return  Form(
          key: formKey,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TODO: Revisar Exepción Incorrect use of ParentDataWidget

                const SizedBox(height: 30,),
              
                Align(
                  alignment: Alignment.topCenter, 
                  child: CustomTextFormField(text: "Escribe tu direccion", controller: addressController,)
                ),
              
                const SizedBox(height: 30,),
              
                Align(
                  alignment: Alignment.topCenter,
                  child: TextFormFieldEmail(text: "Escribe tu correo", controller: emailController,)
                ),
                
                const SizedBox(height: 30,),
              
                Align(
                  alignment: Alignment.topCenter,
                  child: TextFormFieldPassword(text: "Escribe tu contraseña", controller: passwordController, callBack: callBack),
                  
                    
                ),
                
                const SizedBox(height: 30,),
              
                Align(
                  alignment: Alignment.topCenter,
                  child: TextFormFieldPassword(text: "Confirma tu contraseña", controller: confirmPasswordController, controller2: passwordController)
                ),
                
              
              const SizedBox(height: Dimensions.heightSize),
            ],
          ));
    
  }

  termsCheckBoxWidget(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {  
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 30.00,
              right: 30.00,
            ),
            child: SizedBox(
              height: 30.00,
              child: CheckboxListTile(
                title: const Text(
                  "Una mayuscula",
                  style: TextStyle(
                    color: CustomColor.primaryColor,
                    fontSize: 12.00,
                  ),
                  textAlign: TextAlign.justify,
                ),
                value: checkedValue1,//checkedValue1,
                onChanged: (_) {},
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 0.0,
              left: 30.00,
              right: 30.00,
            ),
            child: SizedBox(
              height: 30.00,
              child: CheckboxListTile(
                title: const Text(
                  "Una minuscula",
                  style: TextStyle(
                    color: CustomColor.primaryColor,
                    fontSize: 12.00,
                  ),
                  textAlign: TextAlign.justify,
                ),
                value: checkedValue2,
                selected: false,
                onChanged: (_) {},
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 0.0,
              left: 30.00,
              right: 30.00,
            ),
            child: SizedBox(
              height: 30.00,
              child: CheckboxListTile(
                title: const Text(
                  "Un caracter especial",
                  style: TextStyle(
                    color: CustomColor.primaryColor,
                    fontSize: 12.00,
                  ),
                  textAlign: TextAlign.justify,
                ),
                value: checkedValue3,
                onChanged: (_) {},
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 0.0,
              left: 30.00,
              right: 30.00,
            ),
            child: SizedBox(
              height: 30.00,
              child: CheckboxListTile(
                title: const Text(
                  "Entre 8 y 15 caracteres",
                  style: TextStyle(
                    color: CustomColor.primaryColor,
                    fontSize: 12.00,
                  ),
                  textAlign: TextAlign.justify,
                ),
                value: checkedValue4,
                onChanged: (_) {},
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
            ),
          )
        ],
      );
     },
    );
  }

  buttonWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.00,
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: CircleButtonWidget(
        icon: const Icon(
          Icons.arrow_forward,
          color: CustomColor.primaryColor,
        ),
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SignUpScreen2()));
        },
      ),
    );
  }

  orSignUpWidget(BuildContext context) {
    return Column(
      children: [
        const Text('Or'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleButtonWidget(
              icon: Image.asset('assets/images/icon/facebook.png'),
              onTap: () {},
            ),
            const SizedBox(
              width: Dimensions.widthSize,
            ),
            CircleButtonWidget(
              icon: Image.asset('assets/images/icon/google.png'),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  ifYouDontHaveAccountWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.ifYouHaveNoAccount,
          style: CustomStyle.textStyle,
        ),
        GestureDetector(
          child: Text(
            Strings.signUp.toUpperCase(),
            style: const TextStyle(
                color: CustomColor.primaryColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SignUpScreen1()));
          },
        )
      ],
    );
  }

  
}
