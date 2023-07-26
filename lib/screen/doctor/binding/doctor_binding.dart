import 'package:get/get.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/doctor/controller/doctor_controller.dart';




class DoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorController>(
          () => DoctorController(),
    );
  }
}
