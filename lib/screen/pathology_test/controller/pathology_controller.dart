import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/model/auth_model/login_model.dart';
import 'package:one_tap_health/model/pathology/category_list_model.dart';
import 'package:one_tap_health/model/pathology/test_available_hospital_model.dart';
import 'package:one_tap_health/repository/auth/auth_repository.dart';
import 'package:one_tap_health/repository/auth/pathology/pathology_rep.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/service/auth_service.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import '../../../model/pathology/cat_wise_active_test_model.dart';


class PathologyController extends GetxController {
  //TODO: Implement LoginController

  var dueDateController = TextEditingController().obs;
  var passController = TextEditingController().obs;
  var patientNameController = TextEditingController().obs;
  var patientAddressController = TextEditingController().obs;
  final testCatList = <Category>[].obs;
  final activeTest = <Test>[].obs;
  final testHospitalList = <CostOfHospitalsTest>[].obs;
  final visible = 0.obs;
  final testName = "".obs;
  final testDes = "".obs;
  final price = 0.obs;
  final grpValue = 0.obs;
  final discount = 0.obs;
  final hospitalName = "".obs;
  final hospitalId = "".obs;
  final hospitalBranch = "".obs;
  final visitType = 0.obs;

  @override
  void onInit() {
    categoryListController();
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

  categoryListController() async{
    print("my cat list data 1");
    PathologyRepository().testCatList(passController.value.text, passController.value.text).then((e) async{

      print("my cat list data 2");
      if(e != null){
        var data = TestCategoryListModel.fromJson(e);
        testCatList.value = data.result!.categories!;




      } else {
        print("error ++++++++++++++");


      }

    });
  }

  categoryWiseActiveTestController(int id) async{
    print("my cat list data 1");
    PathologyRepository().catWiseActiveTestList(id).then((e) async{

      print("my cat list data start $id");
      if(e != null){
        var data = CatWiseActiveTestModel.fromJson(e);
        activeTest.value = data.result!.tests;

        Get.toNamed(Routes.ACTIVETEST);



      } else {
        print("error ++++++++++++++");


      }

    });
  }
  testHospitalCOntrollre(id) async{
    print("my cat list data 1");
    PathologyRepository().testHospital(id).then((e) async{

      print("my cat list data start");
      if(e != null){
        var data = TestAvailableHospitalModel.fromJson(e);
        testHospitalList.value = data.result!.costOfHospitalsTest!;

        Get.toNamed(Routes.TESTHOSPITAL);



      } else {
        print("error ++++++++++++++");


      }

    });
  }

  makeTestOrder() async{
    print("my cat list data 1");
    PathologyRepository().makeTestOrder(isPatient: grpValue.value.toString(), patientName: patientNameController.value.text,
      patientAddress: patientAddressController.value.text, patientAge: "32", patientMobile: "01782084391",
    testdate: DateTime.now().toString(), testId: ["7"], hospitalId: hospitalId.value).then((e) async{

      print("order data start");
      if(e != null){

        Get.toNamed(Routes.TESTSUCCESS);


      } else {
        print("error ++++++++++++++");


      }

    });
  }



  /// ssl commerce
  // void initSSLCommerz() {
  //   Sslcommerz sslcommerz = Sslcommerz(
  //       initializer: SSLCommerzInitialization(
  //         //   ipn_url: "www.ipnurl.com",
  //           multi_card_name: "visa,master,bkash",
  //           currency: SSLCurrencyType.BDT,
  //           product_category: "Food",
  //           sdkType: SSLCSdkType.TESTBOX,
  //           store_id: "your_store_id",
  //           store_passwd: "your_store_password",
  //           total_amount: "payment_amount",
  //           tran_id: "custom_transaction_id"));
  // }


}


