import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:path/path.dart';
import 'package:async/async.dart';

import '../../api_provider/api_url.dart';


import '../../service/auth_service.dart';

class ProfileRep {


  Future profileRep() async {


    Uri url = Uri.parse( ApiUrl.myProfile,);
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",
      },
    );

    print("my resposnse repo ${response.body}");
    Map data = jsonDecode(response.body);

    return data;
  }
  Future getDistrict() async {


    Uri url = Uri.parse( ApiUrl.getDistrict,);
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",
      },
    );

    print("my resposnse repo ${response.body}");
    Map data = jsonDecode(response.body);

    return data;
  }
  Future getArea(id) async {


    Uri url = Uri.parse( ApiUrl.getArea+ id.toString(),);
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",
      },
    );

    print("my resposnse repo ${response.body}");
    Map data = jsonDecode(response.body);

    return data;
  }
  Future editNameProfileRep(name) async {


    Uri url = Uri.parse( ApiUrl.editProfile,);
    final response = await http.post(
      url,
      headers: {
        'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",
      },
      body: {
        "name": name,
        "_method" : "PUT"
      }
    );

    print("my edit profile resposnse repo ${response.body}");
    Map data = jsonDecode(response.body);

    return data;
  }
  Future editEmailProfileRep(email) async {


    Uri url = Uri.parse( ApiUrl.editProfile,);
    final response = await http.post(
        url,
        headers: {
          'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",
        },
        body: {
          "email": email,
          "_method" : "PUT"
        }
    );

    print("my edit profile resposnse repo ${response.body}");
    Map data = jsonDecode(response.body);

    return data;
  }
  Future editProfileImage(image) async {


    Uri url = Uri.parse( ApiUrl.editProfile,);
    final response = await http.post(
        url,
        headers: {
          'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",
        },
        body: {
          "photo": image,
          "_method" : "PUT"
        }
    );

    print("my edit profile resposnse repo ${response.body}");
    Map data = jsonDecode(response.body);

    return data;
  }

  uploadProfileImage({
  File? image

  }) async {

    try{
      Map<String, String> data = {

        "_method" : "PUT"
      };

      // string to uri"
      var uri = Uri.parse(ApiUrl.editProfile);

      // create multipart request
      var request = new http.MultipartRequest("POST", uri);

      // multipart that takes file
//myzoo_2023@asia

      // add file to multipart
      var stream =
      new http.ByteStream(DelegatingStream.typed(image!.openRead()));
      // get file length
      print("hlw 2");
      var length = await image!.length();
      var multipartFile = new http.MultipartFile('photo', stream, length,
          filename: basename(image.path));
      print("hlw 4");
      request.files.add(multipartFile);


      request.fields.addAll(data);
      request.headers.addAll(
        {
          //'X-Requested-With': 'XMLHttpRequest',
          'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",
          // 'Content-Type': 'multipart/form-data',

          "Content-Type": "application/json",
          // "Accept": "application/json"

          // "Accept-Encoding": "gzip, deflate, br",
          // "Accept":"*/*",
          // "Connection": "keep-alive"
        },
      );
      // send
      http.Response response =
      await http.Response.fromStream(await request.send());
      print(response.statusCode);
      print(response.body);

      var bb = jsonDecode(response.body);
      return bb;
    }catch(e){
      print("upload images error is $e");
    }
    Map<String, String> data = {

      "_method" : "PUT"
    };

    // string to uri"
    var uri = Uri.parse(ApiUrl.editProfile);

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
//myzoo_2023@asia

    // add file to multipart
    var stream =
    new http.ByteStream(DelegatingStream.typed(image!.openRead()));
    // get file length
    print("hlw 2");
    var length = await image!.length();
    var multipartFile = new http.MultipartFile('photo', stream, length,
        filename: basename(image.path));
    print("hlw 4");
    request.files.add(multipartFile);


    request.fields.addAll(data);
    request.headers.addAll(
      {
        //'X-Requested-With': 'XMLHttpRequest',
        // "Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        // 'Content-Type': 'multipart/form-data',

        "Content-Type": "application/json",
        // "Accept": "application/json"

        // "Accept-Encoding": "gzip, deflate, br",
        // "Accept":"*/*",
        // "Connection": "keep-alive"
      },
    );
    // send
    http.Response response =
    await http.Response.fromStream(await request.send());
    print(response.statusCode);
    print(response.body);

    var bb = jsonDecode(response.body);
    return bb;
  }
}
