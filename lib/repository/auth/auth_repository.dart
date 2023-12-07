import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:one_tap_health/api_provider/api_provider.dart';
import 'package:one_tap_health/api_provider/api_url.dart';

class AuthRepository {
  Future userLogin(String phn, String pass) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
      ApiUrl.login,
      //01687835844
      //12345678
      {'username': phn, 'password': pass,},




    );
    print("login response is $response");

    return response;
  }
  //reset
  Future resetPass(String phn, String pass) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
      ApiUrl.reset_pass,
      //01687835844
      //12345678
      {'username': phn, 'new_password': pass, "new_confirm_password": pass},




    );
    print("login response is $response");

    return response;
  }
  Future sendMsgWithMuthoFun(String phone, String mseesage) async {
    print("otp started working");
    APIManager _manager = APIManager();
    Map body =  {
      "sender_id": "8809601003930",
      "receiver": phone,
      "message": mseesage,
      "remove_duplicate": "true",
    };
    final response = await _manager.postAPICallWithHeader(
        "https://sysadmin.muthobarta.com/api/v1/send-sms",

        {
          "sender_id": "8809601003930",
          "receiver": phone,
          "message": mseesage,
          "remove_duplicate": "true",
        },

        {
          "Authorization": "Token 59ab62e2286088aeefe0d0ccd35c9dc34af3179e",
          'content-type': 'application/json'
          //"X-Content-Type-Options": "nosniff",
          // "Referrer-Policy": "same-origin"

        }
    );
    print("otp response is $response");

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
