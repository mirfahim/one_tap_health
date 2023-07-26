import 'package:get/get.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/doctor/controller/doctor_controller.dart';
import 'package:one_tap_health/screen/med_reminder/controller/med_reminder_controller.dart';




class MedReminderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedReminderController>(
          () => MedReminderController(),
    );
  }
}
