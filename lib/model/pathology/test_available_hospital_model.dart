// To parse this JSON data, do
//
//     final testAvailableHospitalModel = testAvailableHospitalModelFromJson(jsonString);

import 'dart:convert';

TestAvailableHospitalModel testAvailableHospitalModelFromJson(String str) => TestAvailableHospitalModel.fromJson(json.decode(str));

String testAvailableHospitalModelToJson(TestAvailableHospitalModel data) => json.encode(data.toJson());

class TestAvailableHospitalModel {
  String status;
  String message;
  ResultHospital result;

  TestAvailableHospitalModel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory TestAvailableHospitalModel.fromJson(Map<String, dynamic> json) => TestAvailableHospitalModel(
    status: json["status"],
    message: json["message"],
    result: ResultHospital.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result.toJson(),
  };
}

class ResultHospital {
  List<CostOfHospitalsTest> costOfHospitalsTest;
  Pagination pagination;

  ResultHospital({
    required this.costOfHospitalsTest,
    required this.pagination,
  });

  factory ResultHospital.fromJson(Map<String, dynamic> json) => ResultHospital(
    costOfHospitalsTest: List<CostOfHospitalsTest>.from(json["costOfHospitalsTest"].map((x) => CostOfHospitalsTest.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "costOfHospitalsTest": List<dynamic>.from(costOfHospitalsTest.map((x) => x.toJson())),
    "pagination": pagination.toJson(),
  };
}

class CostOfHospitalsTest {
  int id;
  int price;
  int discount;
  int hospitalId;
  String hospitalName;
  String hospitalBranch;
  String latitude;
  String longitude;
  String hospitalPhoto;
  String district;

  CostOfHospitalsTest({
    required this.id,
    required this.price,
    required this.discount,
    required this.hospitalId,
    required this.hospitalName,
    required this.hospitalBranch,
    required this.latitude,
    required this.longitude,
    required this.hospitalPhoto,
    required this.district,
  });

  factory CostOfHospitalsTest.fromJson(Map<String, dynamic> json) => CostOfHospitalsTest(
    id: json["id"],
    price: json["price"],
    discount: json["discount"],
    district:  json['district_name'],
    hospitalId: json["hospital_id"],
    hospitalName: json["hospital_name"],
    hospitalBranch: json["hospital_branch"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    hospitalPhoto: json["hospital_photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "discount": discount,
    "hospital_id": hospitalId,
    "district_name" :district,
    "hospital_name": hospitalName,
    "hospital_branch": hospitalBranch,
    "latitude": latitude,
    "longitude": longitude,
    "hospital_photo": hospitalPhoto,
  };
}

class Pagination {
  String firstPageUrl;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int total;
  int count;
  int currentPage;

  Pagination({
    required this.firstPageUrl,
    required this.lastPage,
    required this.lastPageUrl,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.total,
    required this.count,
    required this.currentPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    firstPageUrl: json["first_page_url"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    total: json["total"],
    count: json["count"],
    currentPage: json["current_page"],
  );

  Map<String, dynamic> toJson() => {
    "first_page_url": firstPageUrl,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "total": total,
    "count": count,
    "current_page": currentPage,
  };
}
