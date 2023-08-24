import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/model/auth_model/login_model.dart';
import 'package:one_tap_health/model/doctor/doctor_list_model.dart';
import 'package:one_tap_health/model/doctor/doctor_schedule_model.dart';
import 'package:one_tap_health/repository/auth/auth_repository.dart';
import 'package:one_tap_health/repository/auth/doctor_rep/doctor_repository.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/doctor/view/pages/appointment_time_hos.dart';
import 'package:intl/intl.dart';
import 'package:one_tap_health/service/auth_service.dart';

import '../../../utils/ui_support.dart';


class DoctorController extends GetxController {
  //TODO: Implement LoginController

  var patientAddressController = TextEditingController().obs;
  var patientNameController = TextEditingController().obs;
  var dueDateController = TextEditingController().obs;
  //var patientNameController = TextEditingController().obs;
  final visible = 0.obs;
  final doctorName = "".obs;
  final doctorHospitalName = "".obs;
  final doctorID = "".obs;
  final doctorDegree = "".obs;
  final doctorDescription = "".obs;
  final doctorMobile = "".obs;
  final doctorDepartment = "".obs;
  final previewVisible = 0.obs;
  final grpValue = 0.obs;
  final scheduleID = 0.obs;
  final doctorImage = "".obs;
  final doctorAvailableDayList = [].obs;
  final doctorList = <Doctor>[].obs;
  final scheduleList = <Schedule>[].obs;

  // date
  DateTime selectedCheckinDate = DateTime.now();
  DateTime selectedCheckoutDate = DateTime.now();
  var startDate = ''.obs;
  var endDate = ''.obs;
  var myFormat = DateFormat('MMMd');
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
    DoctorRepository().doctorList().then((e) async{

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

  Future<void> selectAppointmentDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedCheckinDate,
      firstDate: DateTime.now(),
      selectableDayPredicate: isSelectable,
      //     (DateTime val) =>
      // val.weekday == 5 || val.weekday == 6 ? false : true,
      lastDate: DateTime(2100),);
    if (picked != null && picked != selectedCheckinDate) {
      selectedCheckinDate = picked;
      //   = selectedCheckinDate;
    }
    dueDateController.value.text = "${myFormat.format(selectedCheckinDate)}";
  }
  doctorSchedule() async{
    visible.value++;
    DoctorRepository().docotorSchedule(doctorID.value).then((e) async{

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



  // select days

  bool isSelectable(DateTime day) {
    print("day are ${doctorAvailableDayList[0]}");
    return doctorAvailableDayList.value.contains(doctorAvailableDayList[0]);
    //return ["Sunday", "Monday", "Tuesday"].contains(dayName);
  }





  makeAppointMentOrder() async{
    previewVisible.value++;
    DoctorRepository().makeAppointmentOrder(
     appointment_for_other_patient: grpValue.value.toString(),    patient_name: patientNameController.value.text,    patient_mobile: patientNameController.value.text,
      patient_address: patientAddressController.value.text,
      patient_age: "32",    appointment_date: selectedCheckinDate.toString(),   schedule_id: scheduleID.value.toString() ,
    ).then((e) async{

      print("my apointment data $e");
      if(e['status'] ==  "OK"){
        previewVisible.value = 0;
        Get.showSnackbar(Ui.successSnackBar(
            message: e["message"].toString(), title: 'success'.tr));
        Get.toNamed(Routes.BASE);


      } else {
        print("error ++++++++++++++");
        previewVisible.value = 0;
        Get.showSnackbar(Ui.errorSnackBar(
            message: e["errors"].toString(), title: 'error'.tr));
      }

    });
  }

}
