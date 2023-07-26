import 'package:get/get.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/doctor/controller/doctor_controller.dart';

import '../controller/profile_controller.dart';




class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );
  }
}
