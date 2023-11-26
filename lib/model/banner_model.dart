// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  String status;
  String message;
  List<ResultBanner> result;

  BannerModel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    status: json["status"],
    message: json["message"],
    result: List<ResultBanner>.from(json["result"].map((x) => ResultBanner.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class ResultBanner {
  String image;
  String place;
  String showOnPage;

  ResultBanner({
    required this.image,
    required this.place,
    required this.showOnPage,
  });

  factory ResultBanner.fromJson(Map<String, dynamic> json) => ResultBanner(
    image: json["image"],
    place: json["place"],
    showOnPage: json["show_on_page"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "place": place,
    "show_on_page": showOnPage,
  };
}
