import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:one_tap_health/api_provider/api_provider.dart';
import 'package:one_tap_health/api_provider/api_url.dart';
import 'package:one_tap_health/service/auth_service.dart';

class DoctorRepository {
  Future doctorList() async {
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      ApiUrl.doctorList,
      {'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",},
    );
    print("login response is $response");

    return response;
  }

  Future docotorSchedule(String ID,) async {
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      ApiUrl.doctorSchedule + ID,
      {'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",},
    );
    print("login response is $response");

    return response;
  }

  Future makeAppointmentOrder(
      {String? appointment_for_other_patient,
      String? patient_name,
      String? patient_mobile,
      String? patient_address,
      String? patient_age,
      String? appointment_date,
      String? schedule_id}) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
      ApiUrl.makeAppointmentOrder,
        {
          "appointment_for_other_patient" : appointment_for_other_patient,
          "patient_name" :patient_name,
          "patient_mobile" :patient_mobile,
        "patient_address" :patient_address,
        "patient_age" :"32",
        "appointment_date" :appointment_date,
        "schedule_id":schedule_id,

      },
      {'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",
        'content-type': "application/json"

      },
    );
    print("make apointment response is $response");

    return response;
  }





}
