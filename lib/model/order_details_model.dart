// To parse this JSON data, do
//
//     final orderDetailModel = orderDetailModelFromJson(jsonString);

import 'dart:convert';

OrderDetailModel orderDetailModelFromJson(String str) => OrderDetailModel.fromJson(json.decode(str));

String orderDetailModelToJson(OrderDetailModel data) => json.encode(data.toJson());

class OrderDetailModel {
  String? status;
  String? message;
  ResultDetails? result;

  OrderDetailModel({
     this.status,
     this.message,
     this.result,
  });

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) => OrderDetailModel(
    status: json["status"],
    message: json["message"],
    result: ResultDetails.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result!.toJson(),
  };
}

class ResultDetails {
  int id;
  String orderNo;
  int paymentStatus;
  int amount;
  int discount;
  int serviceCharge;
  int totalAmount;
  DateTime testDate;
  String patientName;
  String hospitalName;
  String mobile;
  List<Detail> details;

  ResultDetails({
    required this.id,
    required this.orderNo,
    required this.paymentStatus,
    required this.amount,
    required this.discount,
    required this.serviceCharge,
    required this.totalAmount,
    required this.testDate,
    required this.patientName,
    required this.hospitalName,
    required this.details,
    required this.mobile,
  });

  factory ResultDetails.fromJson(Map<String, dynamic> json) => ResultDetails(
    id: json["id"]??0,
    orderNo: json["order_no"],
    paymentStatus: json["payment_status"],
    amount: json["amount"],
    mobile: json["patient_mobile"],
    discount: json["discount"],
    serviceCharge: json["service_charge"],
    totalAmount: json["total_amount"],
    testDate: DateTime.parse(json["test_date"]),
    patientName: json["patient_name"],
    hospitalName: json["hospital_name"],
    details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_no": orderNo,
    "payment_status": paymentStatus,
    "amount": amount,
    "discount": discount,
    "service_charge": serviceCharge,
    "total_amount": totalAmount,
    "test_date": testDate.toIso8601String(),
    "patient_name": patientName,
    "hospital_name": hospitalName,
    "patient_mobile" :mobile,
    "details": List<dynamic>.from(details.map((x) => x.toJson())),
  };
}

class Detail {
  int id;
  int price;
  int discount;
  int priceAfterDiscount;
  String testName;

  String hospitalName;
  String hospitalAddress;

  Detail({
    required this.id,
    required this.price,
    required this.discount,
    required this.priceAfterDiscount,
    required this.testName,
    required this.hospitalName,
    required this.hospitalAddress,

  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"],
    price: json["price"],
    discount: json["discount"],
    priceAfterDiscount: json["price_after_discount"],
    testName: json["test_name"],
    hospitalName: json["hospital_name"],
    hospitalAddress: json["hospital_address"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "discount": discount,
    "price_after_discount": priceAfterDiscount,
    "test_name": testName,
    "hospital_name": hospitalName,
    "hospital_address": hospitalAddress,

  };
}
