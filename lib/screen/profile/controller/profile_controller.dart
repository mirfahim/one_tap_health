import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/model/auth_model/login_model.dart';
import 'package:one_tap_health/model/doctor/doctor_list_model.dart';
import 'package:one_tap_health/model/doctor/doctor_schedule_model.dart';
import 'package:one_tap_health/model/profile_model.dart';
import 'package:one_tap_health/repository/auth/auth_repository.dart';
import 'package:one_tap_health/repository/auth/doctor_rep/doctor_repository.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/doctor/view/pages/appointment_time_hos.dart';

import 'package:one_tap_health/service/auth_service.dart';

import '../../../repository/auth/profile_rep.dart';


class ProfileController extends GetxController {
  //TODO: Implement LoginController

  var emailController = TextEditingController().obs;
  var passController = TextEditingController().obs;
  final visible = 0.obs;
  final doctorName = "".obs;
  final doctorDegree = "".obs;
  final profileData = ProfileResult().obs;



  @override
  void onInit() {
    profileController();
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
  profileController() async{
    print("my profile data 1");
    ProfileRep().profileRep().then((e) async{

      print("my profile data 2$e");


        var data = ProfileModel.fromJson(e);
        profileData.value = data.result!;



    });
  }


}
