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
      {'username': email, 'password': pass},




    );
    print("login response is $response");

    return response;
  }

  Future registration({String? email, String? conPass, String? pass, String? mobile, String? address, String? birthDate, String? name}) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
      ApiUrl.signup,
      {
        'name': "name",
        'email': "mir11@gmail.com",
        'phone': "01782084390",
        "age": "55",
        'password': pass,
        'confirm_password': pass,
        'address': "address",
        'birth_date':"2023-5-20",
        'user_role':"4",
      },
     // headerr: {"Content-Type": "application/json"}
        //




    );
    print("reg response is $response");
    var data = response;

    return data;
  }


  Future registerRep({String? email, String? conPass, String? pass, String? mobile, String? address, String? birthDate, String? name, String? age}) async {

    Map<String, dynamic> bodyString =
    {
      'name': name,
      'email': email,
      'phone': mobile,
      "age": age,
      'password': pass,
      'confirm_password': pass,
      'address': address,
      'birth_date':"2023-5-20",
      'user_role':"4",
    };

    Uri url = Uri.parse( ApiUrl.signup,);
    final response = await http.post(
      url,
      body: jsonEncode(bodyString),
      headers: {
        "Content-Type": "application/json",
      },
    );

    print("my resposnse repo from register ${response.body}");
    Map data = jsonDecode(response.body);

    return data;
  }
}
