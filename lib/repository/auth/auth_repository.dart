import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:one_tap_health/api_provider/api_provider.dart';
import 'package:one_tap_health/api_provider/api_url.dart';

class AuthRepository {
  Future userLogin(String email, String pass) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
      ApiUrl.login,
      //01687835844
      //12345678
      {'username': "01782084390", 'password': "123456"},




    );
    print("login response is $response");

    return response;
  }

  Future registration({String? email, String? conPass, String? pass, String? mobile, String? address, String? birthDate, String? name}) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
      ApiUrl.signup,
      {
        'name': name,
        'email': email,
        'phone': mobile,
        'password': pass,
        'confirm_password': pass,
        'address': address,
        'birth_date':"2023-5-20",
        'user_role':"4",
      },
        //




    );
    print("login response is $response");

    return response;
  }


  Future taskAddController() async {

    Map<String, dynamic> bodyString =
      {
        "username":"01687835844",
        "password":"12345678"


    };

    Uri url = Uri.parse( ApiUrl.login,);
    final response = await http.post(
      url,
      body: jsonEncode(bodyString),
      headers: {
        "Content-Type": "application/json",
      },
    );

    print("my resposnse repo ${response.body}");
    String data = response.body;

    return response;
  }
}
