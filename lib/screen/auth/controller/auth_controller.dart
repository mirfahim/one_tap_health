import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/model/auth_model/login_model.dart';
import 'package:one_tap_health/repository/auth/auth_repository.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';
import 'package:one_tap_health/service/auth_service.dart';
import 'package:one_tap_health/utils/ui_support.dart';


class AuthController extends GetxController {
  //TODO: Implement LoginController
  final journeyDate = DateTime.now().obs;
  var emailController = TextEditingController().obs;
  var passController = TextEditingController().obs;
  var confirmPassController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var addressController = TextEditingController().obs;
  var birthDateController = TextEditingController().obs;
  var nameController = TextEditingController().obs;
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
        Get.lazyPut<PathologyController>(
              () => PathologyController(),
        );
        var data = LoginModel.fromJson(e);
        await Get.find<AuthService>().setUser(data);
        visible.value = 0;
        print("hlw bro ++++++++++ ${Get.find<AuthService>().isAuth.toString()}");
        print("hlw bro 111++++++++++ ${Get.find<AuthService>().currentUser.value.user!.name.toString()}");

        Get.offAllNamed(Routes.BASE);
      } else {
        print("error ++++++++++++++");
        visible.value = 0;

      }

    });
  }
  registerController() async{
    visible.value++;
    AuthRepository().registerRep(email: emailController.value.text, mobile: phoneController.value.text, age: phoneController.value.text, conPass: confirmPassController.value.text,
        address: addressController.value.text, name: nameController.value.text, pass: passController.value.text).then((e) async{

      print("my reg data");
      if(e["status"] == "FAIL"){

        visible.value = 0;

        Get.showSnackbar(Ui.errorSnackBar(
            message: e["errors"].toString(), title: 'error'.tr));


      } else if(e["status"] == "OK") {
        print("error ++++++++++++++");
        visible.value = 0;

        Get.showSnackbar(Ui.successSnackBar(
            message: e["message"].toString(), title: 'success'.tr));
        Get.toNamed(Routes.LOGIN);

      }

    });
  }
}
