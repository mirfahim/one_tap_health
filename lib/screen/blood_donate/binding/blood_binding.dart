import 'package:get/get.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/a_home/controller/home_controller.dart';
import 'package:one_tap_health/screen/hospital_list/controller/hospital_list_controller.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';

import '../controller/blood_request_controller.dart';




class BloodRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BloodRequestController>(
          () => BloodRequestController(),
    );
  }
}
