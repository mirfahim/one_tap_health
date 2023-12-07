import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/model/auth_model/login_model.dart';
import 'package:one_tap_health/repository/auth/auth_repository.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';
import 'package:one_tap_health/service/auth_service.dart';
import 'package:one_tap_health/utils/ui_support.dart';
import 'dart:async';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';


class AuthController extends GetxController {
  //TODO: Implement LoginController
  StreamController<ErrorAnimationType>? pinErrorController;
  final journeyDate = DateTime.now().obs;
  var emailController = TextEditingController().obs;
  var passController = TextEditingController().obs;
  var confirmPassController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var addressController = TextEditingController().obs;
  var birthDateController = TextEditingController().obs;
  var nameController = TextEditingController().obs;
  final visible = 0.obs;
 final startTime = 0.obs;
  final lock = true.obs;
  final verifyLoad = false.obs;
  final otpOkay = false.obs;
  final otpNum = 0.obs;
  var pinCodeController = TextEditingController().obs;
  final registerToken = "".obs;
  final formKey = GlobalKey<FormState>().obs;
  // date
  DateTime? selectedDay;
  DateTime selectedCheckinDate = DateTime.now();
  DateTime selectedCheckoutDate = DateTime.now();
  var startDate = ''.obs;
  TextEditingController startDateInput = TextEditingController();
  TextEditingController endDateInput = TextEditingController();
  var myFormat = DateFormat('yyyy-MM-dd');
  var endDate = ''.obs;
  // Compress code
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;
  @override
  void onInit() {
    pinErrorController = StreamController<ErrorAnimationType>();
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

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      if(startTime.value == 0 ) {

          timer.cancel();

      }else{

          startTime.value++ ;

      }
    });
  }
  makeRandomOtpNUm(){
    var rng = new Random();
    otpNum.value =  rng.nextInt(9000) + 1000;
    print("my otp code is ${otpNum.value}");
    sendOtpWithMuthoFun() ;
  }
  checkOTP(){
   if(otpNum.value.toString() == pinCodeController.value.text){
     Get.showSnackbar(Ui.successSnackBar(
         message: "OTP code Matched",
         title: 'success'.tr));
       Get.offNamed(Routes.REGISTER);
   } else{
     Get.showSnackbar(Ui.errorSnackBar(
         message: "OTP did not match",
         title: 'error'.tr));
   }
  }

  checkOTPForForgotPass(){
    if(otpNum.value.toString() == pinCodeController.value.text){
      Get.showSnackbar(Ui.successSnackBar(
          message: "OTP code Matched",
          title: 'success'.tr));
      Get.offNamed(Routes.FORGOTPASSSCREEN);
    } else{
      Get.showSnackbar(Ui.errorSnackBar(
          message: "OTP did not match",
          title: 'error'.tr));
    }
  }
  sendOtpWithMuthoFun() async{

    AuthRepository().sendMsgWithMuthoFun(phoneController.value.text, "OneTapHealth OTP is: ${otpNum.value}" ).then((e) async{
      print("hlw muthofun1");
      if(e['message']== "SMS queued successfully!"){
        print("sms success");
        Get.showSnackbar(Ui.successSnackBar(
            message: "OTP code send",
            title: 'success'.tr));



      }else {
        print("hlw muthofun3");

      }

      print("my login data $e");


    });
  }
  Future<void> selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedCheckoutDate,
      firstDate: DateTime(1920, 8),
      lastDate: DateTime(2100),);
    if (picked != null && picked != selectedCheckoutDate) {
      selectedCheckoutDate = picked;
    }
    endDateInput.text = "${myFormat.format(selectedCheckoutDate)}";
  }
  resetPassWordController() async{
    visible.value++;
    AuthRepository().resetPass(phoneController.value.text, passController.value.text).then((e) async{

      print("my login data");
      if(e != null){
        Get.offAllNamed(Routes.LOGIN);
      } else {
        print("error ++++++++++++++");
        visible.value = 0;

      }

    });
  }
  loginController() async{
    visible.value++;
    AuthRepository().userLogin(phoneController.value.text, passController.value.text).then((e) async{

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
