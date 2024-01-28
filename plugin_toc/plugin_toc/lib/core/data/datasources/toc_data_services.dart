import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plugin_toc/core/data/model/biometric_result.dart';
import 'package:plugin_toc/core/data/model/face_and_document_request.dart';
import 'package:plugin_toc/core/data/model/session_request.dart';
import 'package:plugin_toc/core/data/model/toc_session.dart';

class TocDataServices {
  final Dio dio;

  TocDataServices({required this.dio});

  Future<TocSession?> getSession(SessionRequest sessionRequest) async {
    const path = "https://sandbox-api.7oc.cl/session-manager/v1/session-id";
    dio.options.contentType = Headers.jsonContentType;

    try {
      final response = await dio.post(path, data: sessionRequest.toJson());

      return TocSession.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  Future<BiometricResult?> getFaceAndDocument(FaceAndDocumentRequest fdRequest) async {
    const path = "https://sandbox-api.7oc.cl/v2/face-and-document";
    dio.options.contentType = Headers.jsonContentType;

    try {
      final response = await dio.post(path, data: fdRequest.toJson());

      return BiometricResult.fromJson(response.data);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
