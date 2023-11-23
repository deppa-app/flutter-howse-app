import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user.dart';



Future<DataUser?> authenticate(String email, String password) async {


  final response = await http.post(
    Uri.parse('https://orca-app-fq37g.ondigitalocean.app/api/auth/local'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'identifier': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    print('[login_auth] Authentication successful: ${response.body}');
    
    final responseData = await jsonDecode(response.body);
        if (responseData.containsKey('error')) {
        return null;
    }

    return DataUser.fromJson(jsonDecode(response.body));

  } else {
    print('Error de autenticación: ${response.body}');
      return null;
  }
}
