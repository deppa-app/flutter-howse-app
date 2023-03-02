part of 'autocapture_bloc.dart';

abstract class AutocaptureEvent extends Equatable {
  const AutocaptureEvent();

  @override
  List<Object> get props => [];
}

class FecthTocSessionTrigger extends AutocaptureEvent {
  final String apiKey;

  const FecthTocSessionTrigger({this.apiKey});

  @override
  List<Object> get props => [];
}

class FaceAndDocumentTrigger extends AutocaptureEvent {
  final FaceAndDocumentRequest faceAndDocumentRequest;

  const FaceAndDocumentTrigger({this.faceAndDocumentRequest});

  @override
  List<Object> get props => [];
}