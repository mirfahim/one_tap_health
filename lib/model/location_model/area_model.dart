// To parse this JSON data, do
//
//     final zoneModel = zoneModelFromJson(jsonString);

import 'dart:convert';

ZoneModel zoneModelFromJson(String str) => ZoneModel.fromJson(json.decode(str));

String zoneModelToJson(ZoneModel data) => json.encode(data.toJson());

class ZoneModel {
  String status;
  String message;
  List<ZoneResult> result;

  ZoneModel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory ZoneModel.fromJson(Map<String, dynamic> json) => ZoneModel(
    status: json["status"],
    message: json["message"],
    result: List<ZoneResult>.from(json["result"].map((x) => ZoneResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class ZoneResult {
  String name;
  String bnName;
  int id;
  int districtId;

  ZoneResult({
    required this.name,
    required this.bnName,
    required this.id,
    required this.districtId,
  });

  factory ZoneResult.fromJson(Map<String, dynamic> json) => ZoneResult(
    name: json["name"],
    bnName: json["bn_name"],
    id: json["id"],
    districtId: json["district_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "bn_name": bnName,
    "id": id,
    "district_id": districtId,
  };
}
