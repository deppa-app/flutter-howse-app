import 'dart:convert';

TocSession tocSessionFromJson(String str) => TocSession.fromJson(json.decode(str));

String tocSessionToJson(TocSession data) => json.encode(data.toJson());

class TocSession {
  TocSession({
    this.sessionId = "",
    this.status = "",
  });

  String sessionId;
  String status;

  factory TocSession.fromJson(Map<String, dynamic> json) => TocSession(
        sessionId: json["session_id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "session_id": sessionId,
        "status": status,
      };
}
