// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? status;
  String? accessToken;
  String? tokenType;
  String? message;
  User? user;

  LoginModel({
     this.status,
     this.accessToken,
     this.tokenType,
     this.message,
     this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    message: json["message"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "access_token": accessToken,
    "token_type": tokenType,
    "message": message,
    "user": user!.toJson(),
  };
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? userRole;
  int? status;
  String? profilePhotoUrl;

  User({
     this.id,
     this.name,
     this.email,
     this.phone,
     this.userRole,
     this.status,
    this.profilePhotoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
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
