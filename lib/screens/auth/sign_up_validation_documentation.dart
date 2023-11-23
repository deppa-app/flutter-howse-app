

import 'package:flutter/material.dart';

import 'package:deppa_app/utils/utils.dart';
import 'package:deppa_app/widgets/widget.dart';

import '../../features/autocapture/presentation/pages/autocapture_demo_page.dart';

class SignUpValidationDocumentation extends StatefulWidget {
  const SignUpValidationDocumentation(
      {Key ?key, this.address, this.email, this.password, this.phone, this.phoneValidation})
      : super(key: key);
  final String ?address;
  final String ?email;
  final String ?password;
  final String ?phone;
  final int ?phoneValidation;

  @override
  _SignUpValidationDocumentationState createState() => _SignUpValidationDocumentationState();
}

class _SignUpValidationDocumentationState extends State<SignUpValidationDocumentation> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Datos Recibidos de Pantalla: SignUpValidationNumbre');
    print('Email:  ${widget.email}');
    print('Contraseña: ${widget.password}');
    print('Dirección: ${widget.address}');
    print('Número de teléfono: ${widget.phone}');
    print('Validación de número: ${widget.phoneValidation}');
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
              const BackWidget(title: '', percent: 0.5),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              inputFieldWidget(context),
              SizedBox(height: height * 0.1),
              
              validateButtonPadding(width, context),
            ],
          ),
        ),
      ),
    );
  }

//Botón de continuar
  Padding validateButtonPadding(double width, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.08,
        right: width * 0.08,
      ),
      child: SecondaryButtonWidget(
      title: Strings.validateSignUp,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AutocaptureDemoPage(
                  address: widget.address!,
                  email: widget.email!,
                  password: widget.password!,
                  phone: widget.phone!,
                  phoneValidation: 1
            )));
      },
    ),
    );
  }

//Textos de la página
  inputFieldWidget(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.only(
          left: width * 0.02,
          right: width * 0.02,
        ),
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.2, right: width * 0.2),
                  child: Text(
                    Strings.documentsVerification,
                    style: const TextStyle(
                        color: CustomColor.colorBlack,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 2,
                ),
                //TODO: cambiar tamaño de acuerdo al figma
                Padding(
                  padding: const EdgeInsets.only(
                      left: Dimensions.marginSize,
                      right: Dimensions.marginSize),
                  child: Text(
                    Strings.thisProcess,
                    style: const TextStyle(
                      color: CustomColor.colorBlack,
                      fontSize: 15,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                    textHeightBehavior: const TextHeightBehavior(leadingDistribution: TextLeadingDistribution.even),
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 2,
                ),
                //Subtitulo antes del enumerado
                Padding(
                  padding: const
                      EdgeInsets.only(
                        left: Dimensions.marginSize,
                        right: Dimensions.marginSize
                      ),
                  child: const Text(
                    'Instrucciones para la verificación de documentos: ',
                    //Strings.documentsVerification,
                    style: const TextStyle(
                        color: CustomColor.colorBlack,
                        fontSize: 15,
                        height: 1.2,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 2,
                ),
                //Texto antes del enumerado
                Padding(
                  padding: const
                      EdgeInsets.only(
                        left: Dimensions.marginSize,
                        right: Dimensions.marginSize
                      ),
                  child: const Text(
                    'Utilizaremos reconocimiento facial y reconocimiento de tu cédula de identidad para agilizar el proceso.',
                    //Strings.documentsVerification,
                    style: const TextStyle(
                        color: CustomColor.colorBlack,
                        fontSize: 15, 
                        height: 1.2,
                        ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 2,
                ),
                //Texto enumerado
                Padding(
                  padding: const
                      EdgeInsets.only(
                        left: Dimensions.marginSize,
                        right: Dimensions.marginSize
                      ),
                  child: const Text(
                    '1. Debes tener a mano tu cédula de identidad para completar la verificación. \n2. Asegúrate de que ambas imágenes sean claras y legibles. \n3. Nuestro sistema verificará tu identidad automáticamente. \n4. Si la verificación es exitosa, podrás continuar con tu reserva o programación de visita. \n5. En caso de que la verificación no sea exitosa, recibirás instrucciones adicionales.',
                    //Strings.documentsVerification,
                    style: const TextStyle(
                        color: CustomColor.colorBlack,
                        fontSize: 15,
                        height: 1.2,
                        ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 2,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.2, right: width * 0.2),
                  child: Image.asset('assets/images/lorem-image.png'),
                )
              ],
            )));
  }
}
