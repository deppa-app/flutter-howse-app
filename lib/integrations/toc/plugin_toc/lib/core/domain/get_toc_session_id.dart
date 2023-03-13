import 'package:dio/dio.dart';
import 'package:plugin_toc/core/data/datasources/toc_data_services.dart';
import 'package:plugin_toc/core/data/model/session_request.dart';

class GetTocSessionId {
  Future<String> call(String apiKey) async {
    final dio = Dio();

    var dataSource = TocDataServices(dio: dio);
    var result = await dataSource.getSession(SessionRequest(apiKey: apiKey));

    if (result != null) {
      return result.sessionId;
    }
    return "";
  }
}
