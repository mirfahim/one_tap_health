// To parse this JSON data, do
//
//     final hospitalWiseDoctorModel = hospitalWiseDoctorModelFromJson(jsonString);

import 'dart:convert';

HospitalWiseDoctorModel hospitalWiseDoctorModelFromJson(String str) => HospitalWiseDoctorModel.fromJson(json.decode(str));

String hospitalWiseDoctorModelToJson(HospitalWiseDoctorModel data) => json.encode(data.toJson());

class HospitalWiseDoctorModel {
  String status;
  String message;
  Result result;

  HospitalWiseDoctorModel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory HospitalWiseDoctorModel.fromJson(Map<String, dynamic> json) => HospitalWiseDoctorModel(
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
  int id;
  String name;
  String branch;
  String address1;
  String latitude;
  String longitude;
  String photo;
  List<ScheduleByHos> schedule;

  Result({
    required this.id,
    required this.name,
    required this.branch,
    required this.address1,
    required this.latitude,
    required this.longitude,
    required this.photo,
    required this.schedule,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    branch: json["branch"],
    address1: json["address1"],
    latitude: json["latitude"] ?? "0.065675675",
    longitude: json["longitude"] ?? "0.8787978",
    photo: json["photo"],
    schedule: List<ScheduleByHos>.from(json["schedule"].map((x) => ScheduleByHos.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "branch": branch,
    "address1": address1,
    "latitude": latitude,
    "longitude": longitude,
    "photo": photo,
    "schedule": List<dynamic>.from(schedule.map((x) => x.toJson())),
  };
}

class ScheduleByHos {
  int id;
  String hospitalName;
  String hospitalBranch;
  String hospitalAddress;
  String doctorName;
  String doctorDegree;
  String doctorDepartment;
  String bio;
  int doctorFee;
  int discount;
  int feeAfterDiscount;
  String doctorAvailableDay;
  String startTime;
  String endTime;
  bool active;

  ScheduleByHos({
    required this.id,
    required this.hospitalName,
    required this.hospitalBranch,
    required this.hospitalAddress,
    required this.doctorName,
    required this.bio,
    required this.doctorDegree,
    required this.doctorDepartment,
    required this.doctorFee,
    required this.discount,
    required this.feeAfterDiscount,
    required this.doctorAvailableDay,
    required this.startTime,
    required this.endTime,
    required this.active,
  });

  factory ScheduleByHos.fromJson(Map<String, dynamic> json) => ScheduleByHos(
    id: json["id"],
    hospitalName: json["hospital_name"],
    bio: json["doctor_bio"],

    hospitalBranch: json["hospital_branch"],
    hospitalAddress: json["hospital_address"],
    doctorName: json["doctor_name"],
    doctorDegree: json["doctor_degree"],
    doctorDepartment: json["doctor_department"],
    doctorFee: json["doctor_fee"],
    discount: json["discount"],
    feeAfterDiscount: json["fee_after_discount"],
    doctorAvailableDay: json["doctorAvailableDay"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "hospital_name": hospitalName,
    "hospital_branch": hospitalBranch,
    "hospital_address": hospitalAddress,
    "doctor_name": doctorName,
    "doctor_degree": doctorDegree,
    "doctor_department": doctorDepartment,
    "doctor_fee": doctorFee,
    "discount": discount,
    "doctor_bio": bio,
    "fee_after_discount": feeAfterDiscount,
    "doctorAvailableDay": doctorAvailableDay,
    "start_time": startTime,
    "end_time": endTime,
    "active": active,
  };
}
