// To parse this JSON data, do
//
//     final appointmentOrderListModel = appointmentOrderListModelFromJson(jsonString);

import 'dart:convert';

AppointmentOrderListModel appointmentOrderListModelFromJson(String str) => AppointmentOrderListModel.fromJson(json.decode(str));

String appointmentOrderListModelToJson(AppointmentOrderListModel data) => json.encode(data.toJson());

class AppointmentOrderListModel {
  String status;
  String message;
  Result result;

  AppointmentOrderListModel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory AppointmentOrderListModel.fromJson(Map<String, dynamic> json) => AppointmentOrderListModel(
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
  List<MyDoctorAppointment> myDoctorAppointments;
  Pagination pagination;

  Result({
    required this.myDoctorAppointments,
    required this.pagination,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    myDoctorAppointments: List<MyDoctorAppointment>.from(json["myDoctorAppointments"].map((x) => MyDoctorAppointment.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "myDoctorAppointments": List<dynamic>.from(myDoctorAppointments.map((x) => x.toJson())),
    "pagination": pagination.toJson(),
  };
}

class MyDoctorAppointment {
  int id;
  String appointmentNo;
  int paymentStatus;
  int amount;
  int discount;
  int serviceCharge;
  int totalAmount;
  DateTime appointmentDate;
  String patientName;

  MyDoctorAppointment({
    required this.id,
    required this.appointmentNo,
    required this.paymentStatus,
    required this.amount,
    required this.discount,
    required this.serviceCharge,
    required this.totalAmount,
    required this.appointmentDate,
    required this.patientName,
  });

  factory MyDoctorAppointment.fromJson(Map<String, dynamic> json) => MyDoctorAppointment(
    id: json["id"],
    appointmentNo: json["appointment_no"],
    paymentStatus: json["payment_status"] ?? 0,
    amount: json["amount"],
    discount: json["discount"],
    serviceCharge: json["service_charge"],
    totalAmount: json["total_amount"],
    appointmentDate: DateTime.parse(json["appointment_date"]),
    patientName: json["patient_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "appointment_no": appointmentNo,
    "payment_status": paymentStatus,
    "amount": amount,
    "discount": discount,
    "service_charge": serviceCharge,
    "total_amount": totalAmount,
    "appointment_date": appointmentDate.toIso8601String(),
    "patient_name": patientName,
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
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
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
