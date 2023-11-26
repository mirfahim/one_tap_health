// To parse this JSON data, do
//
//     final getReportImagesModel = getReportImagesModelFromJson(jsonString);

import 'dart:convert';

GetReportImagesModel getReportImagesModelFromJson(String str) => GetReportImagesModel.fromJson(json.decode(str));

String getReportImagesModelToJson(GetReportImagesModel data) => json.encode(data.toJson());

class GetReportImagesModel {
  String status;
  String message;
  Result result;

  GetReportImagesModel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory GetReportImagesModel.fromJson(Map<String, dynamic> json) => GetReportImagesModel(
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
  String orderNo;
  DateTime testDate;
  int amount;
  int patientId;
  Patient patient;
  TestReportFile testReportFile;

  Result({
    required this.id,
    required this.orderNo,
    required this.testDate,
    required this.amount,
    required this.patientId,
    required this.patient,
    required this.testReportFile,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    orderNo: json["order_no"],
    testDate: DateTime.parse(json["test_date"]),
    amount: json["amount"],
    patientId: json["patient_id"],
    patient: Patient.fromJson(json["patient"]),
    testReportFile: TestReportFile.fromJson(json["test_report_file"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_no": orderNo,
    "test_date": testDate.toIso8601String(),
    "amount": amount,
    "patient_id": patientId,
    "patient": patient.toJson(),
    "test_report_file": testReportFile.toJson(),
  };
}

class Patient {
  int id;
  String name;
  String age;

  Patient({
    required this.id,
    required this.name,
    required this.age,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json["id"],
    name: json["name"],
    age: json["age"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "age": age,
  };
}

class TestReportFile {
  int id;
  int testOrderId;
  String title;
  String notes;
  List<String> files;

  TestReportFile({
    required this.id,
    required this.testOrderId,
    required this.title,
    required this.notes,
    required this.files,
  });

  factory TestReportFile.fromJson(Map<String, dynamic> json) => TestReportFile(
    id: json["id"],
    testOrderId: json["test_order_id"],
    title: json["title"],
    notes: json["notes"],
    files: List<String>.from(json["files"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "test_order_id": testOrderId,
    "title": title,
    "notes": notes,
    "files": List<dynamic>.from(files.map((x) => x)),
  };
}
