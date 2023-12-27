import 'dart:convert';
import 'package:deppa_app/models/user.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';

Future<DataUser> saveUser(String user) async {
  //TODO: cambiar ruta en duro a variable de entorno
  const urlAPI = 'https://orca-app-fq37g.ondigitalocean.app/api/users';
  final response = await http.post(Uri.parse(urlAPI),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: user);
  if (response.statusCode == 201) {
    return DataUser.fromJson(jsonDecode(response.body));
  } else {
    //TODO: agregar este archivo
    String response = await rootBundle.loadString('mocks/categories.json');
    return DataUser.fromJson(jsonDecode(response));
  }
}
