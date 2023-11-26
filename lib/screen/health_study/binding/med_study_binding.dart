import 'package:get/get.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/doctor/controller/doctor_controller.dart';
import 'package:one_tap_health/screen/health_study/controller/medicine_study_controller.dart';





class MedStudyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedStudyController>(
          () => MedStudyController(),
    );
  }
}
