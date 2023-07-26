import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:one_tap_health/api_provider/api_provider.dart';
import 'package:one_tap_health/api_provider/api_url.dart';

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
}
