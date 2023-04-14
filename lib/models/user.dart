import 'package:deppa_app/models/profile.dart';
class User {
  const User({
    this.data,
  });

  final List<DataUser> ?data;

  factory User.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<DataUser> dataList = list.map((i) => DataUser.fromJson(i)).toList();
    return User(data: dataList);
  }
}
class DataUser {
  final int ?id;
  final String ?token;
  final String ?username;
  final String email;
  final String ?password;
  final String ?publicToken;
  final String ?rut;
  //final DateTime createdAt;
  //final DateTime updatedAt;
  //final DataProfile profile;

  DataUser({
    this.token,
    this.id,
    this.username,
    required this.email,
    this.password,
    this.publicToken,
    //this.createdAt,
    //this.updatedAt,
    this.rut,
    //this.profile
  });
  factory DataUser.fromJson(Map<String, dynamic> json) {

    return DataUser(
      token: json['jwt'],
      id: json['user']['id'],
      username: json['user']['username'],
      email: json['user']['email'],
      /* password: json['user']['password'], */
      );
  }
}
class ModelUser {
  final int ?id;
  final String ?username;
  final String ?email;
  final String ?password;
  final String ?publicToken;
  final String ?rut;
  final DateTime ?createdAt;
  final DateTime ?updatedAt;
  final DataProfile ?profile;

  ModelUser( 
      {this.id,
      this.username,
      this.email,
      this.password,
      this.publicToken,
      this.createdAt,
      this.updatedAt,
      this.rut,
      this.profile});
}