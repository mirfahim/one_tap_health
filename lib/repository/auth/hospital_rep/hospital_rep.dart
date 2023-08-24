import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:one_tap_health/api_provider/api_provider.dart';
import 'package:one_tap_health/api_provider/api_url.dart';
import 'package:one_tap_health/service/auth_service.dart';

class HospitalRepository {
  Future hospitalListApi() async {
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      ApiUrl.hospitalList,
      {'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",},
    );
    print("login response is $response");

    return response;
  }


  Future hospitalWiseDoctor(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      ApiUrl.doctorByHospital + id.toString(),
      {'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",},
    );
    print("login response is $response");

    return response;
  }


}
