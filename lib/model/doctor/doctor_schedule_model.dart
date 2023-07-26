// To parse this JSON data, do
//
//     final doctorScheduleModel = doctorScheduleModelFromJson(jsonString);

import 'dart:convert';

DoctorScheduleModel doctorScheduleModelFromJson(String str) => DoctorScheduleModel.fromJson(json.decode(str));

String doctorScheduleModelToJson(DoctorScheduleModel data) => json.encode(data.toJson());

class DoctorScheduleModel {
  String status;
  String message;
  Result result;

  DoctorScheduleModel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory DoctorScheduleModel.fromJson(Map<String, dynamic> json) => DoctorScheduleModel(
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
  int? id;
  String? name;
  String? mobile;
  String? email;
  String? degree;
  String? department;
  String? bio;
  String? photo;
  List<Schedule>? schedule;

  Result({
     this.id,
     this.name,
     this.mobile,
     this.email,
     this.degree,
     this.department,
     this.bio,
     this.photo,
     this.schedule,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    mobile: json["mobile"],
    email: json["email"],
    degree: json["degree"],
    department: json["department"],
    bio: json["bio"],
    photo: json["photo"],
    schedule: List<Schedule>.from(json["schedule"].map((x) => Schedule.fromJson(x))),
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
    "schedule": List<dynamic>.from(schedule!.map((x) => x.toJson())),
  };
}

class Schedule {
  int? id;
  String? hospital;
  String? startTime;
  String? endTime;
  bool? active;

  Schedule({
     this.id,
     this.hospital,
     this.startTime,
     this.endTime,
     this.active,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    id: json["id"],
    hospital: json["hospital"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "hospital": hospital,
    "start_time": startTime,
    "end_time": endTime,
    "active": active,
  };
}
