import 'package:flutter/material.dart';

import 'package:deppa_app/screens/auth/index.dart';
import 'package:deppa_app/utils/utils.dart';
import 'package:deppa_app/widgets/widget.dart';
import 'package:flutter/services.dart';

//import '../../services/sms_validate.dart';

class SignUpValidationNumbre extends StatefulWidget {
  const SignUpValidationNumbre(
      {Key ?key, this.address, this.email, this.password, this.phone})
      : super(key: key);
  final String ?address;
  final String ?email;
  final String ?password;
  final String ?phone;
  @override
  _SignUpValidationNumbreState createState() => _SignUpValidationNumbreState();
}

class _SignUpValidationNumbreState extends State<SignUpValidationNumbre> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('Datos Recibidos de Pantalla: SignUpValidationNumbre');
    print('Email:  ${widget.email}');
    print('Contraseña: ${widget.password}');
    print('Dirección: ${widget.address}');
    print('Número de teléfono: ${widget.phone}');

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
             const BackWidget(
              title: '',
              percent: 0.3,
            ),
            const SizedBox(
              height: Dimensions.heightSize * 2,
            ),
            inputFieldWidget(context),
            validateButtonPadding(height, width, context),
            const SizedBox(
              height: Dimensions.heightSize * 2,
            ),
            footerRow(),
          ],
        ),
      ),
    );
  }

  Row footerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textReciveCode(),
        const SizedBox(
          width: 10,
        ),
        _newCode()
      ],
    );
  }

  Padding validateButtonPadding(
      double height, double width, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: height * 0.06,
        left: width * 0.08,
        right: width * 0.08,
      ),
      child: validateButton(context),
    );
  }

  SecondaryButtonWidget validateButton(BuildContext context) {
    return SecondaryButtonWidget(
      title: Strings.validateSignUp,
      onTap: () async{
        print('Code:');
        print(int.parse(controller1.text+ controller2.text +controller3.text + controller4.text));
        //TODO: agregar qué pasa cuando no se valida correctamente
        /*if(await validateCode(widget.phone!, int.parse(controller1.text+ controller2.text +controller3.text + controller4.text)) == 200){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SignUpValidationDocumentation(
                  address: widget.address!,
                  email: widget.email!,
                  password: widget.password!,
                  phone: widget.phone!,
                  phoneValidation: 1
                )
            )
          );
        }*/
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SignUpValidationDocumentation(
                  address: widget.address!,
                  email: widget.email!,
                  password: widget.password!,
                  phone: widget.phone!,
                  phoneValidation: 1
                )
            )
          );
      }
    );
  }

  Text textReciveCode() {
    return Text(
      Strings.recibeCode,
      style: const TextStyle(
          color: CustomColor.colorBlack, fontSize: 14),
      textAlign: TextAlign.center,
    );
  }

  GestureDetector _newCode() {
    return GestureDetector(
        child: GestureDetector(
      child: Text(
        Strings.newCode,
        style: const TextStyle(
            color: CustomColor.brownColor2,
            //fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline),
      ),
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SignUpPhone(
                        address: widget.address!,
                        email: widget.email!,
                        password: widget.password!,
                      )
                  )
                );
      },
    ));
  }

  inputFieldWidget(BuildContext context) {

    FocusNode focusNode1 = FocusNode();
    FocusNode focusNode2 = FocusNode();
    FocusNode focusNode3 = FocusNode();
    FocusNode focusNode4 = FocusNode();

    focusNode1.addListener(() {
    print("Primer Recuadro");
    if (focusNode1.hasFocus && controller1.text.isNotEmpty) {
      focusNode2.requestFocus();
    }
  });

    focusNode2.addListener(() {
    print("Segundo Recuadro");
    if (focusNode2.hasFocus && controller2.text.isNotEmpty) {
      focusNode3.requestFocus();
    }
  });

  focusNode3.addListener(() {
    print("Tercer Recuadro");
    if (focusNode3.hasFocus && controller3.text.isNotEmpty ) {
      focusNode4.requestFocus();
    }
  });


    
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
        padding: EdgeInsets.only(
          left: width * 0.05,
          right: width * 0.05,
        ),
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                  child: Text(
                    Strings.confirmNumber,
                    style: const TextStyle(
                        color: CustomColor.colorBlack,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.05, right: width * 0.01),
                  child: Text(
                    Strings.fourDigitCode,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 16,
                      color: CustomColor.colorBlack,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTextFormField(
                      
                      controller: controller1,
                      a: '1'
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    SquareTextFormField(
                      
                      controller: controller2,
                      a: '2'
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    SquareTextFormField(
                      
                      controller: controller3,
                      a: '3'
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    SquareTextFormField(
                    
                      controller: controller4,
                      a: '4'
                    ),
                    
                  ],
                ),
                SizedBox(height: height * 0.4)
              ],
            )));
  }
}

class SquareTextFormField extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController controller;
  final String a;

  const SquareTextFormField({
    Key ?key,
     this.focusNode, 
    required this.controller,
    required this.a

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: 50,
        child: TextFormField(
          focusNode: focusNode,
          decoration: CustomStyle.decorationTextFormField(a),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            LengthLimitingTextInputFormatter(1),
          ],
          controller: controller,
          showCursor: false,
          style: const TextStyle(color: CustomColor.greenColor, fontSize: 30),
          textAlign: TextAlign.center,
        )
      );
  }
}


