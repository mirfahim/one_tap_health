// To parse this JSON data, do
//
//     final hospitalCostOfTestListUnderTextModel = hospitalCostOfTestListUnderTextModelFromJson(jsonString);

import 'dart:convert';

HospitalCostOfTestListUnderTestModel hospitalCostOfTestListUnderTextModelFromJson(String str) => HospitalCostOfTestListUnderTestModel.fromJson(json.decode(str));

String hospitalCostOfTestListUnderTextModelToJson(HospitalCostOfTestListUnderTestModel data) => json.encode(data.toJson());

class HospitalCostOfTestListUnderTestModel {
  String status;
  String message;
  List<ResultOfTest> result;

  HospitalCostOfTestListUnderTestModel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory HospitalCostOfTestListUnderTestModel.fromJson(Map<String, dynamic> json) => HospitalCostOfTestListUnderTestModel(
    status: json["status"],
    message: json["message"],
    result: List<ResultOfTest>.from(json["result"].map((x) => ResultOfTest.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class ResultOfTest {
  int testId;
  List<HospitalFromMatchedTest> hospitals;
  int priceAfterDiscount;
  MatchedTest test;

  ResultOfTest({
    required this.testId,
    required this.hospitals,
    required this.priceAfterDiscount,
    required this.test,
  });

  factory ResultOfTest.fromJson(Map<String, dynamic> json) => ResultOfTest(
    testId: json["test_id"],
    hospitals: List<HospitalFromMatchedTest>.from(json["hospitals"].map((x) => HospitalFromMatchedTest.fromJson(x))),
    priceAfterDiscount: json["price_after_discount"],
    test: MatchedTest.fromJson(json["test"]),
  );

  Map<String, dynamic> toJson() => {
    "test_id": testId,
    "hospitals": List<dynamic>.from(hospitals.map((x) => x.toJson())),
    "price_after_discount": priceAfterDiscount,
    "test": test.toJson(),
  };
}

class HospitalFromMatchedTest {
  int testId;
  String testTitle;
  String hospitalName;
  String hospitalBranch;
  String latitude;
  String longitude;
  String hospitalPhoto;
  int price;
  int discount;
  int priceAfterDiscount;

  HospitalFromMatchedTest({
    required this.testId,
    required this.testTitle,
    required this.hospitalName,
    required this.hospitalBranch,
    required this.latitude,
    required this.longitude,
    required this.hospitalPhoto,
    required this.price,
    required this.discount,
    required this.priceAfterDiscount,
  });

  factory HospitalFromMatchedTest.fromJson(Map<String, dynamic> json) => HospitalFromMatchedTest(
    testId: json["test_id"],
    testTitle: json["test_title"],
    hospitalName: json["hospital_name"],
    hospitalBranch: json["hospital_branch"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    hospitalPhoto: json["hospital_photo"],
    price: json["price"],
    discount: json["discount"],
    priceAfterDiscount: json["price_after_discount"],
  );

  Map<String, dynamic> toJson() => {
    "test_id": testId,
    "test_title": testTitle,
    "hospital_name": hospitalName,
    "hospital_branch": hospitalBranch,
    "latitude": latitude,
    "longitude": longitude,
    "hospital_photo": hospitalPhoto,
    "price": price,
    "discount": discount,
    "price_after_discount": priceAfterDiscount,
  };
}

class MatchedTest {
  int id;
  String title;

  MatchedTest({
    required this.id,
    required this.title,
  });

  factory MatchedTest.fromJson(Map<String, dynamic> json) => MatchedTest(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}
