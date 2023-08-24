// To parse this JSON data, do
//
//     final doctorListModel = doctorListModelFromJson(jsonString);

import 'dart:convert';

DoctorListModel doctorListModelFromJson(String str) => DoctorListModel.fromJson(json.decode(str));

String doctorListModelToJson(DoctorListModel data) => json.encode(data.toJson());

class DoctorListModel {
  String status;
  String message;
  Result result;

  DoctorListModel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory DoctorListModel.fromJson(Map<String, dynamic> json) => DoctorListModel(
    status: json["status"],
    message: json["message"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result.toJson(),
  };
}

class Result {
  List<Doctor> doctors;
  Pagination pagination;

  Result({
    required this.doctors,
    required this.pagination,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    doctors: List<Doctor>.from(json["doctors"].map((x) => Doctor.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "doctors": List<dynamic>.from(doctors.map((x) => x.toJson())),
    "pagination": pagination.toJson(),
  };
}

class Doctor {
  int id;
  String name;
  String mobile;
  String email;
  String degree;
  String department;
  String? bio;
  String photo;

  Doctor({
    required this.id,
    required this.name,
    required this.mobile,
    required this.email,
    required this.degree,
    required this.department,
    this.bio,
    required this.photo,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json["id"],
    name: json["name"],
    mobile: json["mobile"] == null ? "No Data" : json["mobile"],
    email: json["email"] == null ? "no data" : json["email"],
    degree: json["degree"],
    department: json["department"],
    bio: json["bio"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mobile": mobile,
    "email": email,
    "degree": degree,
    "department": department,
    "bio": bio,
    "photo": photo,
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
