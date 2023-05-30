import 'package:get/get.dart';

import 'package:one_tap_health/screen/splash/controller/splash_screen_controller.dart';



class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(
          () => SplashscreenController(),
    );
  }
}
