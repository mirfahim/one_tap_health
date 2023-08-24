import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/model/auth_model/login_model.dart';
import 'package:one_tap_health/model/pathology/category_list_model.dart';
import 'package:one_tap_health/model/pathology/test_available_hospital_model.dart';
import 'package:one_tap_health/repository/auth/auth_repository.dart';
import 'package:one_tap_health/repository/auth/pathology/pathology_rep.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/report/controller/report_controller.dart';
import 'package:one_tap_health/service/auth_service.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import '../../../model/hospital_model.dart';
import '../../../model/pathology/cat_wise_active_test_model.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:intl/intl.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../model/pathology/cost_of_hospital_under_test_model.dart';
import '../../../model/pathology/my_test_order_model.dart';
import '../../../repository/auth/hospital_rep/hospital_rep.dart';

class PathologyController extends GetxController {
  //TODO: Implement LoginController

  var dueDateController = TextEditingController().obs;
  var searchController = TextEditingController().obs;
  var passController = TextEditingController().obs;
  var patientNameController = TextEditingController().obs;
  var patientAddressController = TextEditingController().obs;
  final testCatList = <Category>[].obs;
  final myTestOrder = <MyTestOrder>[].obs;
  var reportController = Get.find<ReportController>();
  final activeTest = <Test>[].obs;
  final selectHospitalName =  "".obs;
  final matchedTest = <ResultOfTest>[].obs;
  final filterListCat = <Category>[].obs;
  final testHospitalList = <CostOfHospitalsTest>[].obs;
  final paymentLink = "".obs;
  var orderModel = <OrderListModel>[].obs ;
  final pathologyTestListID = <String>[].obs;
  final visible = 0.obs;
  final previewVisible = 0.obs;
  final testName = "".obs;
  final orderId = 0.obs;
  final testId = "".obs;
  final testDes = "".obs;
  final price = 0.obs;
  final grpValue = 0.obs;
  DateTime selectedCheckinDate = DateTime.now();
  DateTime selectedCheckoutDate = DateTime.now();
  var startDate = ''.obs;
  var endDate = ''.obs;

