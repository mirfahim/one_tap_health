import 'dart:async';

import 'package:get/get.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/service/auth_service.dart';



class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  @override
  Future<void> onInit() async {
    print('SplashscreenController.onInit${Get.find<AuthService>().currentUser.value.accessToken}');
    print("hlw bro 111++++++++++ ${Get.find<AuthService>().currentUser.value}");

    Timer( Duration(seconds: 3), () async {
      // Get.offAllNamed(Routes.BASE);
      if (Get.find<AuthService>().currentUser.value.accessToken == null) {
        Get.offAllNamed(Routes.LANDING);
      } else {
        Get.offAllNamed(Routes.BASE);
      }
    });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
