import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:one_tap_health/api_provider/api_provider.dart';
import 'package:one_tap_health/api_provider/api_url.dart';
import 'package:one_tap_health/service/auth_service.dart';

class PathologyRepository {
  Future testCatList(String email, String pass) async {
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      ApiUrl.testCatList,
      {'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",},
    );
    print("login response is $response");

    return response;
  }


  Future catWiseActiveTestList(int ID) async {
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      ApiUrl.catWiseActiveTest + "$ID",
      {'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",},
    );
    print("login response is $response");

    return response;
  }

  Future testHospital(int id) async {
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      ApiUrl.testHospital+"$id",
      {'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",},
    );
    print("login response is $response");

    return response;
  }

  Future makeTestOrder({String? isPatient, String? patientName,
  String? patientMobile, String? patientAddress, String? patientAge , String? testdate,List? testId, String? hospitalId }) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
      ApiUrl.makeTestOrder,
      //01687835844
      //12345678
      {'order_for_other_patient': isPatient!,
        'patient_name': patientName ?? "",
        'patient_mobile': patientMobile ?? "",
        'patient_address': patientAddress ?? "",
        'patient_age': patientAge!,
        'test_date': testdate!,
        'test_id[]': testId![0].toString(),
        'hospital_id': hospitalId!,
        'discount': "0",
        'service_charge': "0",

      },


        {'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",},





    );
    print("order response  $response");

    return response;
  }


}
