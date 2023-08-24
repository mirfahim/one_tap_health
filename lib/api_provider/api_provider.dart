import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:one_tap_health/api_provider/api_exception.dart';


class APIManager {
  Future<dynamic> postAPICallWithHeader(String url, Map<String, dynamic> param, Map<String, String> headerData) async {
    print("Calling API: $url");
    print("Calling parameters: $param");

    var responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: jsonEncode(param), headers: headerData);
      print(response.body);


      responseJson = _response(response);
      print(responseJson);
    } on SocketException catch (_) {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postAPICall(String url, Map param, {Map<String,String>? headerr}) async {
    print("Calling API: $url");
    print("Calling parameters: $param");

    var responseJson;
    try {
      final response = await http.post(Uri.parse(url), body:param, headers: headerr);
      if(response.statusCode ==  200 ){
        responseJson = _response(response);
        print('APIManager.postAPICall calling in 200 ++++++');
        print(responseJson);
      } else {
        print('not in 200 ++++++++');
        return null;
      }

    } on SocketException catch (_) {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> multipartPostAPI(
      String url,
      Map<String, String> param,
      var images,
      Map<String, String> headerData,
      String parameterName,
      ) async {
    print("Calling API: $url");
    print("Calling parameters: ${param}");
    print(images);
    print(headerData);

    var responseJson;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll(param);

      print('fgdf');

      if (images.isNotEmpty) {
        print('APIManager.multipartPostAPI');
        for (var item in images) {
          print(item.runtimeType);
          String fileName = item.path.split("/").last;
          var stream = http.ByteStream(item.openRead());

          stream.cast();

          print(stream);
          // get file length

          var length = await item.length(); //imageFile is your image file

          // multipart that takes file
          var multipartFileSign = http.MultipartFile('image', stream, length, filename: fileName);

          request.files.add(multipartFileSign);
        }
      }
      if (headerData.isNotEmpty) {
        print('APIManager.multipartPostAPI 2');
        request.headers.addAll(headerData);
      }
      print('APIManager.multipartPostAPI 3');
      http.StreamedResponse streamedResponse = await request.send();
      print('APIManager.multipartPostAPI 4');
      var response = await http.Response.fromStream(streamedResponse);

      print(response.statusCode);
      responseJson = _response(response);
      print(responseJson);
    } on SocketException catch (_) {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> get(String url) async {
    print("Calling API: $url");
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);
      responseJson = _response(response);
    } on SocketException catch (_) {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getWithHeader(String url,  Map<String, String> headerData) async {
    print("Calling API: $url");
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url.toString()), headers: headerData);
      print("my getWithHeader method data response ${response.body}");
      responseJson = _response(response);
    } on SocketException catch (_) {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    print('APIManager._response');
    print(response);
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        var responseJson = json.decode(response.body.toString());
       //  BadRequestException(response.body.toString());
         return responseJson;
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException('Error occurred while communicating with Server with StatusCode: ${response.statusCode}');
    }
  }
}
