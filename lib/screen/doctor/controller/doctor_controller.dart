import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/model/auth_model/login_model.dart';
import 'package:one_tap_health/model/doctor/doctor_list_model.dart';
import 'package:one_tap_health/model/doctor/doctor_schedule_model.dart';
import 'package:one_tap_health/repository/auth/auth_repository.dart';
import 'package:one_tap_health/repository/auth/doctor_rep/doctor_repository.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/doctor/view/pages/make_appointment.dart';

import 'package:one_tap_health/service/auth_service.dart';


class DoctorController extends GetxController {
  //TODO: Implement LoginController

  var emailController = TextEditingController().obs;
  var passController = TextEditingController().obs;
  final visible = 0.obs;
  final doctorName = "".obs;
  final doctorDegree = "".obs;
  final doctorDescription = "".obs;
  final doctorMobile = "".obs;
  final doctorDepartment = "".obs;
  final doctorImage = "".obs;
  final doctorList = <Doctor>[].obs;
  final scheduleList = <Schedule>[].obs;
  @override
  void onInit() {
    doctorListController();
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

  doctorListController() async{
    visible.value++;
    DoctorRepository().doctorList(emailController.value.text, passController.value.text).then((e) async{

      print("my login data");
      if(e != null){
        var data = DoctorListModel.fromJson(e);

        doctorList.value = data.result!.doctors!;

      } else {
        print("error ++++++++++++++");
        visible.value = 0;

      }

    });
  }
  doctorSchedule() async{
    visible.value++;
    DoctorRepository().docotorSchedule(emailController.value.text, passController.value.text).then((e) async{

      print("my login data");
      if(e != null){
        var data = DoctorScheduleModel.fromJson(e);
        doctorName.value = data.result!.name!;
        scheduleList.value = data.result!.schedule!;
        Get.to(MakeAppointmentScreen());

      } else {
        print("error ++++++++++++++");
        visible.value = 0;

      }

    });
  }

}
