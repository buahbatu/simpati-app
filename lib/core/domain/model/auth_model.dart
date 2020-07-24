// To parse this JSON data, do
//
//     final auth = authFromJson(jsonString);

import 'dart:convert';

Auth authFromJson(String str) => Auth.fromJson(json.decode(str));

String authToJson(Auth data) => json.encode(data.toJson());

class Auth {
  Auth({
    this.status,
    this.message,
    this.data,
  });

  String status;
  String message;
  Data data;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.token,
    this.detail,
  });

  String token;
  Detail detail;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        detail: Detail.fromJson(json["detail"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "detail": detail.toJson(),
      };
}

class Detail {
  Detail({
    this.userId,
    this.fullname,
    this.email,
    this.handphone,
    this.createdAt,
    this.activationKey,
    this.status,
    this.forgotKey,
    this.forgotTimestamp,
    this.occupation,
    this.referal,
    this.userTypeId,
  });

  String userId;
  String fullname;
  String email;
  String handphone;
  DateTime createdAt;
  String activationKey;
  String status;
  String forgotKey;
  String forgotTimestamp;
  String occupation;
  String referal;
  String userTypeId;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        userId: json["user_id"],
        fullname: json["fullname"],
        email: json["email"],
        handphone: json["handphone"],
        createdAt: DateTime.parse(json["created_at"]),
        activationKey: json["activation_key"],
        status: json["status"],
        forgotKey: json["forgot_key"],
        forgotTimestamp: json["forgot_timestamp"],
        occupation: json["occupation"],
        referal: json["referal"],
        userTypeId: json["user_type_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "fullname": fullname,
        "email": email,
        "handphone": handphone,
        "created_at": createdAt.toIso8601String(),
        "activation_key": activationKey,
        "status": status,
        "forgot_key": forgotKey,
        "forgot_timestamp": forgotTimestamp,
        "occupation": occupation,
        "referal": referal,
        "user_type_id": userTypeId,
      };
}
