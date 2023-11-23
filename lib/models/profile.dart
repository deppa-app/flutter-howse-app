class Profile {
  const Profile({
    this.data,
  });

  final List<DataProfile> ?data;

  factory Profile.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<DataProfile> dataList =
        list.map((i) => DataProfile.fromJson(i)).toList();
    return Profile(data: dataList);
  }
}

class DataProfile {
  final int ?id;
  final String ?name;
  final String ?lastName;
  final String ?email;
  final String ?birthday;
  final String ?gender;
  final String ?identificationNumber;
  final String ?avatar;

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

class ModelProfile {
  final int ?id;
  final String ?name;
  final String ?lastName;
  final String ?email;
  final String ?birthday;
  final String ?gender;
  final String ?avatar;
  final String ?identificationNumber;
  final String ?numberPhone;
  final int ?pin;
  final String ?expirationDate;
  final String ?emisionDate;
  final int ?numberPhoneValidation;
  final int ?identificationNumberValidation;
  final bool ?emailValidation;
  final bool ?paymentValidation;
  final String ?updateAt;
  final String ?creationAt;
  final String ?rut;
  final String ?address;

  ModelProfile({
    this.id,
    this.avatar,
    this.numberPhone,
    this.pin,
    this.expirationDate,
    this.emisionDate,
    this.numberPhoneValidation,
    this.identificationNumberValidation,
    this.emailValidation,
    this.paymentValidation,
    this.updateAt,
    this.creationAt,
    this.rut,
    this.address,
    this.name,
    this.lastName,
    this.email,
    this.birthday,
    this.gender,
    this.identificationNumber,
  });

  factory ModelProfile.fromJson(Map<String, dynamic> parsedJson) {
    var data = parsedJson["data"];
    var firstElement = data[0];
    return ModelProfile(
      id: firstElement['id'],
      avatar: firstElement['avatar'],
      numberPhone: firstElement['numberPhone'],
      pin: firstElement['pin'],
      expirationDate: firstElement['expirationDate'],
      emisionDate: firstElement['emisionDate'],
      numberPhoneValidation: firstElement['numberPhoneValidation'],
      identificationNumberValidation:
          firstElement['identificationNumberValidation'],
      emailValidation: firstElement['emailValidation'],
      paymentValidation: firstElement['paymentValidation'],
      updateAt: firstElement['updateAt'],
      creationAt: firstElement['creationAt'],
      rut: firstElement['rut'],
      address: firstElement['address'],
      name: firstElement['name'],
      lastName: firstElement['lastName'],
      email: firstElement['email'],
      birthday: firstElement['birthday'],
      gender: firstElement['gender'],
      identificationNumber: firstElement['identificationNumber'],
    );
  }
}

//Modelo de Perfil para registro en creación de cuenta
class ValidateProfile {
  final int id;
  final String name;
  final String lastName;
  final String identificationNumber;
  final String email;
  final String numberPhone;
  final String? pin;
  final String gender;
  final String expirationDate;
  final String emisionDate;
  final DateTime birthdate;
  final int? numberPhoneValidation;
  final int? identificationNumberValidation;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;

  ValidateProfile({
    required this.id,
    required this.name,
    required this.lastName,
    required this.identificationNumber,
    required this.email,
    required this.numberPhone,
    this.pin,
    required this.gender,
    required this.expirationDate,
    required this.emisionDate,
    required this.birthdate,
    this.numberPhoneValidation,
    this.identificationNumberValidation,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

  factory ValidateProfile.fromJson(Map<String, dynamic> parsedJson) {
    return ValidateProfile(
      id: parsedJson['id'],
      name: parsedJson['attributes']['name'],
      lastName: parsedJson['attributes']['lastName'],
      identificationNumber: parsedJson['attributes']['identificationNumber'],
      email: parsedJson['attributes']['email'],
      numberPhone: parsedJson['attributes']['numberPhone'],
      pin: parsedJson['attributes']['pin'],
      gender: parsedJson['attributes']['gender'],
      expirationDate: parsedJson['attributes']['experationDate'],
      emisionDate: parsedJson['attributes']['emisionDate'],
      birthdate: DateTime.parse(parsedJson['attributes']['birthdate']),
      numberPhoneValidation: parsedJson['attributes']['numberPhoneValidation'],
      identificationNumberValidation: parsedJson['attributes']['indentificationNumberValidation'],
      createdAt: DateTime.parse(parsedJson['attributes']['createdAt']),
      updatedAt: DateTime.parse(parsedJson['attributes']['updatedAt']),
      publishedAt: DateTime.parse(parsedJson['attributes']['publishedAt']),
    );
  }
}

