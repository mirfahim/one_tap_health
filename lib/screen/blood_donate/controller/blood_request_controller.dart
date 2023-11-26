import 'dart:async';

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
import 'package:one_tap_health/screen/pathology_test/view/ssl_commcerce.dart';
import 'package:one_tap_health/screen/report/controller/report_controller.dart';
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
import '../../bmi/Screens/input_page.dart';


class BloodRequestController extends GetxController {
  //TODO: Implement LoginController
  final paymentLink = "".obs;
  final refund = false.obs;
  final privacy = false.obs;
  var dueDateController = TextEditingController().obs;
  var hospitalNameController = TextEditingController().obs;
  var patientNameController = TextEditingController().obs;
  var patientAddressController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var endDateInput = TextEditingController().obs;
  PathologyController pathologyController = Get.find();
  var searchController = TextEditingController().obs;
  final searchString = "".obs;
  final selectedGender = Gender.male.obs;
  final testCatList = <Category>[].obs;
  final activeTestList = <TestsPrice>[].obs;
  final selectedTest = <TestsPrice>[].obs;
  final previewVisible = 0.obs;
  final visible = 0.obs;
  final testName = "".obs;
  final testDes = "".obs;
  final term =  false.obs;
  final price = 0.obs;
  final grpValue = 0.obs;
  final hospitalData = HospitalListModel().obs;
  final hospitalList = <Hospital>[].obs;
  final filteredhospitalList = <Hospital>[].obs;
  final doctorScheduleList = <ScheduleByHos>[].obs;
  var reportController = Get.find<ReportController>();
  final discount = 0.obs;
  final hospitalName = "".obs;
  final hospitalId = "".obs;
  final hospitalBranch  = "".obs;
  final orderNo = "".obs;
  final message  = "".obs;
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
  DateTime futureDate = DateTime(2023, 10, 18, 23, 59, 59);
  late Timer timer;
  final  timeString = "".obs;




  @override
  void onInit() {
    pathologyTestListID.clear();
    hospitalController();
    startTimer();
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

  void setSearchText(String text) {
    searchString.value = text;
  }

  List<Hospital> get filteredHospitalList {

    return hospitalList.value!.where((hos) {
      final name = hos.name!.toLowerCase();

      final searchTerm = searchString.value.toLowerCase();

      return name.contains(searchTerm);





    }).toList();


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
    endDateInput.value.text = "${myFormat.format(selectedCheckoutDate)}";
  }
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      Duration difference = futureDate.difference(DateTime.now());
      if (difference.inSeconds <= 0) {
        timer.cancel();
        timeString.value = 'Countdown Over';
      } else {

          timeString.value =
          '${difference.inDays} days : ${difference.inHours.remainder(24)} hours : ${difference.inMinutes.remainder(60)} minutes : ${difference.inSeconds.remainder(60)} seconds';

      }
    });
  }
  List<TestsPrice> get filteredTestList {

    return activeTestList.value!.where((test) {
      final name = test.testTitle!.toLowerCase();

      final searchTerm = searchString.value.toLowerCase();

      return name.contains(searchTerm);





    }).toList();


  }
  Future<void> selectTestDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedCheckinDate,
      firstDate: DateTime.now(),
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

      print("my hospital list data start");
      if(e != null){
        var data = HospitalListModel.fromJson(e);
        hospitalData.value = data;

        hospitalList.value = data.result!.hospitals!;
        print("hospital lisy length is ${hospitalList.value.length}");

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

  callPayment() async {
    print("my cat list data 1");
    PathologyRepository().callPayment(orderId.toString()).then((e) async {
      print("my ssl response started");
      if (e != null) {
        paymentLink.value = e["ssl_pay_url"];
        print(paymentLink.value);
        Get.off(SSlWeb(paymrntLink:paymentLink.value,));

        //  Get.offAndToNamed(Routes.PAYMENTWEB);
      } else {
        print("error ++++++++++++++");
      }
    });
  }
  sendMsgWithMuthoFun() async{

    AuthRepository().sendMsgWithMuthoFun("01610242252, 01312131136", "Pathology Test Order Placed: ${orderNo.value}" ).then((e) async{
      print("hlw muthofun1");
      if(e['message']== "SMS queued successfully!"){
        print("sms success");



      }else {
        print("hlw muthofun3");

      }

      print("my login data $e");


    });
  }
  makeTestOrder(testIds) async{
    previewVisible.value ++;
    print("my cat list data 1");
    PathologyRepository().makeTestOrder(isPatient: grpValue.value.toString(), patientName: patientNameController.value.text,
        patientAddress: patientAddressController.value.text, patientAge: "32", patientMobile: "01782084391",
        testdate: selectedCheckinDate.toString(), testIDs:testIds, hospitalId: hospitalId.value).then((e) async{

      print("order data start");
      if(e != null){

        previewVisible.value = 0;
        orderId.value = e["result"]["test_order_id"];
        orderNo.value = e["result"]["order_no"];
        //orderId.value = e["result"]["test_order_id"];

        Get.offNamed(Routes.PAY);

        sendMsgWithMuthoFun();
        reportController.orderpathologyListController();
        pathologyTestListID.value.clear();

      } else {
        print("error ++++++++++++++");

        previewVisible.value = 0;

      }

    });
  }









}

