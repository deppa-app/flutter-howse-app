
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
//Mapeo de respuesta
class DataUser {
  String token;
  int id;
  String username;
  String email;
  String provider;
  bool confirmed;
  bool blocked;
  String publicToken;
  DateTime createdAt;
  DateTime updatedAt;

  DataUser({
    required this.token,
    required this.id,
    required this.username,
    required this.email,
    required this.provider,
    required this.confirmed,
    required this.blocked,
    required this.publicToken,
    required this.createdAt,
    required this.updatedAt,
  });
  
  factory DataUser.fromJson(Map<String, dynamic> json) {
    return DataUser(
      token: json['jwt'],
      id: json['user']['id'],
      username: json['user']['username'],
      email: json['user']['email'],
      provider: json['user']['provider'],
      confirmed: json['user']['confirmed'],
      blocked: json['user']['blocked'],
      publicToken: json['user']['publicToken'],
      createdAt: DateTime.parse(json['user']['createdAt']),
      updatedAt: DateTime.parse(json['user']['updatedAt']),
    );
  }
}
