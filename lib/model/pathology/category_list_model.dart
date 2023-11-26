// To parse this JSON data, do
//
//     final testCategoryListModel = testCategoryListModelFromJson(jsonString);

import 'dart:convert';

TestCategoryListModel testCategoryListModelFromJson(String str) => TestCategoryListModel.fromJson(json.decode(str));

String testCategoryListModelToJson(TestCategoryListModel data) => json.encode(data.toJson());

class TestCategoryListModel {
  String? status;
  String? message;
  Result? result;

  TestCategoryListModel({
     this.status,
     this.message,
     this.result,
  });

  factory TestCategoryListModel.fromJson(Map<String, dynamic> json) => TestCategoryListModel(
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
  List<Category>? categories;

  Result({
     this.categories,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
  };
}

class Category {
  int? id;
  String? name;
  String? description;
  int? sequence;
  String? iconPhoto;

  Category({
     this.id,
     this.name,
    this.description,
     this.sequence,
     this.iconPhoto,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    description: json["description"] ?? "No Description",
    sequence: json["sequence"],
    iconPhoto: json["icon_photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "sequence": sequence,
    "icon_photo": iconPhoto,
  };
}
