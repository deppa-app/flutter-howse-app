part of 'autocapture_bloc.dart';

abstract class AutocaptureState extends Equatable {
  const AutocaptureState();

  @override
  List<Object> get props => [];
}

class AutocaptureInitial extends AutocaptureState {}

class FetchingSessionId extends AutocaptureState {}

class FetchedSessionId extends AutocaptureState {
  final String sessionId;
  const FetchedSessionId({this.sessionId});
}

class ErrorGettingFaceAndDocument extends AutocaptureState {
  final String errorCode;
  const ErrorGettingFaceAndDocument({this.errorCode});
}

class SuccessfullyFaceAndDocument extends AutocaptureState {
  final BiometricResult biometricResult;
  const SuccessfullyFaceAndDocument({this.biometricResult});
}

class ErrorGettingSessionId extends AutocaptureState {}