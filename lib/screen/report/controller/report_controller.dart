import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:one_tap_health/model/auth_model/login_model.dart';
import 'package:one_tap_health/model/doctor/appointment_order_list_model.dart';
import 'package:one_tap_health/model/doctor/doctor_list_model.dart';
import 'package:one_tap_health/model/doctor/doctor_schedule_model.dart';
import 'package:one_tap_health/model/order_details_model.dart';
import 'package:one_tap_health/model/pathology/my_test_order_model.dart';
import 'package:one_tap_health/model/report/get_report_images_model.dart';
import 'package:one_tap_health/repository/auth/auth_repository.dart';
import 'package:one_tap_health/repository/auth/doctor_rep/doctor_repository.dart';
import 'package:one_tap_health/repository/auth/pathology/pathology_rep.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/doctor/view/pages/appointment_time_hos.dart';
import 'package:intl/intl.dart';
import 'package:one_tap_health/screen/pathology_test/view/ssl_commcerce.dart';
import 'package:one_tap_health/screen/report/view/test/report_progress/track_order.dart';
import 'package:one_tap_health/service/auth_service.dart';
import 'package:one_tap_health/service/lang_service.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/ui_support.dart';
import '../../profile/controller/profile_controller.dart';

class ReportController extends GetxController {
  //TODO: Implement LoginController
  final paymentLink = "".obs;
  final myTestOrder = <MyTestOrder>[].obs;
  final myAppointmentOrderList = <MyDoctorAppointment>[].obs;
  final orderDetailsList = <Detail>[].obs;
  final reportImagesList = <String>[].obs;
  final orderModel = OrderDetailModel().obs;
  final detailLoad = false.obs;
  final reportLoad = false.obs;
  final selectIndex = 0.obs;
  // track order
  final orderList = <TextDto>[
    TextDto("Your order has been placed", "Fri, 25th Mar '22 - 10:47pm"),
    TextDto("Seller ha processed your order", "Sun, 27th Mar '22 - 10:19am"),
    TextDto("Your item has been picked up by courier partner.", "Tue, 29th Mar '22 - 5:00pm"),
  ].obs;

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", "Tue, 29th Mar '22 - 5:04pm"),
    TextDto("Your item has been received in the nearest hub to you.", null),
  ].obs;

  List<TextDto> outOfDeliveryList = [
    TextDto("Your order is out for delivery", "Thu, 31th Mar '22 - 2:27pm"),
  ].obs;

  List<TextDto> deliveredList = [
    TextDto("Your order has been delivered", "Thu, 31th Mar '22 - 3:58pm"),
  ].obs;
  // track order end
  @override
  void onInit() {
    orderpathologyListController();
    orderAppointmentListController();
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

  orderpathologyListController() async {
    print("my order test data 1");
    PathologyRepository().myTestOrderList().then((e) async {
      print("my order test list data 2");
      if (e != null) {
        var data = MyTestOrderModel.fromJson(e);
        myTestOrder.value = data.result!.myTestOrders!;
      } else {
        print("error ++++++++++++++");
      }
    });
  }
  getReportImages(id) async {
    print("get report images 1");
    PathologyRepository().getReportImages(id).then((e) async {
      print("get report images");
      if (e != null) {
        var data = GetReportImagesModel.fromJson(e);
        reportImagesList.value = data.result!.testReportFile!.files;
      } else {
        print("error ++++++++++++++");
      }
    });
  }
  bangLangController() {
    return Get.find<ProfileController>().isBangla.isTrue;
  }

  orderDetailsController(
      {String? orderId,
      String? orderNo,
      BuildContext? context,
      String? totalAmont,
      String? patientName,
      String? mobile}) {
    detailLoad.value = true;
    print("my detail list data 1");
    PathologyRepository().orderDetails(orderId.toString()).then((e) async {
      print("my detail started");
      if (e.status == "OK") {
        detailLoad.value = false;
        orderDetailsList.value = e.result!.details;
        showDialog<void>(
          context: context!,
          builder: (_) => AlertDialog(
            content: Column(
              children: [
                Text('Order No: ${orderNo}'),
                Container(
                  height: MediaQuery.of(context).size.height * .5,
                  width: MediaQuery.of(context).size.width * .7,
                  child: ListView.builder(
                      itemCount: orderDetailsList.length,
                      itemBuilder: (build, i) {
                        var detais = orderDetailsList[i];
                        return Card(
                          color: AppColor.figmaRed.withOpacity(.5),
                          child: ListTile(
                            title: Text(
                              detais.testName,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            trailing: Text(
                              detais.price.toString() + " tk",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * .25,
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(.2),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bangLangController() == true
                            ? Text(
                                BangLang.bill_amount,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54),
                              )
                            : Text(
                                "Billed Amount",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54),
                              ),
                        Text(
                          "$totalAmont BDT",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColor.figmaRed),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Get.toNamed(Routes.REPORTPDFPREVIEW, arguments: [
                    orderDetailsList,
                    totalAmont.toString(),
                    patientName.toString(),
                    e.result!.mobile,
                    orderNo,
                      e.result!.hospitalName,
                  ]);
                },
                child: Text(
                  'See PDF',
                  style: TextStyle(color: AppColor.figmaRed),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Back',
                  style: TextStyle(color: AppColor.figmaRed),
                ),
              ),
            ],
          ),
        );
      } else {
        detailLoad.value = false;
        print("error ++++++++++++++");
      }
    });
  }

  callApppoinmentPayment(appopintmentId) async {
    print("my cat list data 1");
    DoctorRepository().callPayment(appopintmentId.toString()).then((e) async {
      print("my ssl response started");
      if (e != null) {
        paymentLink.value = e["ssl_pay_url"];
        print(paymentLink.value);
        Get.to(SSlWeb(
          paymrntLink: paymentLink.value,
        ));

        //  Get.offAndToNamed(Routes.PAYMENTWEB);
      } else {
        print("error ++++++++++++++");
      }
    });
  }

  callPayment(orderId) async {
    print("my cat list data 1");
    PathologyRepository().callPayment(orderId.toString()).then((e) async {
      print("my ssl response started");
      if (e != null) {
        paymentLink.value = e["ssl_pay_url"];
        print(paymentLink.value);
        Get.to(SSlWeb(
          paymrntLink: paymentLink.value,
        ));

        //  Get.offAndToNamed(Routes.PAYMENTWEB);
      } else {
        print("error ++++++++++++++");
      }
    });
  }

  orderAppointmentListController() async {
    print("my order appointment data 1");
    PathologyRepository().myAppointmentOrderList().then((e) async {
      print("my appointment  list data 2");
      if (e != null) {
        var data = AppointmentOrderListModel.fromJson(e);
        myAppointmentOrderList.value = data.result!.myDoctorAppointments!;
      } else {
        print("error ++++++++++++++");
      }
    });
  }
}


