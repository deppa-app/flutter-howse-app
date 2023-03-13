import 'package:dio/dio.dart';
import 'package:plugin_toc/core/data/datasources/toc_data_services.dart';
import 'package:plugin_toc/core/data/model/biometric_result.dart';
import 'package:plugin_toc/core/data/model/face_and_document_request.dart';

class GetBiometricResult {
  Future<BiometricResult?> call(FaceAndDocumentRequest faceAndDocumentRequest) async {
    final dio = Dio();

    var dataSource = TocDataServices(dio: dio);
    var result = await dataSource.getFaceAndDocument(faceAndDocumentRequest);

    if (result != null) {
      return result;
    }
    return null;
  }
}
