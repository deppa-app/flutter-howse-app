import 'package:flutter/material.dart';
import 'package:deppa_app/screens/auth/index.dart';

//import 'package:percent_indicator/percent_indicator.dart';
import 'package:deppa_app/utils/utils.dart';
import 'package:deppa_app/widgets/widget.dart';

//import '../../widgets/linear_percent_widget.dart';

class SignUpBasics extends StatefulWidget {
  const SignUpBasics({Key ?key}) : super(key: key);

  @override
  _SignUpBasicsState createState() => _SignUpBasicsState();
}

class _SignUpBasicsState extends State<SignUpBasics> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //bool _toggleVisibility = true;
  bool checkedValue1 = false;
  bool checkedValue2 = false;
  bool checkedValue3 = false;



  callBack(bool value, bool value2, bool value3) {
    checkedValue1 = value;
    checkedValue2 = value2;
    checkedValue3 = value3;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: width,
          height: height,
          color: Colors.white,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [

              const BackWidget(title: "",percent: 0.15,),
              
              SizedBox(height: height * 0.05),

              basicInfoPadding(width),

              textInfoPadding(height, width),

              ////Input - subtítulo de requerimiento de contraseña - checkbox
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: width * 0.12, right: width * 0.12),
                    child: inputFieldWidget(context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.02, right: width * 0.15),
                    child: Text(
                      Strings.passwordContain,
                      style: TextStyle(
                          fontSize: Dimensions.largeTextSize,
                          color: CustomColor.colorBlack,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.09,
                    ),
                    child: termsCheckBoxWidget(context),
                  ),
                ],
              ),

              SizedBox(height: height * 0.05),

              nextButtonPadding(width, context),
            ],
          ),
        ),
      ),
    );
  }

//Titulo de la pantalla
  Padding basicInfoPadding(double width) {
    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.15,
        right: width * 0.15,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          Strings.basicInfoAccount,
          style: TextStyle(
            color: CustomColor.colorBlack,
            fontSize: Dimensions.semilarge,
            height: 1.3,
            fontWeight: FontWeight.w600
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

//Texto/subtitulo de página
  Padding textInfoPadding(double height, double width) {
    return Padding(
      padding: EdgeInsets.only(
        top: height * 0.03,
        left: width * 0.12,
        right: width * 0.12,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          Strings.infoAccount,
          style: TextStyle(
            color: CustomColor.colorBlack,
            fontSize: Dimensions.largeTextSize,
            height: 2.0,
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

//Inputs de datos: dirección, correo y contraseña
  inputFieldWidget(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height* 0.04),
            Align(
                alignment: Alignment.topCenter,
                child: CustomTextFormField(
                  text: Strings.addressInput,
                  controller: addressController,
                )
              ),
            SizedBox(height: height* 0.04),
            Align(
                alignment: Alignment.topCenter,
                child: TextFormFieldEmail(
                  text: Strings.emailInput,
                  controller: emailController,
                )
              ),
            SizedBox(height: height* 0.04),
            Align(
              alignment: Alignment.topCenter,
              child: TextFormFieldPassword(
                  text: Strings.passInput,
                  controller: passwordController,
                  controller2: passwordController,
                  callBack: callBack),
            ),
            SizedBox(height: height* 0.04),
            Align(
                alignment: Alignment.topCenter,
                child: TextFormFieldPassword(
                    text: Strings.confirmPassInput,
                    controller: confirmPasswordController,
                    controller2: passwordController
                  )
              ),

            SizedBox(height: height* 0.03),
          ],
        ));
  }

//checkbox de validación de contraseña
  termsCheckBoxWidget(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.1,
              ),
              child: SizedBox(
                height: height * 0.03,
                child: CheckboxListTile(
                  activeColor: CustomColor.greyColorCheck,
                  checkColor: CustomColor.primaryColor,
                  title: Text(
                    Strings.oneUpper,
                    style: TextStyle(
                      color: CustomColor.colorBlack,
                      fontSize: Dimensions.smallTextSize,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  value: checkedValue1,
                  onChanged: (bool? value) {
                    setState(() {
                      checkedValue1 = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading, 
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.1,
              ),
              child: SizedBox(
                height: height * 0.03,
                child: CheckboxListTile(
                  activeColor: CustomColor.greyColorCheck,
                  checkColor: CustomColor.primaryColor,
                  title: Text(
                    Strings.oneNumber,
                    style: TextStyle(
                      color: CustomColor.colorBlack,
                      fontSize: Dimensions.smallTextSize,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  value: checkedValue2,
                  onChanged: (bool? value) {
                    setState(() {
                      checkedValue2 = value!;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.1,
              ),
              child: SizedBox(
                height: height * 0.03,
                child: CheckboxListTile(
                  activeColor: CustomColor.greyColorCheck,
                  checkColor: CustomColor.primaryColor,
                  title: Text(
                    Strings.oneSpecialCaracter,
                    style: TextStyle(
                      color: CustomColor.colorBlack,
                      fontSize: Dimensions.smallTextSize,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  value: checkedValue3,
                  onChanged: (bool? value) {
                    setState(() {
                      checkedValue3 = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading, 
                ),
              ),
            ),
          ],
        );
      },
    );
  }

//Función para controlar el color de los checkbox
  Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return CustomColor.primaryColor;
      }
      return CustomColor.greyColorCheck;
    }

//Botón de siguiente
  Padding nextButtonPadding(double width, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.08,
        right: width * 0.08,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: SecondaryButtonWidget(
        title: Strings.nextSignUp,
        onTap: () {
          print(formKey.currentState!.validate());
          if (formKey.currentState!.validate()) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SignUpPhone(
                  address: addressController.text,
                  email: emailController.text,
                  password: confirmPasswordController.text
                  )
                )
              );
          }
        },
       ),
      ),
    );
  }

}
