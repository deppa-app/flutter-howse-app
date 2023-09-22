import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

Future<DataUser?> authenticate(String email, String password) async {

  final response = await http.post(
    Uri.parse('https://5b5b-190-22-118-130.ngrok-free.app/api/auth/local'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'identifier': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    print('Authentication successful: ${response.body}');
    
    final responseData = jsonDecode(response.body);
        if (responseData.containsKey('error')) {
        return null;
    }
    return DataUser.fromJson(jsonDecode(response.body));

  } else {
    /* String response = await rootBundle.loadString('mocks/categories.json'); */
    print('Error de autenticación: ${response.body}');
      return null;
   /*  throw Exception(
        'Error de autenticación en servicio: ${response.statusCode}'); */
  }
}