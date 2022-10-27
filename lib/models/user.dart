import 'package:howse_app/models/profile.dart';

class User {
  const User({
    this.data,
  });

  final List<DataUser> data;

  factory User.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<DataUser> dataList = list.map((i) => DataUser.fromJson(i)).toList();
    return User(data: dataList);
  }
}

class DataUser {
  final int id;
  final String userName;
  final String password;
  final String publicToken;
  final String rut;
  //final DateTime createdAt;
  //final DateTime updatedAt;
  //final DataProfile profile;

  DataUser({
    this.id,
    this.userName,
    this.password,
    this.publicToken,
    //this.createdAt,
    //this.updatedAt,
    this.rut,
    //this.profile
  });

  factory DataUser.fromJson(Map<String, dynamic> parsedJson) {
    var data = parsedJson["data"];

    return DataUser(
        id: data['id'],
        userName: data["username"],
        password: data['password'],
        publicToken: data["publicToken"],
        rut: data['rut']);
  }
}

class ModelUser {
  final int id;
  final String userName;
  final String password;
  final String publicToken;
  final String rut;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DataProfile profile;

  ModelUser(
      {this.id,
      this.userName,
      this.password,
      this.publicToken,
      this.createdAt,
      this.updatedAt,
      this.rut,
      this.profile});
}
