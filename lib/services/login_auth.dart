import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

Future<DataUser?> authenticate(String email, String password) async {

  final response = await http.post(
    Uri.parse('https://1044-190-22-228-119.ngrok-free.app/api/auth/local'),
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

/* class User {
  final String token;
  final int id;
  final String username;
  final String email;

  User(
      {required this.token,
      required this.id,
      required this.username,
      required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['jwt'],
      id: json['user']['id'],
      username: json['user']['username'],
      email: json['user']['email'],
    );
  }
} */