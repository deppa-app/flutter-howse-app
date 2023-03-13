// To parse this JSON data, do
//
//     final sessionRequest = sessionRequestFromJson(jsonString);

import 'dart:convert';

SessionRequest sessionRequestFromJson(String str) => SessionRequest.fromJson(json.decode(str));

String sessionRequestToJson(SessionRequest data) => json.encode(data.toJson());

class SessionRequest {
  SessionRequest({
    this.apiKey = "",
    this.liveness = true,
    this.autocapture = true,
    this.mode = "1",
    this.livenessPassive = true,
    this.fakeDetector = true,
  });

  String apiKey;
  bool liveness;
  bool autocapture;
  String mode;
  bool livenessPassive;
  bool fakeDetector;

  factory SessionRequest.fromJson(Map<String, dynamic> json) => SessionRequest(
        apiKey: json["apiKey"],
        liveness: json["liveness"],
        autocapture: json["autocapture"],
        mode: json["mode"],
        livenessPassive: json["liveness_passive"],
        fakeDetector: json["fake_detector"],
      );

  Map<String, dynamic> toJson() => {
        "apiKey": apiKey,
        "liveness": liveness,
        "autocapture": autocapture,
        "mode": mode,
        "liveness_passive": livenessPassive,
        "fake_detector": fakeDetector,
      };
}
