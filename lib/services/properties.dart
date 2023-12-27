import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/property.dart';

Future<PropertyList?> getProperties(String token) async {
  try {

    final response = await http.get(
      Uri.parse('https://orca-app-fq37g.ondigitalocean.app/api/properties'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    /*var headers = {
  'Authorization': 'Bearer $token'
};
var request = http.Request('GET', Uri.parse('https://orca-app-fq37g.ondigitalocean.app/api/properties'));

request.headers.addAll(headers);

http.StreamedResponse response = await request.send();*/
    if (response.statusCode == 200) {
      /*final responseData = await jsonDecode(await response.stream.bytesToString());
      
      if (responseData.containsKey('error')) {
        return null;
      }*/
      //print("Datos decodificados: "+PropertyAttributes.fromJson(jsonDecode(responseData)));
   /*   Map<String, dynamic> jsonData = jsonDecode(response.body);

  PropertyList propertyList = PropertyList.fromJson(jsonData);

  // Ejemplo de cómo acceder a los datos
  for (var property in propertyList.data) {
    print('Property ID: ${property.id}');
    print('Cod: ${property.attributes.cod}');
    print('Direction: ${property.attributes.direction}');
    print('---');
  }*/
      return PropertyList.fromJson(jsonDecode(response.body));
    } else {
      print('Error de solicitud: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error: $e');
  }
}