// To parse this JSON data, do
//
//     final districtModel = districtModelFromJson(jsonString);

import 'dart:convert';

DistrictModel districtModelFromJson(String str) => DistrictModel.fromJson(json.decode(str));

String districtModelToJson(DistrictModel data) => json.encode(data.toJson());

class DistrictModel {
  String status;
  String message;
  List<DisResult> result;

  DistrictModel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
    status: json["status"],
    message: json["message"],
    result: List<DisResult>.from(json["result"].map((x) => DisResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class DisResult {
  String name;
  String bnName;
  int id;

  DisResult({
    required this.name,
    required this.bnName,
    required this.id,
  });

  factory DisResult.fromJson(Map<String, dynamic> json) => DisResult(
    name: json["name"],
    bnName: json["bn_name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "bn_name": bnName,
    "id": id,
  };
}
