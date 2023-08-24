// To parse this JSON data, do
//
//     final hospitalListModel = hospitalListModelFromJson(jsonString);

import 'dart:convert';

HospitalListModel hospitalListModelFromJson(String str) => HospitalListModel.fromJson(json.decode(str));

String hospitalListModelToJson(HospitalListModel data) => json.encode(data.toJson());

class HospitalListModel {
  String? status;
  String? message;
  Result? result;

  HospitalListModel({
     this.status,
     this.message,
     this.result,
  });

  factory HospitalListModel.fromJson(Map<String, dynamic> json) => HospitalListModel(
    status: json["status"],
    message: json["message"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result!.toJson(),
  };
}

class Result {
  List<Hospital> hospitals;

  Result({
    required this.hospitals,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    hospitals: List<Hospital>.from(json["hospitals"].map((x) => Hospital.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "hospitals": List<dynamic>.from(hospitals.map((x) => x.toJson())),
  };
}

class Hospital {
  int? id;
  String? name;
  String? branch;
  String? address1;
  String?latitude;
  String? longitude;
  String? photo;
  List<TestsPrice>? testsPrice;

  Hospital({
     this.id,
     this.name,
     this.branch,
     this.address1,
     this.latitude,
     this.longitude,
     this.photo,
     this.testsPrice,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
    id: json["id"],
    name: json["name"],
    branch: json["branch"],
    address1: json["address1"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    photo: json["photo"],
    testsPrice: List<TestsPrice>.from(json["tests_price"].map((x) => TestsPrice.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "branch": branch,
    "address1": address1,
    "latitude": latitude,
    "longitude": longitude,
    "photo": photo,
    "tests_price": List<dynamic>.from(testsPrice!.map((x) => x.toJson())),
  };
}

class TestsPrice {
  int testId;
  String testTitle;
  String testSubTitle;
  int price;
  int discount;
  dynamic description;
  String iconPhoto;

  TestsPrice({
    required this.testId,
    required this.testTitle,
    required this.testSubTitle,
    required this.price,
    required this.discount,
    this.description,
    required this.iconPhoto,
  });

  factory TestsPrice.fromJson(Map<String, dynamic> json) => TestsPrice(
    testId: json["test_id"],
    testTitle: json["test_title"],
    testSubTitle: json["test_sub_title"],
    price: json["price"],
    discount: json["discount"],
    description: json["description"],
    iconPhoto: json["icon_photo"],
  );

  Map<String, dynamic> toJson() => {
    "test_id": testId,
    "test_title": testTitle,
    "test_sub_title": testSubTitle,
    "price": price,
    "discount": discount,
    "description": description,
    "icon_photo": iconPhoto,
  };
}
