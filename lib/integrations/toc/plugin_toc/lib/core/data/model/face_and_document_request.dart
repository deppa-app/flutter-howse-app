import 'dart:convert';

FaceAndDocumentRequest faceAndDocumentRequestFromJson(String str) => FaceAndDocumentRequest.fromJson(json.decode(str));

String faceAndDocumentRequestToJson(FaceAndDocumentRequest data) => json.encode(data.toJson());

class FaceAndDocumentRequest {
  FaceAndDocumentRequest({
    this.apiKey = "",
    this.idFront = "",
    this.idBack = "",
    this.selfie = "",
    this.documentType = "",
  });

  String apiKey;
  String idFront;
  String idBack;
  String selfie;
  String documentType;

  factory FaceAndDocumentRequest.fromJson(Map<String, dynamic> json) => FaceAndDocumentRequest(
        apiKey: json["apiKey"],
        idFront: json["id_front"],
        idBack: json["id_back"],
        selfie: json["selfie"],
        documentType: json["documentType"],
      );

  Map<String, dynamic> toJson() => {
        "apiKey": apiKey,
        "id_front": idFront,
        "id_back": idBack,
        "selfie": selfie,
        "documentType": documentType,
      };
}
