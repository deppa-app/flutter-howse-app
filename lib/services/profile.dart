import 'dart:convert';
import 'package:deppa_app/models/profile.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

/*Future<DataProfile> getOneProfile(int idProfile) async {
  final urlAPI =
      'https://enteleqqia.hegga.cl/api/profiles/$idProfile?populate=*';
  final response = await http.get(Uri.parse(urlAPI));
  if (response.statusCode == 200) {
    return DataProfile.fromJson(jsonDecode(response.body));
  } else {
    String response = await rootBundle.loadString('mocks/categories.json');
    return DataProfile.fromJson(jsonDecode(response));
  }
}*/

Future<ValidateProfile> saveProfile(String profile) async {
  print("Datos de perfil a registrar");
  print(profile);
  //TODO: Actualizar ruta a variable de entorno
  const urlAPI = 'https://orca-app-fq37g.ondigitalocean.app/api/profiles';
  final response = await http.post(Uri.parse(urlAPI),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: profile);
  if (response.statusCode == 200) {
    return ValidateProfile.fromJson(jsonDecode(response.body));
  } else {
    String response = await rootBundle.loadString('mocks/categories.json');
    return ValidateProfile.fromJson(jsonDecode(response));
  }
}

/*Future<ValidateProfile> updateProfile(String user, int idProfile) async {
  final urlAPI = 'https://enteleqqia.hegga.cl/api/profiles/$idProfile';
  final response = await http.put(Uri.parse(urlAPI),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: user);
  if (response.statusCode == 200) {
    return ValidateProfile.fromJson(jsonDecode(response.body));
  } else {
    String response = await rootBundle.loadString('mocks/categories.json');
    return ValidateProfile.fromJson(jsonDecode(response));
  }
}*/

// Future<ClassProfile> changePassword(int id, String password) async {
//   //  final String passwordHashed = BCrypt.hashpw(
//   //   password,
//   //   BCrypt.gensalt(logRounds: 10),
//   // );

//   final response = await http.get(Uri.parse(
//       'https://enteleqqia.hegga.cl/api/profiles?filters[id]=$id&filters[password]=$password'));
//   if (response.statusCode == 200) {
//     return ClassProfile.fromJson(jsonDecode(response.body));
//   } else {
//     String response = await rootBundle.loadString('mocks/categories.json');
//     return ClassProfile.fromJson(jsonDecode(response));
//   }
// }
