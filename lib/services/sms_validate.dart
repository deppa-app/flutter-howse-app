import 'dart:convert';

import 'package:http/http.dart' as http;
Future<int> sendCode(String numberPhone, String codeArea) async {
  try {
    var headers = {'Content-Type': 'application/json'};
    
    var request = http.Request('POST', Uri.parse('https://sea-lion-app-zi3gr.ondigitalocean.app/sms/code/send'));
    request.body = json.encode({"numero": '+$codeArea$numberPhone'});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    print("Número enviado: +$codeArea$numberPhone");

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      print('Respuesta del servidor:');
      print(responseBody);
      return response.statusCode;
    } else {
      print('Error en la solicitud. Código de estado: ${response.statusCode}');
      return response.statusCode;
    }
  } catch (e) {
    print('Error al enviar el código: $e');
     return -1;
  }
}

Future<int> validateCode(String numberPhone, int code) async {
  try {
    var headers = {'Content-Type': 'application/json'};
    
    var request = http.Request('POST', Uri.parse('https://sea-lion-app-zi3gr.ondigitalocean.app/sms/code/verify'));
    request.body = json.encode({"numero": numberPhone, "code": code});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    print("Número enviado: $numberPhone Código: $code");

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      print('Respuesta del servidor:');
      print(responseBody);
      return response.statusCode;
    } else {
      print('Error en la solicitud. Código de estado: ${response.statusCode}');
      return response.statusCode;
    }
  } catch (e) {
    print('Error al validar el código: $e');
    return -1; 
  }
}