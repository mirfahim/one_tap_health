// To parse this JSON data, do
//
//     final catWiseActiveTestModel = catWiseActiveTestModelFromJson(jsonString);

import 'dart:convert';

CatWiseActiveTestModel catWiseActiveTestModelFromJson(String str) => CatWiseActiveTestModel.fromJson(json.decode(str));

String catWiseActiveTestModelToJson(CatWiseActiveTestModel data) => json.encode(data.toJson());

class CatWiseActiveTestModel {
  String? status;
  String? message;
  Result? result;

  CatWiseActiveTestModel({
     this.status,
     this.message,
     this.result,
  });

  factory CatWiseActiveTestModel.fromJson(Map<String, dynamic> json) => CatWiseActiveTestModel(
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
  List<Test> tests;

  Result({
    required this.tests,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    tests: List<Test>.from(json["tests"].map((x) => Test.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "tests": List<dynamic>.from(tests.map((x) => x.toJson())),
  };
}

class Test {
  int? id;
  String? title;
  String? subTitle;
  String? categoryName;
  String? iconPhoto;
  String? des;

  Test({
     this.id,
     this.title,
     this.subTitle,
     this.categoryName,
     this.iconPhoto,
    this.des
  });

  factory Test.fromJson(Map<String, dynamic> json) => Test(
    id: json["id"],
    title: json["title"],
    subTitle: json["sub_title"],
    des: json["description"],

    categoryName: json["category_name"],
    iconPhoto: json["icon_photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "sub_title": subTitle,
    "category_name": categoryName,
    "icon_photo": iconPhoto,
    "description": des,
  };
}
