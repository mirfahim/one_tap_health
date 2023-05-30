import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/model/auth_model/login_model.dart';
import 'package:one_tap_health/repository/auth/auth_repository.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/service/auth_service.dart';


class AuthController extends GetxController {
  //TODO: Implement LoginController

  var emailController = TextEditingController().obs;
  var passController = TextEditingController().obs;
  final visible = 0.obs;
  @override
  void onInit() {
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

  loginController() async{
    visible.value++;
    AuthRepository().userLogin(emailController.value.text, passController.value.text).then((e) async{

      print("my login data");
      if(e != null){
        var data = LoginModel.fromJson(e);
        await Get.find<AuthService>().setUser(data);
        visible.value = 0;
        print("hlw bro ++++++++++ ${Get.find<AuthService>().isAuth.toString()}");
        Get.offAllNamed(Routes.HOME);
      } else {
        print("error ++++++++++++++");
        visible.value = 0;

      }

    });
  }
  registerController() async{
    visible.value++;
    AuthRepository().registration(emailController.value.text, passController.value.text).then((e) async{

      print("my login data");
      if(e != null){

        visible.value = 0;

        Get.offAllNamed(Routes.LOGIN);
      } else {
        print("error ++++++++++++++");
        visible.value = 0;

      }

    });
  }
}
