class Property {
  final int id;
  final PropertyAttributes attributes;

  Property({
    required this.id,
    required this.attributes,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      attributes: PropertyAttributes.fromJson(json['attributes']),
    );
  }
}

class PropertyAttributes {
  final String cod;
  final String publicToken;
  final String direction;
  final String glosa;
  final String street;
  final String number;
  final String propertiescol;
  final int bathrooms;
  final int parking;
  final int mt2_useful;
  final String? others;
  final int value;
  final int poupularuty;
  final String pdfDocument;
  final int m2_terrace;
  final int m2_total;
  final String allows_pets;
  final String orientation;
  final int common_expenses;
  final String type_propertie;
  final int enviroments;
  final int number_floors;
  final int departments_by_floor;
  final int warehouse;
  final int floornumber;
  final String createdAt;
  final String updatedAt;
  final String publishedAt;

  PropertyAttributes({
    required this.cod,
    required this.publicToken,
    required this.direction,
    required this.glosa,
    required this.street,
    required this.number,
    required this.propertiescol,
    required this.bathrooms,
    required this.parking,
    required this.mt2_useful,
     this.others,
    required this.value,
    required this.poupularuty,
    required this.pdfDocument,
    required this.m2_terrace,
    required this.m2_total,
    required this.allows_pets,
    required this.orientation,
    required this.common_expenses,
    required this.type_propertie,
    required this.enviroments,
    required this.number_floors,
    required this.departments_by_floor,
    required this.warehouse,
    required this.floornumber,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

  factory PropertyAttributes.fromJson(Map<String, dynamic> json) {
    return PropertyAttributes(
      cod: json['cod'],
      publicToken: json['publicToken'],
      direction: json['direction'],
      glosa: json['glosa'],
      street: json['street'],
      number: json['number'],
      propertiescol: json['propertiescol'],
      bathrooms: json['bathrooms'],
      parking: json['parking'],
      mt2_useful: json['mt2_useful'],
      others: json['others'],
      value: json['value'],
      poupularuty: json['poupularuty'],
      pdfDocument: json['pdfDocument'],
      m2_terrace: json['m2_terrace'],
      m2_total: json['m2_total'],
      allows_pets: json['allows_pets'],
      orientation: json['orientation'],
      common_expenses: json['common_expenses'],
      type_propertie: json['type_propertie'],
      enviroments: json['enviroments'],
      number_floors: json['number_floors'],
      departments_by_floor: json['departments_by_floor'],
      warehouse: json['warehouse'],
      floornumber: json['floornumber'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      publishedAt: json['publishedAt'],
    );
  }
}

class PropertyList {
  final List<Property> data;

  PropertyList({
    required this.data,
  });

  factory PropertyList.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Property> properties = list.map((e) => Property.fromJson(e)).toList();

    return PropertyList(data: properties);
  }
}