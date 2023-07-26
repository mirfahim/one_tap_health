import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/model/auth_model/login_model.dart';
import 'package:one_tap_health/repository/auth/auth_repository.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/a_home/view/home_view.dart';
import 'package:one_tap_health/screen/auth/view/profile_view.dart';
import 'package:one_tap_health/screen/profile/view/profile.dart';
import 'package:one_tap_health/service/auth_service.dart';

import '../../profile/controller/profile_controller.dart';


class HomeController extends GetxController {
  //TODO: Implement LoginController

  var emailController = TextEditingController().obs;
  var passController = TextEditingController().obs;
  final currentIndex = 0.obs;
  final landingPage = 1.obs;
  final categoryDataLoaded = false.obs;

  List<Widget> pages = [
    HomeView(),
    HomeView(),
    HomeView(),
    ProfileView(),

  ];
  final visible = 0.obs;
  @override
  void onInit() {
    Get.put(ProfileController());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  Widget get currentPage => pages[currentIndex.value];
  Future<void> changePageOutRoot(int index) async {
    currentIndex.value = index;
    await Get.offNamedUntil(Routes.BASE, (Route route) {
      if (route.settings.name == Routes.BASE) {
        return true;
      }
      return false;
    }, arguments: index);
  }
  loginController() async{
    visible.value++;
    AuthRepository().userLogin(emailController.value.text, passController.value.text).then((e) async{

      print("my login data");
      if(e != null){
        var data = LoginModel.fromJson(e);
        await Get.find<AuthService>().setUser(data);
        visible.value = 0;
        print("hlw bro ++++++++++ ${Get.find<AuthService>().isAuth.toString()}");
        Get.toNamed(Routes.HOME);
      } else {
        print("error ++++++++++++++");
        visible.value = 0;

      }

    });
  }

}
