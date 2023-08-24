import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/model/auth_model/login_model.dart';
import 'package:one_tap_health/model/hospital_model.dart';
import 'package:one_tap_health/model/pathology/category_list_model.dart';
import 'package:one_tap_health/model/pathology/test_available_hospital_model.dart';
import 'package:one_tap_health/repository/auth/auth_repository.dart';
import 'package:one_tap_health/repository/auth/doctor_rep/doctor_repository.dart';
import 'package:one_tap_health/repository/auth/hospital_rep/hospital_rep.dart';
import 'package:one_tap_health/repository/auth/pathology/pathology_rep.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/hospital_list/view/hospital_details_view.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';
import 'package:one_tap_health/service/auth_service.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:intl/intl.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCAdditionalInitializer.dart';
import 'package:flutter_sslcommerz/model/SSLCCustomerInfoInitializer.dart';
import 'package:flutter_sslcommerz/model/SSLCEMITransactionInitializer.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCShipmentInfoInitializer.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/model/sslproductinitilizer/General.dart';
import 'package:flutter_sslcommerz/model/sslproductinitilizer/SSLCProductInitializer.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:one_tap_health/utils/ui_support.dart';

import '../../../model/doctor/hospital_wise_doctor_model.dart';


class HospitalController extends GetxController {
  //TODO: Implement LoginController

  var dueDateController = TextEditingController().obs;
  var passController = TextEditingController().obs;
  var patientNameController = TextEditingController().obs;
  var patientAddressController = TextEditingController().obs;
  PathologyController pathologyController = Get.find();

  final testCatList = <Category>[].obs;
  final activeTestList = <TestsPrice>[].obs;
  final selectedTest = <TestsPrice>[].obs;
  final previewVisible = 0.obs;
  final visible = 0.obs;
  final testName = "".obs;
  final testDes = "".obs;
  final price = 0.obs;
  final grpValue = 0.obs;
  final hospitalData = HospitalListModel().obs;
  final hospitalList = <Hospital>[].obs;
  final doctorScheduleList = <ScheduleByHos>[].obs;

  final discount = 0.obs;
  final hospitalName = "".obs;
  final hospitalId = "".obs;
  final hospitalBranch  = "".obs;
  final scheduleID ="".obs;
  final visitType = 0.obs;
  final orderId =0.obs;
  final pathologyTestListID = <TestsPrice>[].obs;
  //date
  DateTime selectedCheckinDate = DateTime.now();
  DateTime selectedCheckoutDate = DateTime.now();
  var startDate = ''.obs;
  var endDate = ''.obs;
  final doctorAvailableDayList = [].obs;
  var myFormat = DateFormat('MMMd');





  @override
  void onInit() {
    pathologyTestListID.clear();
   hospitalController();

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



  Future<void> selectTestDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedCheckinDate,
      firstDate: DateTime(1920, 8),
      lastDate: DateTime(2100),);
    if (picked != null && picked != selectedCheckinDate) {
      selectedCheckinDate = picked;
      //   = selectedCheckinDate;
    }
    dueDateController.value.text = "${myFormat.format(selectedCheckinDate)}";
  }
  addOrRemoveDataInTestList(TestsPrice p) {
    if (pathologyTestListID.contains(p)) {
      pathologyTestListID.remove(p);
    } else {
      pathologyTestListID.add(p);
    }
  }
  hospitalController() async{
    print("my cat list data 1");
    HospitalRepository().hospitalListApi().then((e) async{

      print("my cat list data start");
      if(e != null){
        var data = HospitalListModel.fromJson(e);
        hospitalData.value = data;

        hospitalList.value = data.result!.hospitals!;

       // Get.toNamed(Routes.TESTHOSPITAL);



      } else {
        print("error ++++++++++++++");


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
  bool isSelectable(DateTime day) {
    print("day are ${doctorAvailableDayList[0]} >>>${DateTime.saturday}>${DateTime.sunday}>${DateTime.monday}>${DateTime.tuesday}>${DateTime.wednesday}>>>>>>${DateTime.thursday}");


    return doctorAvailableDayList.value.contains(doctorAvailableDayList[0]);
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
  hospitalWiseDoctor() async{
    print("my cat list data 1");
    HospitalRepository().hospitalWiseDoctor(hospitalId.value).then((e) async{

      print("my cat list data start");
      if(e != null){
        var data = HospitalWiseDoctorModel.fromJson(e);
        //hospitalData.value = data;

        doctorScheduleList.value = data.result!.schedule;

        Get.to(HospitalDetails());


        // Get.toNamed(Routes.TESTHOSPITAL);



      } else {
        print("error ++++++++++++++");


      }

    });
  }
  makeTestOrder(testIds) async{
    print("my cat list data 1");
    PathologyRepository().makeTestOrder(isPatient: grpValue.value.toString(), patientName: patientNameController.value.text,
        patientAddress: patientAddressController.value.text, patientAge: "32", patientMobile: "01782084391",
        testdate: DateTime.now().toString(), testIDs:testIds, hospitalId: hospitalId.value).then((e) async{

      print("order data start");
      if(e != null){

        previewVisible.value = 0;
        orderId.value = e["result"]["test_order_id"];

        Get.offNamed(Routes.TESTSUCCESS);


      } else {
        print("error ++++++++++++++");


      }

    });
  }









}

