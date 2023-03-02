import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plugin_toc/core/data/model/biometric_result.dart';
import 'package:plugin_toc/core/data/model/face_and_document_request.dart';
import 'package:plugin_toc/plugin_toc.dart';

part 'autocapture_event.dart';
part 'autocapture_state.dart';

class AutocaptureBloc extends Bloc<AutocaptureEvent, AutocaptureState> {
  AutocaptureBloc() : super(AutocaptureInitial()) {
    on<AutocaptureEvent>((event, emit) async {
      emit(FetchingSessionId());

      if (event is FecthTocSessionTrigger) {
        final _sessionId = await PluginToc.getSessionId(event.apiKey);
        emit(FetchedSessionId(sessionId: _sessionId));
      }

      if (event is FaceAndDocumentTrigger) {
        final biometricResult = await PluginToc.getBiometricResult(event.faceAndDocumentRequest);

        if (biometricResult != null && biometricResult.status == "200") {
          emit(SuccessfullyFaceAndDocument(biometricResult: biometricResult));
        }

        if (biometricResult != null && biometricResult.status != "200") {
          emit(ErrorGettingFaceAndDocument(errorCode: biometricResult.status));
        }

        if (biometricResult == null) {
          emit(const ErrorGettingFaceAndDocument(errorCode: "null result"));
        }
      }
    });
  }
}
