import 'dart:convert';
import 'package:howse_app/models/user.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';
// import 'package:bcrypt/bcrypt.dart';

Future<DataUser> validateUser(String username, String password) async {
  try {
    final response = await http.get(Uri.parse(
        'https://enteleqqia.hegga.cl/api/user-apps?filters[username]=$username&filters[password]=$password'));
    print(response.body);
    if (response.statusCode == 200) {
      return DataUser.fromJson(jsonDecode(response.body));
    } else {
      String response = await rootBundle.loadString('mocks/categories.json');
      return DataUser.fromJson(jsonDecode(response));
    }
  } catch (e) {
    return null;
  }
}

Future<DataUser> saveUser(String user) async {
  print(user);
  const urlAPI = 'https://enteleqqia.hegga.cl/api/user-apps';
  final response = await http.post(Uri.parse(urlAPI),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: user);
  print(response.body);
  if (response.statusCode == 200) {
    return DataUser.fromJson(jsonDecode(response.body));
  } else {
    String response = await rootBundle.loadString('mocks/categories.json');
    return DataUser.fromJson(jsonDecode(response));
  }
}