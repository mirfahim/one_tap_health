import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:dio/dio.dart';
import 'package:one_tap_health/api_provider/api_provider.dart';
import 'package:one_tap_health/api_provider/api_url.dart';
import 'package:one_tap_health/model/order_details_model.dart';
import 'package:one_tap_health/service/auth_service.dart';

class PathologyRepository {
  Future testCatList(String email, String pass) async {
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      ApiUrl.testCatList,
      {
        'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",
      },
    );
    print("login response is $response");

    return response;
  }
  Future myTestOrderList() async {
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      ApiUrl.myTestOrder,
      {
        'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",
      },
    );
    print("test order response is $response");

    return response;
  }
  //get report images
  Future getReportImages(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      ApiUrl.getReportImages + id.toString(),
      {
        'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",
      },
    );
    print("get report images response is $response");

    return response;
  }
  Future<OrderDetailModel> orderDetails(orderId) async {
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      ApiUrl.orderDetail + orderId,
      {
        'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",
      },
    );
    print("test order response is $response");

    return OrderDetailModel.fromJson(response);
  }
  Future myAppointmentOrderList() async {
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      ApiUrl.myAppointmentOrderList,
      {
        'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",
      },
    );
    print("appointment order response is $response");

    return response;
  }
  Future callPayment(testID) async {
    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(
      "${ApiUrl.callPayment}?test_order_id=${testID.toString()}",
      {"test_order_id": testID.toString()},
      //headerr: {'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",},
    );
    print("ssl response is $response");

    return response;
  }

  Future catWiseActiveTestList(int ID) async {
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      "${ApiUrl.catWiseActiveTest}$ID",
      {
        'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",
      },
    );
    print("login response is $response");

    return response;
  }

  Future testHospital(String id) async {
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      ApiUrl.testHospital + "$id",
      {
        'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",
      },
    );
    print("login response is $response");

    return response;
  }

//matched test
  Future costofHospitalUnderTest(List<String> id) async {
    print("hlw fahim 11111+++++++++$id");
    String allId = id.join('&test_ids[]=');
    print("hlw fahim +++++++++$allId");
    APIManager _manager = APIManager();

    print("hlw fahim +++++++++$allId");
    final response = await _manager.getWithHeader(
      "${ApiUrl.testHospital}?test_ids[]=$allId",
      {
        'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",
      },
    );
    print("login response is $response");

    return response;
  }

  // Future<void> sendPostRequestWithDio( {String? isPatient,
  //   String? patientName,
  //   String? patientMobile,
  //   String? patientAddress,
  //   String? patientAge,
  //   String? testdate,
  //   List? testIDs,
  //   String? hospitalId}) async {
  //   final dio = Dio();
  //   final url = ApiUrl.makeTestOrder; // Replace with your API endpoint
  //
  //   final formData = FormData.fromMap({
  //     'order_for_other_patient': isPatient!,
  //     'patient_name': "hlw bro" ?? "",
  //     'patient_mobile': patientMobile ?? "",
  //     'patient_address': patientAddress ?? "",
  //     'patient_age': patientAge!,
  //     'test_date': testdate!,
  //     "test_id[]": ["258", "136"],
  //     //"test_id[]": testIDs[1].toString(),
  //     'hospital_id': hospitalId!,
  //     'discount': "0",
  //     'service_charge': "0",// Replace with your list of IDs
  //   });
  //
  //   try {
  //     final response = await dio.post(url, data: formData);
  //
  //     if (response.statusCode == 200) {
  //       // Request successful
  //       print('POST request successful');
  //     } else {
  //       // Request failed
  //       print('POST request failed with status: ${response.statusCode}');
  //       print('Response data: ${response.data}');
  //     }
  //   } catch (error) {
  //     // Exception occurred
  //     print('Error sending POST request: $error');
  //   }
  // }

  Future makeTestOrder(
      {String? isPatient,
      String? patientName,
      String? patientMobile,
      String? patientAddress,
      String? patientAge,
      String? testdate,
      List? testIDs,
      String? hospitalId}) async {
    APIManager _manager = APIManager();
    testIDs!.forEach((element) {
      print(element);
      print(hospitalId.toString());
    });

    final testIdParams =
        testIDs!.map((testId) => 'test_id[]=${testId.toString()}').join('&');

    // final body = 'order_for_other_patient=$isPatient&patient_name=""&patient_mobile=""&patient_address=""&patient_age=""&test_date=$testdate&hospital_id=$hospitalId&discount="0"&service_charge="0"&$testIdParams';
//?order_for_other_patient=1&patient_name=hlw&patient_mobile=54778588&patient_address=hlw&patient_age=44&test_date=12-12-2023&test_id[]=136&test_id[]=258&hospital_id=14&discount=0&service_charge=0"
    String url = ApiUrl.makeTestOrder;
    Map<String, dynamic> a = {
      'order_for_other_patient': isPatient!,
      'patient_name': "hlw bro" ?? "",
      'patient_mobile': patientMobile ?? "",
      'patient_address': patientAddress ?? "",
      'patient_age': patientAge!,
      'test_date': testdate!,
      "test_id": testIDs,
      //"test_id[]": testIDs[1].toString(),
      'hospital_id': hospitalId!,
      'discount': "0",
      'service_charge': "0",
    };
    final response = await _manager.postAPICallWithHeader(
      url,

      a,


      {
        'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",
        'content-type': "application/json"
      },
    );
    print("order response  $response");

    return response;
  }
}
