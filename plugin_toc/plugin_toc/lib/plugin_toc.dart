import 'dart:async';

import 'package:flutter/services.dart';
import 'package:plugin_toc/core/data/model/biometric_result.dart';
import 'package:plugin_toc/core/data/model/face_and_document_request.dart';

import 'package:plugin_toc/core/domain/get_biometric_result.dart';
import 'package:plugin_toc/core/domain/get_toc_session_id.dart';

class PluginToc {
  static const MethodChannel _channel = MethodChannel('plugin_toc');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> getSessionId(String apiKey) async {
    final String token = await GetTocSessionId().call(apiKey);
    return token;
  }

  static Future<BiometricResult?> getBiometricResult(FaceAndDocumentRequest faceAndDocumentRequest) async {
    var token = await GetBiometricResult().call(faceAndDocumentRequest);
    return token;
  }

  static Future<String> capturaFront(String documentType, String sessionId) async {
    print("Abre plugin en la función capturaFront");
    final String token = await _channel.invokeMethod('capturaFront', [documentType, sessionId]);
    return token;
  }

  static Future<String> capturaBack(String documentType, String sessionId) async {
    final String token = await _channel.invokeMethod('capturaBack', [documentType, sessionId]);
    return token;
  }

  static Future<String> capturaLiveness(String sessionId) async {
    final String token = await _channel.invokeMethod('capturaLiveness', [sessionId]);
    return token;
  }
}
