import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/model/auth_model/login_model.dart';
import 'package:one_tap_health/model/doctor/doctor_departement_model.dart';
import 'package:one_tap_health/model/doctor/doctor_list_model.dart';
import 'package:one_tap_health/model/doctor/doctor_schedule_model.dart';
import 'package:one_tap_health/repository/auth/auth_repository.dart';
import 'package:one_tap_health/repository/auth/doctor_rep/doctor_repository.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/doctor/view/pages/appointment_time_hos.dart';
import 'package:intl/intl.dart';
import 'package:one_tap_health/screen/pathology_test/view/ssl_commcerce.dart';
import 'package:one_tap_health/screen/report/controller/report_controller.dart';
import 'package:one_tap_health/service/auth_service.dart';

import '../../../utils/ui_support.dart';


class DoctorController extends GetxController {
  //TODO: Implement LoginController

  var patientAddressController = TextEditingController().obs;
  var docSearchController = TextEditingController().obs;
  var patientNameController = TextEditingController().obs;
  var dueDateController = TextEditingController().obs;
  //var patientNameController = TextEditingController().obs;
  final visible = 0.obs;
  final currentPage = 1.obs;
  final payLoad = 0.obs;
  final payCircular = false.obs;
  final doctorModel = DoctorListModel().obs;
  final doctorName = "".obs;
  final doctorAdress = "".obs;

  final doctorHospitalName = "".obs;
  final doctorID = "".obs;
  final appointmentID = "".obs;
  final doctorDegree = "".obs;
  final doctorDescription = "".obs;
  final doctorMobile = "".obs;
  final doctorBio = "".obs;
  final docSearchString = "".obs;

  final doctorDepartment = "".obs;
  final previewVisible = 0.obs;
  final grpValue = 0.obs;
  final appointmentId = "".obs;
  final scheduleID = 0.obs;
  final doctorImage = "".obs;
  final doctorAvailableDayList = [].obs;
  final doctorList = <Doctor>[].obs;
  final allDoctorList = <Doctor>[].obs;
  final doctorDepartmentList = [].obs;
  final paymentLink = "".obs;
  final scheduleList = <Schedule>[].obs;
  final scheduleContainer = 0.obs;
  // date
  DateTime selectedCheckinDate = DateTime.now();
  DateTime selectedCheckoutDate = DateTime.now();
  var startDate = ''.obs;
  var endDate = ''.obs;
  var myFormat = DateFormat('MMMd');
  @override
  void onInit() {
    fetchNextPage();
    doctorDepartmentController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    setDocSearchText("");
    super.onClose();
  }

  doctorListController(page) async{
    visible.value++;
    DoctorRepository().doctorList(page).then((e) async{

      print("my login data");
      if(e != null){
        var data = DoctorListModel.fromJson(e);
       doctorModel.value = data ;
        doctorList.value = data.result!.doctors!;
        allDoctorList.value.addAll(data.result!.doctors!);
        currentPage.value++;
      } else {
        print("error ++++++++++++++");
        visible.value = 0;

      }

    });
  }
  Future<void> fetchNextPage() async {



    await doctorListController(currentPage.value);




  }
  doctorDepartmentController() async{
    visible.value++;
    DoctorRepository().doctorDepartementList().then((e) async{

      print("my departement data  $e");
      if(e != null){
      //  var data = DoctorDepartmentModel.fromJson(e);
        Map<String, dynamic> data = e['result'];
        doctorDepartmentList.value = data.values.toList();
        print("total department are ${doctorDepartmentList.value.length}");




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
    scheduleContainer.value++;
    DoctorRepository().docotorSchedule(doctorID.value).then((e) async{

      print("my login data");
      if(e != null){
        var data = DoctorScheduleModel.fromJson(e);
        doctorName.value = data.result!.name!;
        scheduleList.value = data.result!.schedule!;
        scheduleContainer.value = 0;
        Get.to(MakeAppointmentScreen());

      } else {
        print("error ++++++++++++++");
        scheduleContainer.value = 0;

      }

    });
  }



  // select days

  bool isSelectable(DateTime day) {
    print("day are ${doctorAvailableDayList[0]}");
    return doctorAvailableDayList.value.contains(doctorAvailableDayList[0]);
    //return ["Sunday", "Monday", "Tuesday"].contains(dayName);
  }



  callPayment() async {
    payCircular.value = true;
    payLoad.value ++ ;
    print("my appointment payment");
    DoctorRepository().callPayment(appointmentID.value.toString()).then((e) async {
      print("my ssl response started");
      if (e != null) {
        paymentLink.value = e["ssl_pay_url"];
        print(paymentLink.value);
        Get.off(SSlWeb(paymrntLink:paymentLink.value,));
        payLoad.value = 0;
        payCircular.value = false;
        //  Get.offAndToNamed(Routes.PAYMENTWEB);
      } else {
        payLoad.value = 0;
        payCircular.value = false;
        print("error ++++++++++++++");
      }
    });
  }
  sendMsgWithMuthoFun() async{
    print("sms sent from appointment");
    AuthRepository().sendMsgWithMuthoFun("01610242252, 01312131136", "Appointment Placed: ${appointmentID.value.toString()}" ).then((e) async{
      print("hlw muthofun1");
      if(e['message']== "SMS queued successfully!"){
        print("sms success");



      }else {
        print("mutho sms did not send");

      }

      print("my login data $e");


    });
  }
  void setDocSearchText(String text) {
    docSearchString.value = text;
  }
  List<Doctor> get filteredDoctors {

    return doctorList.value!.where((test) {
      final name = test.name!.toLowerCase();

      final searchTerm = docSearchString.value.toLowerCase();

      return name.contains(searchTerm);





    }).toList();


  }

  makeAppointMentOrder() async{
    scheduleContainer.value++;
    DoctorRepository().makeAppointmentOrder(
     appointment_for_other_patient: grpValue.value.toString(),    patient_name: patientNameController.value.text,    patient_mobile: patientNameController.value.text,
      patient_address: patientAddressController.value.text,
      patient_age: "32",    appointment_date: selectedCheckinDate.toString(),   schedule_id: scheduleID.value.toString() ,
    ).then((e) async{

      print("my apointment data $e");
      if(e['status'] ==  "OK"){
        scheduleContainer.value = 0;
        appointmentID.value = e['result']["doctor_appointment_id"].toString();
        Get.showSnackbar(Ui.successSnackBar(
            message: e["message"].toString(), title: 'success'.tr));
        Get.find<ReportController>().orderAppointmentListController();
        sendMsgWithMuthoFun();
        Get.offNamed(Routes.PAYAPPOINTMENT);


      } else {
        print("error ++++++++++++++");
        scheduleContainer.value = 0;
        Get.showSnackbar(Ui.errorSnackBar(
            message: e["errors"].toString(), title: 'error'.tr));
      }

    });
  }

}
