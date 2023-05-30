import 'dart:async';

import 'package:get/get.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/service/auth_service.dart';



class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  @override
  Future<void> onInit() async {
    print('SplashscreenController.onInit');

    Timer(const Duration(seconds: 3), () {
      // Get.offAllNamed(Routes.BASE);
      if (Get.find<AuthService>().isAuth) {
        Get.offAllNamed(Routes.LOGIN);
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
