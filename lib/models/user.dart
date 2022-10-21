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
    var firstElement = data[0];

    return DataUser(
        id: firstElement['id'],
        userName: firstElement["username"],
        password: firstElement['password'],
        publicToken: firstElement["publicToken"],
        rut: firstElement['rut']);
  }
}
