import 'package:deppa_app/widgets/buttons/general_buttons/secondary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:plugin_toc/core/data/model/biometric_result.dart';
import 'package:plugin_toc/core/data/model/face_and_document_request.dart';
import 'package:deppa_app/config.dart';
import 'package:deppa_app/core/presentation/widgets/alert_helper.dart';
import 'package:deppa_app/core/presentation/widgets/loading_dialog.dart';
import 'package:deppa_app/features/autocapture/domain/usecases/capture_back.dart';
import 'package:deppa_app/features/autocapture/domain/usecases/capture_front.dart';

import 'package:deppa_app/features/autocapture/presentation/bloc/autocapture_bloc.dart';
import 'package:deppa_app/features/liveness/domain/usecases/capture_liveness.dart';

import '../../../../screens/auth/sign_up_all_data.dart';
import '../../../../utils/custom_color.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/strings.dart';
import '../../../../widgets/buttons/back_buttons/back_widget.dart';

class AutocaptureDemoPage extends StatefulWidget {
  final String ?address;
  final String ?email;
  final String ?password;
  final String ?phone;
  final int ?phoneValidation;
  const AutocaptureDemoPage({Key? key, this.address, this.email, this.password, this.phone, this.phoneValidation}) : super(key: key);

  @override
  State<AutocaptureDemoPage> createState() => _AutocaptureDemoPageState();
}

class _AutocaptureDemoPageState extends State<AutocaptureDemoPage> {
  final FaceAndDocumentRequest _faceAndDocumentRequest = FaceAndDocumentRequest(
    apiKey: apiKey,
  );
  @override
  void initState() {
     super.initState();
  }

  final List<String> _documentTypes = ['CHL1', 'CHL2',]; // Option 2
  String _selectedDocument = "CHL2";

  _requestCameraPermision() async {
    if (await Permission.camera.request().isGranted == false) {
      return;
    }
  }

  _showCaptureFront(String sessionId) async {
    await _requestCameraPermision();
    _faceAndDocumentRequest.documentType = _selectedDocument;
    _faceAndDocumentRequest.idFront = await CaptureFront().call(_selectedDocument, sessionId);
    _showCaptureBack(sessionId);
  }

  _showCaptureBack(String sessionId) async {
    _faceAndDocumentRequest.idBack = await CaptureBack().call(_selectedDocument, sessionId);
    _showLiveness(sessionId);
  }

  _showLiveness(String sessionId) async {
    _faceAndDocumentRequest.selfie = await CaptureLiveness().call(sessionId);
    _startFaceAndDocument();
  }

  _startFaceAndDocument() async {
    BlocProvider.of<AutocaptureBloc>(context).add(FaceAndDocumentTrigger(faceAndDocumentRequest: _faceAndDocumentRequest));
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
    final documentSelector = DropdownButton(
      hint: const Text('Seleccione el tipo de documento'),
      value: _selectedDocument,
      onChanged: (newValue) {
        setState(() {
          _selectedDocument = newValue.toString();
        });
      },
      items: _documentTypes.map((location) {
        return DropdownMenuItem(
          child: Text(location),
          value: location,
        );
      }).toList(),
    );

    //Botón de continuar
    final continueButtons= Padding(
      padding: EdgeInsets.only(
        left: width * 0.08,
        right: width * 0.08,
      ),
      child: SecondaryButtonWidget(
      title: Strings.validateSignUp,
      onTap: () {
        BlocProvider.of<AutocaptureBloc>(context).add(const FecthTocSessionTrigger(apiKey: apiKey));
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AutocaptureDemoPage(
                    documentType: _selectedDocument,address: widget.address!,
                    email: widget.email!,
                    password: widget.password!,
                    phone: widget.phone!,
                    phoneValidation: 1
                  )),
                );*/
              },
      ),
    );

    final double screenWidth = MediaQuery.of(context).size.width;
    final body = Container(
      width: screenWidth,
      color: Colors.white,
      margin: const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const BackWidget(title: '', percent: 0.6),
          Container(
              width: 200,
              height: 200,
              color: Colors.transparent,
              child: const Image(
                image: AssetImage("assets/images/logo_orizon.png"),
              )),

              Padding(
                  padding: const EdgeInsets.only(
                      left: Dimensions.marginSize*2,
                      right: Dimensions.marginSize*2),
                      
                  child: Text(
                    'Para comenzar el proceso de validación biométrica de tu documentación, por favor seleccione el tipo de cédula de identidad que posees actualmente.',
                    style: const TextStyle(
                      color: CustomColor.colorBlack,
                      fontSize: 15,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                    textHeightBehavior: const TextHeightBehavior(leadingDistribution: TextLeadingDistribution.even),
                  ),
                ),
                 const SizedBox(
                  height: Dimensions.heightSize * 2,
                ),
          const Text(
            "Seleccione el tipo de documento: ",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(height: height * 0.05),
          documentSelector,
          SizedBox(height: height * 0.1),
          continueButtons,
        ],
      ),
    );

    return BlocListener<AutocaptureBloc, AutocaptureState>(
      listener: (context, state) {
        if (state is FetchingSessionId) {
          LoadingDialog.show(context);
        }

        if (state is FetchedSessionId) {
          LoadingDialog.hide(context);
          _showCaptureFront(state.sessionId);
        }

        if (state is ErrorGettingSessionId) {
          LoadingDialog.hide(context);
          AlertHelper.showErrorDialog(context, "Error al obtener el id de sesión por favor valide su Api Key.");
        }

        if (state is ErrorGettingFaceAndDocument) {
          LoadingDialog.hide(context);
          AlertHelper.showErrorDialog(context, "Error al validar la información ${state.errorCode}.");
        }

        if (state is SuccessfullyFaceAndDocument) {
          LoadingDialog.hide(context);

          BiometricResult biometricResult = (state as SuccessfullyFaceAndDocument).biometricResult;
          
          print("Respuesta de plugin TOC");
          print(biometricResult.toJson());
         
          //AlertHelper.showInfoDialogCallBack(context, "Felicitaciones el resultado  ha sido exitoso", () => {Navigator.pop(context)});
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpAllData(
                  address: widget.address!,
                  email: widget.email!,
                  password: widget.password!,
                  phone: widget.phone!,
                  phoneValidation: 1,
                  identificationNumberValidation:1
          )));
        }
      },
      child: SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: body
        ),
      ),
    )
    );
  }
}
