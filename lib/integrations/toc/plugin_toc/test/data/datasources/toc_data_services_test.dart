import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:plugin_toc/core/data/datasources/toc_data_services.dart';
import 'package:plugin_toc/core/data/model/face_and_document_request.dart';
import 'package:plugin_toc/core/data/model/session_request.dart';

void main() {
  group('get seesion id Token', () {
    test('returns  http call completes successfully', () async {
      final dio = Dio();

      var dataSource = TocDataServices(dio: dio);
      var result = await dataSource.getSession(SessionRequest(apiKey: "e56654e5fd464702ba52e943ab46c1e5"));

      expect(result!.sessionId.isNotEmpty, true);
    });

    test('returns  http call face and document completes successfully', () async {
      final dio = Dio();

      var dataSource = TocDataServices(dio: dio);

      var result = await dataSource
          .getFaceAndDocument(FaceAndDocumentRequest(apiKey: "e56654e5fd464702ba52e943ab46c1e5X", idFront: "xfd", idBack: "sd", selfie: "dfd", documentType: "CHL2"));

      expect(result!.status.isNotEmpty, true);
    });
  });
}
