// To parse this JSON data, do
//
//     final myTestOrderModel = myTestOrderModelFromJson(jsonString);

import 'dart:convert';

MyTestOrderModel myTestOrderModelFromJson(String str) => MyTestOrderModel.fromJson(json.decode(str));

String myTestOrderModelToJson(MyTestOrderModel data) => json.encode(data.toJson());

class MyTestOrderModel {
  String status;
  String message;
  Result result;

  MyTestOrderModel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory MyTestOrderModel.fromJson(Map<String, dynamic> json) => MyTestOrderModel(
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
  List<MyTestOrder> myTestOrders;
  Pagination pagination;

  Result({
    required this.myTestOrders,
    required this.pagination,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    myTestOrders: List<MyTestOrder>.from(json["myTestOrders"].map((x) => MyTestOrder.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "myTestOrders": List<dynamic>.from(myTestOrders.map((x) => x.toJson())),
    "pagination": pagination.toJson(),
  };
}

class MyTestOrder {
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

  MyTestOrder({
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
  });

  factory MyTestOrder.fromJson(Map<String, dynamic> json) => MyTestOrder(
    id: json["id"],
    orderNo: json["order_no"],
    paymentStatus: json["payment_status"],
    amount: json["amount"],
    discount: json["discount"],
    serviceCharge: json["service_charge"],
    totalAmount: json["total_amount"],
    testDate: DateTime.parse(json["test_date"]),
    patientName: json["patient_name"]!,
    hospitalName: json["hospital_name"]!,
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
  };
}



class Pagination {
  String firstPageUrl;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
