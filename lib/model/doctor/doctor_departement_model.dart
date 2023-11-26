// To parse this JSON data, do
//
//     final doctorDepartmentModel = doctorDepartmentModelFromJson(jsonString);

import 'dart:convert';

DoctorDepartmentModel doctorDepartmentModelFromJson(String str) => DoctorDepartmentModel.fromJson(json.decode(str));

String doctorDepartmentModelToJson(DoctorDepartmentModel data) => json.encode(data.toJson());

class DoctorDepartmentModel {
  String status;
  String message;
  Result result;

  DoctorDepartmentModel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory DoctorDepartmentModel.fromJson(Map<String, dynamic> json) => DoctorDepartmentModel(
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
  String anesthetics;
  String breastScreening;
  String cardiology;
  String earNoseAndThroat;
  String elderlyServicesDepartment;
  String gastroenterology;
  String gynecology;
  String hematology;
  String neonatalUnit;
  String neurology;
  String nutritionAndDietetics;
  String obstetricsAndGynecologyUnits;
  String oncology;
  String orthopedics;
  String physiotherapy;
  String sexualHealth;
  String urology;

  Result({
    required this.anesthetics,
    required this.breastScreening,
    required this.cardiology,
    required this.earNoseAndThroat,
    required this.elderlyServicesDepartment,
    required this.gastroenterology,
    required this.gynecology,
    required this.hematology,
    required this.neonatalUnit,
    required this.neurology,
    required this.nutritionAndDietetics,
    required this.obstetricsAndGynecologyUnits,
    required this.oncology,
    required this.orthopedics,
    required this.physiotherapy,
    required this.sexualHealth,
    required this.urology,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    anesthetics: json["anesthetics"],
    breastScreening: json["breast screening"],
    cardiology: json["cardiology"],
    earNoseAndThroat: json["ear nose and throat"],
    elderlyServicesDepartment: json["elderly services department"],
    gastroenterology: json["gastroenterology"],
    gynecology: json["gynecology"],
    hematology: json["hematology"],
    neonatalUnit: json["neonatal unit"],
    neurology: json["neurology"],
    nutritionAndDietetics: json["nutrition and dietetics"],
    obstetricsAndGynecologyUnits: json["obstetrics and gynecology units"],
    oncology: json["oncology"],
    orthopedics: json["orthopedics"],
    physiotherapy: json["physiotherapy"],
    sexualHealth: json["sexual health"],
    urology: json["urology"],
  );

  Map<String, dynamic> toJson() => {
    "anesthetics": anesthetics,
    "breast screening": breastScreening,
    "cardiology": cardiology,
    "ear nose and throat": earNoseAndThroat,
    "elderly services department": elderlyServicesDepartment,
    "gastroenterology": gastroenterology,
    "gynecology": gynecology,
    "hematology": hematology,
    "neonatal unit": neonatalUnit,
    "neurology": neurology,
    "nutrition and dietetics": nutritionAndDietetics,
    "obstetrics and gynecology units": obstetricsAndGynecologyUnits,
    "oncology": oncology,
    "orthopedics": orthopedics,
    "physiotherapy": physiotherapy,
    "sexual health": sexualHealth,
    "urology": urology,
  };
}
