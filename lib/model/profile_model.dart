// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String? status;
  String? message;
  ProfileResult? result;

  ProfileModel({
     this.status,
     this.message,
     this.result,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    status: json["status"],
    message: json["message"],
    result: ProfileResult.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result!.toJson(),
  };
}

class ProfileResult {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? userRole;
  int? status;
  String? profilePhotoUrl;

  ProfileResult({
     this.id,
     this.name,
     this.email,
     this.phone,
     this.userRole,
     this.status,
    this.profilePhotoUrl,
  });

  factory ProfileResult.fromJson(Map<String, dynamic> json) => ProfileResult(
    id: json["id"],
    name: json["name"] ?? "No Data",
    email: json["email"] ?? "No Data",
    phone: json["phone"],
    userRole: json["user_role"],
    status: json["status"],
    profilePhotoUrl: json["profile_photo_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "user_role": userRole,
    "status": status,
    "profile_photo_url": profilePhotoUrl,
  };
}