  var myFormat = DateFormat('MMMd');
  // hospital list
  final hospitalData = HospitalListModel().obs;
  final hospitalList = <Hospital>[].obs;
  final selectedCardIndex = 0.obs;
  // Sslcommerz sslcommerz = Sslcommerz(
  //     initializer: SSLCommerzInitialization(
  //       //   ipn_url: "www.ipnurl.com",
  //         multi_card_name: "visa,master,bkash",
  //         currency: SSLCurrencyType.BDT,
  //         product_category: "Food",
  //         sdkType: SSLCSdkType.TESTBOX,
  //         store_id: "	oneta64bbac1b2fd10",
  //         store_passwd: "123456",
  //         total_amount: 20,
  //         tran_id: "new1"));
  final discount = 0.obs;
  final hospitalName = "".obs;
  final hospitalId = "".obs;
  final hospitalBranch = "".obs;
  final visitType = 0.obs;
  final hospitalWiseTestList = <OrderListModel>[].obs;
// track order
  List<TextDto> orderList = [
    TextDto("Your order has been placed", "Fri, 25th Mar '22 - 10:47pm"),
    TextDto("Seller ha processed your order", "Sun, 27th Mar '22 - 10:19am"),
    TextDto("Your item has been picked up by courier partner.", "Tue, 29th Mar '22 - 5:00pm"),
  ];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", "Tue, 29th Mar '22 - 5:04pm"),
    TextDto("Your item has been received in the nearest hub to you.", null),
  ];

  List<TextDto> outOfDeliveryList = [
    TextDto("Your order is out for delivery", "Thu, 31th Mar '22 - 2:27pm"),
  ];

  List<TextDto> deliveredList = [
    TextDto("Your order has been delivered", "Thu, 31th Mar '22 - 3:58pm"),
  ];
  // track order end
  @override
  void onInit() {
    hospitalController();
    categoryListController();

    selectCard(0);

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

  Future<void> sslCommerzGeneralCall() async {
    Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        //Use the ipn if you have valid one, or it will fail the transaction.
        ipn_url: "https://www.onetaphealth.com",
        multi_card_name: "visa,master,bkash",
        currency: SSLCurrencyType.BDT,
        product_category: "Food",
        sdkType: SSLCSdkType.TESTBOX,

        store_id: 'oneta64bbac1b2fd10',
        store_passwd: "123456",
        total_amount: 20,
        tran_id: "1231123131212",
      ),
    );
    try {
      SSLCTransactionInfoModel result = await sslcommerz.payNow();

      if (result.status!.toLowerCase() == "failed") {
        Fluttertoast.showToast(
          msg: "Transaction is Failed....",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        print("Transaction is Failed.... ${result.aPIConnect}____________");
      } else if (result.status!.toLowerCase() == "closed") {
        Fluttertoast.showToast(
          msg: "SDK Closed by User",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        print("Transaction is closed by user.... ____________");
      } else {
        Fluttertoast.showToast(
            msg:
                "Transaction is ${result.status} and Amount is ${result.amount}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Transaction is working.... ____________");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  searchListController(String query) {
    if (query.isEmpty) {
      categoryListController();
    } else {
      filterListCat.value = testCatList
          .where(
              (item) => item.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  addOrRemoveDataInTestList(id) {
    if (pathologyTestListID.contains(id)) {
      pathologyTestListID.remove(id);
    } else {
      pathologyTestListID.add(id);
    }
  }
  void selectCard(int index) {
    selectedCardIndex.value = index;
  }


  callPayment() async {
    print("my cat list data 1");
    PathologyRepository().callPayment(orderId.value.toString()).then((e) async {
      print("my ssl response started");
      if (e != null) {
        paymentLink.value = e["ssl_pay_url"];
        print(paymentLink.value);
        Get.offAndToNamed(Routes.PAYMENTWEB);
      } else {
        print("error ++++++++++++++");
      }
    });
  }

  categoryListController() async {
    print("my cat list data 1");
    PathologyRepository()
        .testCatList(passController.value.text, passController.value.text)
        .then((e) async {
      print("my cat list data 2");
      if (e != null) {
        var data = TestCategoryListModel.fromJson(e);
        testCatList.value = data.result!.categories!;
      } else {
        print("error ++++++++++++++");
      }
    });
  }



  categoryWiseActiveTestController(int id) async {
    print("my cat list data 1");
    PathologyRepository().catWiseActiveTestList(id).then((e) async {
      print("my cat list data start $id");
      if (e != null) {
        var data = CatWiseActiveTestModel.fromJson(e);
        activeTest.value = data.result!.tests;

        Get.toNamed(Routes.ACTIVETEST);
      } else {
        print("error ++++++++++++++");
      }
    });
  }
// hospital List

  hospitalController() async {
    print("my cat list data 1");
    HospitalRepository().hospitalListApi().then((e) async {
      print("my cat list data start");
      if (e != null) {
        var data = HospitalListModel.fromJson(e);
        hospitalData.value = data;

        hospitalList.value = data.result!.hospitals!;

        // Get.toNamed(Routes.TESTHOSPITAL);
      } else {
        print("error ++++++++++++++");
      }
    });
  }

  getTestInfo(int testId){
    List<Test>  testName  = activeTest.where((p) => p.id == testId).toList();
    return  testName[0].title;
  }

  getHospitalID(String hosName){
    print("hlw hos${ hospitalList[0].name} name $hosName");

    List<Hospital>  hosID  = hospitalList.where((p) => p.name == hosName).toList();
    hospitalId.value = hosID[0].id.toString();
    print("hlw hos name ${hospitalId.value}");
    return  hosID[0].id;
  }
  // matched test
  costOfHospitalUnderTestController(List<String> id) async {
    print("my cat list data 1");
    PathologyRepository().costofHospitalUnderTest(pathologyTestListID.value).then((e) async {
      print("my cat list data start");
      if (e != null) {
        var data = HospitalCostOfTestListUnderTestModel.fromJson(e);
        matchedTest.value = data.result!;

        createHospitalWiseTestmatchList(matchedTest, pathologyTestListID);
        Get.toNamed(Routes.HOSPITALWISETEST);
      } else {
        print("error ++++++++++++++");
      }
    });
  }

  List<OrderListModel> createHospitalWiseTestmatchList(List<ResultOfTest> resultsList, List<String> selectedTestIds) {
    Map<String, OrderListModel> orderMap = {};

    for (var result in resultsList) {
      for (var hospital in result.hospitals) {
        String hospitalName = hospital.hospitalName;

        // Check if the hospital is selected and create/update the order entry
        if (selectedTestIds.contains(result.testId.toString())) {
          if (orderMap.containsKey(hospitalName)) {
            List<TestOrder> testIdList = orderMap[hospitalName]!.testIdList;
            testIdList.add(TestOrder(id: result.testId, name: result.test.title, price: hospital.price.toString(),discount:  hospital.discount.toString(), )); // Use any desired name
          } else {
            List<TestOrder> testIdList = [TestOrder(id: result.testId, name: result.test.title,price: hospital.price.toString(),discount:  hospital.discount.toString(), )];
            orderMap[hospitalName] = OrderListModel(hospitalName: hospitalName, testIdList: testIdList, imageUrl: hospital.hospitalPhoto);
          }
        }
      }
    }

    hospitalWiseTestList.value = orderMap.values.toList();

    return orderMap.values.toList();
  }
  testHospitalCOntrollre(id) async {
    print("my cat list data 1");
    PathologyRepository().testHospital(id).then((e) async {
      print("my cat list data start");
      if (e != null) {
        var data = TestAvailableHospitalModel.fromJson(e);
        testHospitalList.value = data.result!.costOfHospitalsTest!;

        Get.toNamed(Routes.TESTHOSPITAL);
      } else {
        print("error ++++++++++++++");
      }
    });
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

  makeTestOrder(List<int> testID, hosName) async {
    previewVisible.value ++;
    print("my cat list data 1");
    PathologyRepository()
        .makeTestOrder(
            isPatient: grpValue.value.toString(),
            patientName: "multiple test",
            patientAddress: patientAddressController.value.text,
            patientAge: "32",
            patientMobile: "01782084391",
            testdate: DateTime.now().toString(),
            testIDs: testID,
            hospitalId: getHospitalID(hosName).toString(),)
        .then((e) async {
      print("order data start");
      if (e != null) {
        previewVisible.value = 0;
        orderId.value = e["result"]["test_order_id"];

        Get.offNamed(Routes.TESTSUCCESS);
      } else {
        previewVisible.value = 0;
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

extension MyControllerExtensions on PathologyController {
  // Debounced update method using GetX's debounce
  updateSearchTextDebounced(String text) {
    debounce(searchController, (value) {
      // Update the searchText only when the user has stopped typing for a while
      searchListController(text);
    },
        time: Duration(
            milliseconds: 500)); // Adjust the debounce duration as needed
  }
}

class OrderListModel {

  String? hospitalName;
  String? imageUrl;
  List<TestOrder> testIdList ;
  OrderListModel({required this.hospitalName, this.imageUrl,this.testIdList = const []});


}


class TestOrder {
  final int id;
  final String name;
  final String price;
  final String discount;
  // Add any other properties as needed

  TestOrder({required this.id, required this.name, required this.discount, required this.price});
}