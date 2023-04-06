import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:plugin_toc/core/data/model/face_and_document_request.dart';
import 'package:deppa_app/config.dart';
import 'package:deppa_app/core/presentation/widgets/alert_helper.dart';
import 'package:deppa_app/core/presentation/widgets/loading_dialog.dart';
import 'package:deppa_app/features/autocapture/domain/usecases/capture_back.dart';
import 'package:deppa_app/features/autocapture/domain/usecases/capture_front.dart';

import 'package:deppa_app/features/autocapture/presentation/bloc/autocapture_bloc.dart';
import 'package:deppa_app/features/liveness/domain/usecases/capture_liveness.dart';

import '../../../../screens/auth/sign_up_all_data.dart';

class AutocaptureDemoPage extends StatefulWidget {
  final String documentType;
  const AutocaptureDemoPage({Key? key, required this.documentType}) : super(key: key);

  @override
  State<AutocaptureDemoPage> createState() => _AutocaptureDemoPageState();
}

class _AutocaptureDemoPageState extends State<AutocaptureDemoPage> {
  final FaceAndDocumentRequest _faceAndDocumentRequest = FaceAndDocumentRequest(
    apiKey: apiKey,
  );
  @override
  void initState() {
    BlocProvider.of<AutocaptureBloc>(context).add(const FecthTocSessionTrigger(apiKey: apiKey));
    super.initState();
  }

  _requestCameraPermision() async {
    if (await Permission.camera.request().isGranted == false) {
      return;
    }
  }

  _showCaptureFront(String sessionId) async {
    await _requestCameraPermision();
    _faceAndDocumentRequest.documentType = widget.documentType;
    _faceAndDocumentRequest.idFront = await CaptureFront().call(widget.documentType, sessionId);
    _showCaptureBack(sessionId);
  }

  _showCaptureBack(String sessionId) async {
    _faceAndDocumentRequest.idBack = await CaptureBack().call(widget.documentType, sessionId);
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
    final buttons = Container(
      margin: const EdgeInsets.only(top: 40, bottom: 0, left: 20, right: 20),
      child: Column(
        children: [
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              child: const Text('Liveness'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // background
                onPrimary: Colors.white,
                // foreground
              ),
            ),
          ),
        ],
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
          Container(
              width: 200,
              height: 200,
              color: Colors.transparent,
              child: const Image(
                image: AssetImage("assets/images/logo_orizon.png"),
              )),
          const SizedBox(
            height: 20,
          ),
          buttons
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
          AlertHelper.showInfoDialogCallBack(context, "Felicitaciones el resultado  ha sido exitoso", () => {Navigator.pop(context)});
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpAllData()));
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('TOC Autocapture Demo')),
        body: Container(color: Colors.black, child: body),
      ),
    );
  }
}
