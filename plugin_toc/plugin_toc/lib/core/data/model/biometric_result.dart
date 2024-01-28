import 'dart:convert';

BiometricResult biometricResultFromJson(String str) => BiometricResult.fromJson(json.decode(str));

String biometricResultToJson(BiometricResult data) => json.encode(data.toJson());

class BiometricResult {
  BiometricResult({
    this.tocToken = "",
    this.status = "",
  });

  String tocToken;
  String status;

  factory BiometricResult.fromJson(Map<String, dynamic> json) => BiometricResult(
        tocToken: json["toc_token"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "toc_token": tocToken,
        "status": status,
      };
}
