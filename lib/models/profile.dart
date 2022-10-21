class Profile {
  const Profile({
    this.data,
  });

  final List<DataProfile> data;

  factory Profile.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<DataProfile> dataList =
        list.map((i) => DataProfile.fromJson(i)).toList();
    return Profile(data: dataList);
  }
}

class DataProfile {
  final int id;
  final String name;
  final String lastName;
  final String email;
  final String birthday;
  final String gender;
  final String identificationNumber;
  final String avatar;

  DataProfile(
      {this.id,
      this.name,
      this.lastName,
      this.email,
      this.birthday,
      this.gender,
      this.identificationNumber,
      this.avatar});

  factory DataProfile.fromJson(Map<String, dynamic> parsedJson) {
    var data = parsedJson['data'];
    var avatar = data['avatar'];
    var formats = avatar['formats'];
    var thumbnail = formats['thumbnail'];
    var url = thumbnail['url'];
    // var company = data['company'];
    return DataProfile(
      id: data['id'],
      name: data["name"],
      lastName: data["lastName"],
      email: data['email'],
      birthday: data['birthday'],
      gender: data['gender'],
      identificationNumber: data['identificationNumber'],
      avatar: url,
      // company: DataCompany(
      //   id: company['id'],
      //   businessName: company['businessName'],
      //   identificationNumber: company['identificationNumber'],
      //   turnover: company['turnover'],
      // )
    );
  }
}

class ClassProfile {
  final int id;
  final String name;
  final String lastName;
  final String email;
  final String birthday;
  final String gender;
  final String identificationNumber;
  final String createdAt;
  final String updatedAt;
  final String publishedAt;

  ClassProfile({
    this.id,
    this.name,
    this.lastName,
    this.email,
    this.birthday,
    this.gender,
    this.identificationNumber,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory ClassProfile.fromJson(Map<String, dynamic> parsedJson) {
    var data = parsedJson["data"];
    var firstElement = data[0];
    return ClassProfile(
      id: firstElement["id"],
      name: firstElement["name"],
      lastName: firstElement["lastName"],
      email: firstElement["email"],
      birthday: firstElement["birthday"],
      gender: firstElement["gender"],
      identificationNumber: firstElement["identificationNumber"],
      createdAt: firstElement["createdAt"],
      updatedAt: firstElement["updatedAt"],
      publishedAt: firstElement["publishedAt"],
    );
  }
}

class ValidateProfile {
  final int id;
  final String name;
  final String lastName;
  final String email;
  final String birthday;
  final String gender;
  final String identificationNumber;
  final String createdAt;
  final String updatedAt;
  final String publishedAt;

  ValidateProfile({
    this.id,
    this.name,
    this.lastName,
    this.email,
    this.birthday,
    this.gender,
    this.identificationNumber,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory ValidateProfile.fromJson(Map<String, dynamic> parsedJson) {
    var data = parsedJson["data"];
    return ValidateProfile(
      id: data["id"],
      name: data["name"],
      lastName: data["lastName"],
      email: data["email"],
      birthday: data["birthday"],
      gender: data["gender"],
      identificationNumber: data["identificationNumber"],
      createdAt: data["createdAt"],
      updatedAt: data["updatedAt"],
      publishedAt: data["publishedAt"],
    );
  }
}
