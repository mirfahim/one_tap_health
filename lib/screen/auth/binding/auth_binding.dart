import 'package:get/get.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';




class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
          () => AuthController(),
    );
  }
}
